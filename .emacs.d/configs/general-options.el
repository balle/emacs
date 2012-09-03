
; set undo buffer size
(setq undo-limit 500000)
(setq undo-strong-limit 1000000)

; disable tool- and scrollbar
(toggle-scroll-bar -1)
(tool-bar-mode -1)

; hide menubar
(menu-bar-mode 0)

; save desktop sessions
(desktop-save-mode 1)
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
               (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

(setq desktop-path '("~/"))
(setq desktop-dirname "~/")
(setq desktop-base-file-name ".emacs-desktop")

; save desktop on auto save hook
(defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

; delete seleted text when typing
(delete-selection-mode 1)

; prefix buffernames with dir
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; break long lines visually?
;(global-visual-line-mode 1)

; case-sensitive search and replace
; (setq case-fold-search t)
; (setq case-replace t)

; exit search mode with any key
(setq search-exit-option t)

; display line numbers in margin (fringe). Emacs 23 only.
(global-linum-mode 0)

; recent files menu entry
;(recentf-mode 1)

; remote edit method is scp per default
(setq tramp-default-method "scp")

; highlight current line
(global-hl-line-mode 1)

; highlight brackets
(show-paren-mode t)

; package manager
;(if (equal emacs-major-version 24)
;  (require 'package)
;  (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
;  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;)

; suspress warnings
(setq warning-minimum-level :error)

; dired settings
;(setq dired-listing-switches "")

; backup
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs-backup"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 3
   version-control t)       ; use versioned backups


; auto save interval
(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 300)

; outline mode (for folding)
(add-hook 'outline-minor-mode-hook
              (lambda ()
		(local-set-key "\C-c\C-o" outline-mode-prefix-map)
		(define-key outline-mode-prefix-map "a" 'show-all)
	      )
)

; suspress kill process questions
(setq kill-buffer-query-functions
 (remove 'process-kill-buffer-query-function
         kill-buffer-query-functions))

; clean normal buffers not displayed for 3 days
(setq clean-buffer-list-delay-general 3)

; clean special buffers not displayed for 3 hours
(setq clean-buffer-list-delay-special (* 3 3600))

; calendar / diary settings
(setq diary-file "~/organize/termine")
;(setq view-diary-entries-initially nil)
(setq calendar-week-start-day 1)
(setq mark-diary-entries-in-calendar t)
(setq diary-entry-marker (quote diary-face))
(setq european-calendar-style 't)
(setq calendar-latitude 48.00)
(setq calendar-longitude 7.51)
(setq european-calendar-style t)
(setq calendar-location-name "Freiburg, Germany")
(setq calendar-time-zone 60)
(setq calendar-standard-time-zone-name "GMT+1")
(setq calendar-daylight-time-zone-name "GDT")
(setq calendar-christian-all-holidays-flag t)
(setq calendar-mark-holidays-flag t)
(setq calendar-time-display-form
      '(24-hours ":" minutes (and time-zone (concat " (" time-zone ")"))))
(setq calendar-day-name-array
      ["Sonntag" "Montag" "Dienstag" "Mittwoch"
       "Donnerstag" "Freitag" "Samstag"])

(setq calendar-month-name-array
      ["Januar" "Februar" "Maerz" "April" "Mai" "Juni"
       "Juli" "August" "September" "Oktober" "November" "Dezember"])

(setq solar-n-hemi-seasons
      '("Fruehlingsanfang" "Sommeranfang" "Herbstanfang" "Winteranfang"))

(setq general-holidays
      '((holiday-fixed 1 1 "Neujahr")
        (holiday-fixed 5 1 "1. Mai")
        (holiday-fixed 10 3 "Tag der Deutschen Einheit")))

(setq christian-holidays
      '(
        (holiday-float 12 0 -4 "1. Advent" 24)
        (holiday-float 12 0 -3 "2. Advent" 24)
        (holiday-float 12 0 -2 "3. Advent" 24)
        (holiday-float 12 0 -1 "4. Advent" 24)
        (holiday-fixed 12 25 "1. Weihnachtstag")
        (holiday-fixed 12 26 "2. Weihnachtstag")
        (holiday-fixed 1 6 "Heilige Drei Knige")
        ;; Date of Easter calculation taken from holidays.el.
        (let* ((century (1+ (/ displayed-year 100)))
               (shifted-epact (% (+ 14 (* 11 (% displayed-year 19))
                                    (- (/ (* 3 century) 4))
                                    (/ (+ 5 (* 8 century)) 25)
                                    (* 30 century))
                                 30))
               (adjusted-epact (if (or (= shifted-epact 0)
                                       (and (= shifted-epact 1)
                                            (< 10 (% displayed-year 19))))
                                   (1+ shifted-epact)
                                 shifted-epact))
               (paschal-moon (- (calendar-absolute-from-gregorian
                                 (list 4 19 displayed-year))
                                adjusted-epact))
               (easter (calendar-dayname-on-or-before 0 (+ paschal-moon 7))))
          (filter-visible-calendar-holidays
           (mapcar
            (lambda (l)
              (list (calendar-gregorian-from-absolute (+ easter (car l)))
                    (nth 1 l)))
            '(
              (-48 "Rosenmontag")
              ( -2 "Karfreitag")
              (  0 "Ostersonntag")
              ( +1 "Ostermontag")
              (+39 "Christi Himmelfahrt")
              (+49 "Pfingstsonntag")
              (+50 "Pfingstmontag")
              (+60 "Fronleichnam")
              ))))
        (holiday-fixed 8 15 "Mari Himmelfahrt")
        (holiday-fixed 11 1 "Allerheiligen")
        (holiday-float 11 3 1 "Bu- und Bettag" 16)
        (holiday-float 11 0 1 "Totensonntag" 20)))

(setq calendar-holidays
      (append general-holidays local-holidays other-holidays
              christian-holidays solar-holidays))

; drucken via cups
(setq lpr-command "xpp")

(setq confirm-kill-emacs nil)
(fset 'yes-or-no-p 'y-or-n-p)
;(setq compare-ignore-case nil)
(setq debug-on-error t)

(set-face-background 'hl-line "green")

(setq sentence-end-double-space nil)
