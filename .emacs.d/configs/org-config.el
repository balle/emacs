(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

(setq org-agenda-files (list "~/organize/TODO.org"))
(setq org-agenda-files '("~/organize/"))
(setq org-agenda-include-diary t)
(setq org-agenda-diary-file "~/organize/termine")

(setq calendar-week-start-day 1)
(setq org-deadline-warning-days 2)
(setq appt-message-warning-time 30)
(setq appt-display-mode-line t)
(setq appt-display-format 'window)

; Capture templates for: TODO tasks, Notes, appointments
; from http://doc.norang.ca/org-mode.html
(setq org-capture-templates (quote (("t" "todo" entry (file "~/organize/TODO.org") "** TODO %?")
				    ("n" "next" entry (file "~/organize/TODO.org") "** NEXT %?")
				    ("T" "today" entry (file "~/organize/TODO.org") "** TODAY %?")
                                    ("b" "buy" entry (file "~/organize/TODO.org") "** %?   :buy:")
				    ("r" "remember" entry (file "~/organize/TODO.org") "** %?   :remember:"))))

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

(defun balle-show-remember-list ()
  (interactive)
  (org-tags-view nil "remember")
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

(defun balle-show-today-list ()
  (interactive)
  (org-todo-list "TODAY")
  (next-multiframe-window)
  (enlarge-window 10)
)

; send notifications
(defun balle-org-alarm (min-to-app new-time txt)
  (let ((process-connection-type nil)))
  (save-window-excursion
    (shell-command (concat "/usr/bin/gxmessage -center -name 'Message from Emacs' -geometry 400x200 '" txt "' &"))
  )
)

(setq appt-disp-window-function (function balle-org-alarm))

(global-set-key (kbd "C-c l") 'org-store-link)

(add-hook 'org-mode-hook '(lambda ()
                           (define-key org-mode-map (kbd "C-c l") 'org-store-link)
                           (define-key org-mode-map (kbd "C-c b") 'org-insert-structure-template)))
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

;; happily borrowed from http://stackoverflow.com/questions/10681766/emacs-org-mode-textual-reference-to-a-fileline
(defun position-to-kill-ring ()
    "Copy to the kill ring a string in the format \"file-name:line-number\"
for the current buffer's file name, and the line number at point."
    (interactive)
    (kill-new
     (format "%s::%d" (buffer-file-name) (save-restriction
					  (widen) (line-number-at-pos)))))

(org-mode)
