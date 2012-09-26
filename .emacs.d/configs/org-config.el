; org mode for todo lists and "project management"
(add-to-list 'load-path "~/.emacs.d/extensions/org-redmine")

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
(require 'org-install)

;(setq org-agenda-files (list "~/organize/shared/TODO.org" "~/organize/projekte.org" "~/organize/backlog.org"  "~/organize/emacs.org" "~/organize/shared/read.org"))
(setq org-agenda-files '("~/organize/" "~/organize/shared/"))
(setq org-agenda-include-diary t)
(setq org-agenda-diary-file "~/organize/termine")

(setq calendar-week-start-day 1)
(setq org-deadline-warning-days 2)
(setq appt-message-warning-time 30)
(setq appt-display-mode-line t)
(setq appt-display-format 'window)

; remember clock
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

; alert on clock mode if idle for 15 minutes
(setq org-clock-idle-time 15)

; org-mode redmine interface
(require 'org-redmine)
(setq org-redmine-template-header "[%p_n%] #%i% %s% by %as_n%")

(defun balle-redmine-tickets ()
  (interactive)
  (org-redmine-anything-show-issue-all 'redmine-user)
)

; Capture templates for: TODO tasks, Notes, appointments
; from http://doc.norang.ca/org-mode.html
(setq org-capture-templates (quote (("t" "todo" entry (file "~/organize/TODO.org") "** TODO %? ")
                                    ("b" "buy" entry (file "~/organize/TODO.org") "** %?   :buy:")
                                    ("r" "read" entry (file "~/organize/backlog.org") "** %?   :read:")
                                    ("n" "note" entry (file "~/organize/backlog.org") "** %?   :note:")
				    ("e" "emacs" entry (file "~/organize/emacs.org") "** %?   :emacs:"))))
;                                    ("a" "appointment" entry (file "~/organize/termine.org") "** %?   :appointment:
;SCHEDULED: %T" :empty-lines 1))))


;(setq org-feed-alist
;      '(("Datenterrorist"
;         "http://www.datenterrorist.de/xml-rss2.php"
;         "~/organize/feeds.org" "Datenterrorist")))


; functions to show todos / notes / appointments
(defun balle-show-todo-list ()
  (interactive)
  (org-todo-list nil)
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-notes-list ()
  (interactive)
  (balle-org-tags-view "note")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-read-list ()
  (interactive)
  (balle-org-tags-view "read")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-hack-list ()
  (interactive)
  (balle-org-tags-view "hacking")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-python-list ()
  (interactive)
  (balle-org-tags-view "python")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-waiting-list ()
  (interactive)
  (org-todo-list "WAITING")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-next-list ()
  (interactive)
  (org-todo-list "NEXT")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-started-list ()
  (interactive)
  (org-todo-list "STARTED")
  (next-multiframe-window)
  (enlarge-window 10)
)

; modified version of org-tags-view to display only
;; (defun balle-org-tags-view (match)
;;   (interactive "p")
;;   (org-compile-prefix-format 'tags)
;;   (org-set-sorting-strategy 'tags)
;;   (let* ((org-tags-match-list-sublevels
;; 	  org-tags-match-list-sublevels)
;; 	 (completion-ignore-case t)
;; 	 rtn rtnall files file pos matcher
;; 	 buffer)
;;     (setq matcher (org-make-tags-matcher match)
;; 	  match (car matcher) matcher (cdr matcher))
;;     (org-prepare-agenda (concat "TAGS " match))
;;     (setq org-agenda-query-string match)
;;     (setq org-agenda-redo-command
;; 	  (list 'balle-org-tags-view ()
;; 		(list 'if 'current-prefix-arg nil 'org-agenda-query-string)))
;;     (setq files (org-agenda-files nil 'ifmode)
;; 	  rtnall nil)
;;     (while (setq file (pop files))
;;       (catch 'nextfile
;; 	(org-check-agenda-file file)
;; 	(setq buffer (if (file-exists-p file)
;; 			 (org-get-agenda-file-buffer file)
;; 		       (error "No such file %s" file)))
;; 	(if (not buffer)
;; 	    ;; If file does not exist, error message to agenda
;; 	    (setq rtn (list
;; 		       (format "ORG-AGENDA-ERROR: No such org-file %s" file))
;; 		  rtnall (append rtnall rtn))
;; 	  (with-current-buffer buffer
;; 	    (unless (org-mode-p)
;; 	      (error "Agenda file %s is not in `org-mode'" file))
;; 	    (save-excursion
;; 	      (save-restriction
;; 		(if org-agenda-restrict
;; 		    (narrow-to-region org-agenda-restrict-begin
;; 				      org-agenda-restrict-end)
;; 		  (widen))
;; 		(setq rtn (org-scan-tags 'agenda matcher nil))
;; 		(setq rtnall (append rtnall rtn))))))))
;;     (if org-agenda-overriding-header
;; 	(insert (org-add-props (copy-sequence org-agenda-overriding-header)
;; 		    nil 'face 'org-agenda-structure) "\n")
;;       (insert "Headlines with TAGS match: ")
;;       (add-text-properties (point-min) (1- (point))
;; 			   (list 'face 'org-agenda-structure
;; 				 'short-heading
;; 				 (concat "Match: " match)))
;;       (setq pos (point))
;;       (insert match "\n")
;;       (add-text-properties pos (1- (point)) (list 'face 'org-warning))
;;       (setq pos (point))
;;       (unless org-agenda-multi
;; 	(insert "Press `C-u r' to search again with new search string\n"))
;;       (add-text-properties pos (1- (point)) (list 'face 'org-agenda-structure)))
;;     (org-agenda-mark-header-line (point-min))
;;     (when rtnall
;;       (insert (org-finalize-agenda-entries rtnall) "\n"))
;;     (goto-char (point-min))
;;     (or org-agenda-multi (org-fit-agenda-window))
;;     (add-text-properties (point-min) (point-max) '(org-agenda-type tags))
;;     (org-finalize-agenda)
;;     (setq buffer-read-only t))
;; )

; send notifications
(defun balle-org-alarm (min-to-app new-time txt)
  (let ((process-connection-type nil)))
  (save-window-excursion
    (shell-command (concat "/usr/bin/gxmessage -center -name 'Message from Emacs' -geometry 400x200 '" txt "' &"))
  )
)

(setq appt-disp-window-function (function balle-org-alarm))

; add schedules and deadlines to appt on save
;(add-hook 'org-mode-hook '(lambda nil (
;    add-hook 'before-save-hook '(lambda nil
;        (org-agenda-to-appt 'refresh nil)
;    )
;)))
(appt-activate)
(display-time)


;
; below code borrow from http://orgmode.org/worg/org-hacks.html
;
;; (defun org-time-string-to-seconds (s)
;;   "Convert a string HH:MM:SS to a number of seconds."
;;   (cond
;;    ((and (stringp s)
;;          (string-match "\\([0-9]+\\):\\([0-9]+\\):\\([0-9]+\\)" s))
;;     (let ((hour (string-to-number (match-string 1 s)))
;;           (min (string-to-number (match-string 2 s)))
;;           (sec (string-to-number (match-string 3 s))))
;;       (+ (* hour 3600) (* min 60) sec)))
;;    ((and (stringp s)
;;          (string-match "\\([0-9]+\\):\\([0-9]+\\)" s))
;;     (let ((min (string-to-number (match-string 1 s)))
;;           (sec (string-to-number (match-string 2 s))))
;;       (+ (* min 60) sec)))
;;    ((stringp s) (string-to-number s))
;;    (t s)))

;; (defun org-time-seconds-to-string (secs)
;;   "Convert a number of seconds to a time string."
;;   (cond ((>= secs 3600) (format-seconds "%h:%.2m:%.2s" secs))
;;         ((>= secs 60) (format-seconds "%m:%.2s" secs))
;;         (t (format-seconds "%s" secs))))

;; (defmacro with-time (time-output-p &rest exprs)
;;   "Evaluate an org-table formula, converting all fields that look
;; like time data to integer seconds.  If TIME-OUTPUT-P then return
;; the result as a time value."
;;   (list
;;    (if time-output-p 'org-time-seconds-to-string 'identity)
;;    (cons 'progn
;;          (mapcar
;;           (lambda (expr)
;;             `,(cons (car expr)
;;                     (mapcar
;;                      (lambda (el)
;;                        (if (listp el)
;;                            (list 'with-time nil el)
;;                          (org-time-string-to-seconds el)))
;;                      (cdr expr))))
;;           `,@exprs))))

(org-mode)