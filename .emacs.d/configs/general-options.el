; disable menu-, tool- and scrollbar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

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

(if (boundp 'desktop-auto-save-timeout)
  (setq desktop-auto-save-timeout (* 60 15)))

; save desktop on auto save hook
(defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

; automatically save bookmarks
(setq bookmark-save-flag 1)

; package repositories
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


; delete seleted text when typing
(delete-selection-mode 1)

; prefix buffernames with dir
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; display line numbers in margin (fringe). Emacs 23 only.
(global-linum-mode 0)

; highlight current line
(global-hl-line-mode 1)

; highlight brackets
(show-paren-mode t)

; remote edit method is scp per default
(setq tramp-default-method "ssh")
(setq password-cache-expiry nil)
(setq tramp-debug-buffer nil)
(setq tramp-verbose 10)

; backup
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs-backup"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 3
   version-control t)       ; use versioned backups

;;
;; dired
;;
(put 'dired-find-alternate-file 'disabled nil) ; reuse buffer
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-dwim-target t)
(setq dired-listing-switches "--group-directories-first -alh")

; auto save interval
(setq auto-save-default t)
;(setq auto-save-interval 300)
;(setq auto-save-timeout 300)

; suspress kill process questions
(setq kill-buffer-query-functions
 (remove 'process-kill-buffer-query-function
         kill-buffer-query-functions))

; drucken via cups
(setq lpr-command "xpp")

; no blinking cursor, no beep beep
(blink-cursor-mode 0)
(setq visible-bell t)

(setq warning-minimum-level :error)
(setq confirm-kill-emacs nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq debug-on-error t)
