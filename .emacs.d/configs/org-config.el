(add-to-list 'load-path "~/.emacs.d/extensions/org-redmine")
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

(require 'org-install)
(require 'ob-tangle)

(org-babel-do-load-languages
 'org-babel-load-languages (quote ((emacs-lisp . t)
				   (sqlite . t)
				   (sh . t)
				   (python . t))))

;(setq org-agenda-files (list "~/organize/TODO.org" "~/organize/projekte.org" "~/organize/backlog.org"  "~/organize/emacs.org" "~/organize/read.org"))
(setq org-agenda-files '("~/organize/"))
(setq org-agenda-include-diary t)
(setq org-agenda-diary-file "~/organize/termine")

(setq calendar-week-start-day 1)
(setq org-deadline-warning-days 2)
(setq appt-message-warning-time 30)
(setq appt-display-mode-line t)
(setq appt-display-format 'window)

; remember clock
;(setq org-clock-persist 'history)
;(org-clock-persistence-insinuate)

; alert on clock mode if idle for 15 minutes
;(setq org-clock-idle-time 15)

; supported programming languages
;(org-babel-do-load-languages
; 'org-babel-load-languages
; '((python . t)
;   (perl . t)
;   (ruby . t)
;   (sh . t)
;   (lisp . t)
;   (emacs-lisp . t)
;))
;(setq org-confirm-babel-evaluate nil)

; org-mode redmine interface
;(require 'org-redmine)
;(setq org-redmine-template-header "[%p_n%] #%i% %s% by %as_n%")

;(defun balle-redmine-tickets ()
;  (interactive)
;  (org-redmine-anything-show-issue-all 'redmine-user)
;)

; Capture templates for: TODO tasks, Notes, appointments
; from http://doc.norang.ca/org-mode.html
(setq org-capture-templates (quote (("t" "todo" entry (file "~/organize/TODO.org") "** TODO %? \n:PROPERTIES:\n:CREATED:  <%T>\n:EXPIRY:   <%(org-insert-time-stamp (org-read-date t t \"+6m\"))>\n:END:")
                                    ("b" "buy" entry (file "~/organize/TODO.org") "** %?   :buy:")
                                    ("d" "day" entry (file "~/organize/TODO.org") "** %?   :day:")
                                    ("w" "week" entry (file "~/organize/TODO.org") "** %?   :week:")
                                    ("m" "month" entry (file "~/organize/TODO.org") "** %?   :month:")
                                    ("y" "year" entry (file "~/organize/TODO.org") "** %?   :year:")
                                    ("D" "diary" entry (file "~/organize/diary.org.gpg") "* %T %?")
				    ("e" "emacs" entry (file "~/organize/emacs.org") "** %?   :emacs:"))))

(require 'org-expiry)
(setq org-expiry-confirm-flag nil)
;(defvar org-expiry-handler-function 'org-expiry-archive-subtree)
(defun org-expiry-handler-function () (org-expiry-add-keyword "EXPIRED"))

; functions to show todos / notes / appointments
(defun balle-show-emacs-list ()
  (interactive)
  (org-tags-view nil "emacs")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-todo-list ()
  (interactive)
  (org-todo-list nil)
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-notes-list ()
  (interactive)
  (org-tags-view nil "note")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-read-list ()
  (interactive)
  (org-tags-view nil "read")
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

(defun balle-show-daily-tasks ()
  (interactive)
  (switch-to-buffer-other-window "TODO.org")
  (org-match-sparse-tree t "day")
)

(defun balle-show-weekly-tasks ()
  (interactive)
  (switch-to-buffer-other-window "TODO.org")
  (org-match-sparse-tree t "week")
)

(defun balle-show-monthly-tasks ()
  (interactive)
  (switch-to-buffer-other-window "TODO.org")
  (org-match-sparse-tree t "month")
)

(defun balle-show-yearly-tasks ()
  (interactive)
  (switch-to-buffer-other-window "TODO.org")
  (org-match-sparse-tree t "year")
)

; send notifications
(defun balle-org-alarm (min-to-app new-time txt)
  (let ((process-connection-type nil)))
  (save-window-excursion
    (shell-command (concat "/usr/bin/gxmessage -center -name 'Message from Emacs' -geometry 400x200 '" txt "' &"))
  )
)

(setq appt-disp-window-function (function balle-org-alarm))

;(add-hook 'org-mode-hook '(lambda ()
;                           (define-key org-mode-map (kbd "C-c l") 'org-store-link)
;                           (define-key org-mode-map (kbd "M-<left>") 'org-agenda-do-date-earlier)
;                           (define-key org-mode-map (kbd "M-<right>") 'org-agenda-do-date-later)))

; add schedules and deadlines to appt on save
(add-hook 'org-mode-hook '(lambda nil (
    add-hook 'before-save-hook '(lambda nil
        (org-agenda-to-appt 'refresh nil)
    )
)))
(appt-activate)
(display-time)


(require 'async)

;; happily copied from http://kitchingroup.cheme.cmu.edu/blog/2015/11/20/Asynchronously-running-python-blocks-in-org-mode/
(defun org-babel-async-execute ()
  "Run a python block at point asynchrously."
  (interactive)

  (let ((current-file (buffer-file-name))
	(uuid (org-id-uuid))
	(temporary-file-directory "./")
	(tempfile (make-temp-file "py-")))

    (org-babel-tangle '(4) tempfile)
    (org-babel-remove-result)
    (save-excursion
      (re-search-forward "#\\+END_SRC")
      (insert (format
	       "\n\n#+RESULTS: %s\n: %s"
	       (or (org-element-property :name (org-element-context))
		   "")
	       uuid)))

    (async-start
     ;; what to start
     `(lambda ()
	;; now we run the command then cleanup
	(prog1
	    (shell-command-to-string (format "python %s" ,tempfile))
	  (delete-file ,tempfile)))

     `(lambda (result)
	"Code that runs when the async function finishes."
	(save-window-excursion
	  (save-excursion
	    (save-restriction
	      (with-current-buffer (find-file-noselect ,current-file)
		(goto-char (point-min))
		(re-search-forward ,uuid)
		(beginning-of-line)
		(kill-line)
		(insert (mapconcat
			 (lambda (x)
			   (format ": %s" x))
			 (butlast (s-split "\n" result))
			                          "\n"))))))))))

;; mylyn mode
;; remember open files to tasks
;(defun org-recentf-save-and-empty ()
;    "Save and empty recentf"
;      (if (not recentf-mode)
;                (recentf-mode)
;                    (recentf-save-list)
;                        (setq recentf-list nil)
;                            (message "Recentf list reinitialized")))
;
;(defun org-recentf-dblock-update ()
;    "Insert and/or update #+BEGIN: recentf block"
;      (save-excursion
;            (org-back-to-heading)
;                (if (search-forward "#+BEGIN: recentf")
;                    (org-dblock-update)
;                          (outline-next-heading)
;                                (insert "#+BEGIN: recentf\n#+END:\n")
;                                      (search-backward "#+BEGIN")
;                                            (org-dblock-update))))
;
;(defun org-dblock-write:recentf (params)
;    "Write the RECENTF dblock."
;      (interactive)
;        (let* ((rf "(setq recentf-list %s)")
;                (rfl (format rf (prin1-to-string recentf-list))))
;              (insert "#+begin_src emacs-lisp\n" rfl
;                          "\n(recentf-load-list)\n#+end_src")))
;
;(add-hook 'org-clock-in-hook 'org-recentf-save-and-empty)
;(add-hook 'org-clock-out-hook 'org-recentf-dblock-update)

(org-mode)
