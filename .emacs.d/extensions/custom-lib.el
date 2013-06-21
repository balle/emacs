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

; subversion
(defun svncmdbuf (cmd &optional fn)
    "run the given svn command on the current window"
      (interactive "scmd:")
        (let
              ((buf "*svn-cmd*"))
          (if (not fn)
              (setq fn (buffer-file-name)))
          (if (shell-command (format "svn %s %s" cmd fn) buf)
              (switch-to-buffer-other-window buf))))

(defun svndiff ()
    "diff the current buffer with subversion"
      (interactive)
        (let
              ((fn (buffer-file-name)))
          (if (and fn (shell-command (format "svn diff %s" fn) "*svn-diff*"))
              (switch-to-buffer-other-window "*svn-diff*"))))

(defun svn (c)
    "run svn command tool"
      (interactive "c: (a)dd (d)iff (D)iff revision (c)ommit (l)og (r)esolve (R)evert (b)lame (u)p (x)delete")
        (case c
          (?a (svncmdbuf "add"))
          (?b (svncmdbuf "blame"))
          (?d (svncmdbuf "diff"))
          (?D (call-interactively 'sd))
          (?c (svncmdbuf (concat "commit -m \"" (read-string "checkin message:") "\"")))
          (?l (svncmdbuf "log"))
          (?u (svncmdbuf "up"))
          (?r (svncmdbuf "resolved"))
          (?x (svncmdbuf "rm"))
          (?R (if (yes-or-no-p "revert?") (svncmdbuf "revert")))
              (t (message "unknown command key %c" c)
                        )
                  )
          )

;; borrowed code from https://github.com/magnars
(defun untabify-buffer ()
    (interactive)
      (untabify (point-min) (point-max)))

(defun indent-buffer ()
    (interactive)
      (indent-region (point-min) (point-max)))

(defun cleanup-buffer-safe ()
    "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
      (interactive)
        (untabify-buffer)
          (delete-trailing-whitespace)
            (set-buffer-file-coding-system 'utf-8))

(defun cleanup-buffer ()
    "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
      (interactive)
        (cleanup-buffer-safe)
          (indent-buffer))

(defun shell-command-on-buffer ()
  "Asks for a command and executes it in inferior shell with current buffer
as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: ")
   (buffer-name)))

(defun shell-command-on-buffer-file ()
  "Asks for a command and executes it in inferior shell with current buffer filename
as input."
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (concatenate 'string (read-shell-command "Shell command on buffer: ") " " (buffer-file-name))))

(defun delete-newlines-in-region ()
  "Delete all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match " " nil t))))
