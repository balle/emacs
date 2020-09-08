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

// code borrowed from https://www.emacswiki.org/emacs/MoveLine
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))
