; kill ring browser
(require 'browse-kill-ring)
(global-set-key (kbd "M-y") 'browse-kill-ring)

; X clipboard support
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; buffer move
;(require 'buffer-move)
;(global-set-key (kbd "<M-up>")     'buf-move-up)
;(global-set-key (kbd "<M-down>")   'buf-move-down)
;(global-set-key (kbd "<M-left>")   'buf-move-left)
;(global-set-key (kbd "<M-right>")  'buf-move-right)

; advaned undo
(require 'undo-tree)
(global-undo-tree-mode)

; display tabbar
(require 'tabbar)
(require 'tabbar-extension)
(tabbar-mode)

; save window configuration
;(require 'windows)
;(add-hook 'kill-emacs-hook '(lambda ()
;	(save-current-configuration)
;))
;(add-hook 'window-setup-hook '(lambda ()
;	(resume-windows)
;))

; show flymake errors in message buffer
(load-library "flymake-cursor")

; speedbar
;(require 'sr-speedbar)
;(setq sr-speedbar-right-side nil)
;(sr-speedbar-toggle)

; workgroups
;(require 'workgroups)
;(setq wg-prefix-key (kbd "C-c w"))
;(workgroups-mode 1)
;(wg-load "~/.emacs.d/workgroups")

; autopair
;(require 'autopair)
;(autopair-global-mode)

; goto last change
(require 'goto-last-change)

; highlight todo and fixme comments
;(require 'fic-ext-mode)
;(add-hook 'python-mode-hook 'turn-on-fic-ext-mode)

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

(defun balle-killall-non-special-buffers()
   (interactive)

   (dolist buffer (buffer-list)
      (with-current-buffer buffer
         (let ((file (buffer-file-name)))
            (if (not file)
 ;              (kill-buffer buffer)
            )
         )
      )
   )
)

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
