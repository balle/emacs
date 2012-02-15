(defun previous-user-buffer ()
  "Switch to the previous user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-user-buffer ()
  "Switch to the previous user buffer in cyclic order.\n
User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defvar my-desktop-session-dir
(concat (getenv "HOME") "/.emacs-desktop-sessions/")
"*Directory to save desktop sessions in")

(defvar my-desktop-session-name-hist nil
"Desktop session name history")

(defun project-save (&optional name)
"Save desktop with a name."
(interactive)
(unless name
(setq name (project-list "Save session as: ")))
(make-directory (concat my-desktop-session-dir name) t)
(desktop-save (concat my-desktop-session-dir name) t))

(defun project-load (&optional name)
"Read desktop with a name."
(interactive)
; kill all non-special buffer
(unless name
(setq name (project-list "Load session: ")))
(desktop-read (concat my-desktop-session-dir name)))

(defun project-list (prompt)
(completing-read prompt (and (file-exists-p my-desktop-session-dir)
(directory-files my-desktop-session-dir))
nil nil nil my-desktop-session-name-hist))

