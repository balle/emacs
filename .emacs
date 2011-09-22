; Load modules and configs
(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/extensions")
(add-to-list 'load-path "~/.emacs.d/extensions/org-redmine")
(add-to-list 'load-path "~/.emacs.d/extensions/ac-math")
(add-to-list 'load-path "~/.emacs.d/extensions/org-7.5/lisp")
(add-to-list 'load-path "~/.emacs.d/extensions/pony-mode")
(add-to-list 'load-path "~/.emacs.d/extensions/django-mode")
(add-to-list 'load-path "~/.emacs.d/extensions/w3/lisp")
(load-file "~/.emacs.d/extensions/emacs-for-python/epy-init.el")
(load "custom-lib")
(load "balle-lib")
(load "general-options")
(load "common-extensions")
(load "latex-config")
;(autoload 'LaTeX-mode "latex-config")
(load "python-config")
(autoload 'html-mode "django-config" "" t)
(load "spell-checking-config")
;(autoload 'python-mode "python-config" "" t)
(autoload 'xml-mode "xml-config" "" t)
(load "org-config")
(org-mode)
;(load-file "~/.emacs.d/extensions/eproject/eproject.el")
(load "macros")
(load "re-builder-with-pcre")
(setq reb-re-syntax 'perl)

(if (fboundp 'yas/load-directory)
      (yas/load-directory "~/.emacs-snippets")
      (yas/load-directory "~/.emacs.d/extensions/emacs-for-python/extensions/yasnippet/snippets")
      (yas/load-directory "~/.emacs.d/extensions/emacs-for-python/snippets/"))


; keybindings
(global-set-key "\M-+" 'enlarge-window)
(global-set-key "\M--" 'shrink-window)
(global-unset-key "\C-xm")
(global-set-key "\C-xm" 'balle-show-message-buffer)
(global-unset-key "\C-xrs")
(global-set-key "\C-xrs" 'bookmark-save)
(global-unset-key "\C-xrd")
(global-set-key "\C-xrd" 'bookmark-delete)
(global-set-key "\C-xg" 'grep-mode)
(global-unset-key "\M-,")
(global-set-key "\M-," 'balle-comment-line)
(global-set-key "\C-xU" 'undo)
(global-set-key "\C-x\C-q" 'goto-last-change)
(global-set-key "\C-xtb" 'balle-show-buy-list)
(global-set-key "\C-xtd" 'balle-show-django-list)
(global-set-key "\C-xte" 'balle-show-emacs-list)
(global-set-key "\C-xth" 'balle-show-hack-list)
(global-set-key "\C-xtn" 'balle-show-note-list)
(global-set-key "\C-xtp" 'balle-show-python-list)
(global-set-key "\C-xtr" 'balle-show-read-list)
(global-set-key "\C-xts" 'balle-show-started-list)
(global-set-key "\C-xtt" 'balle-show-todo-list)
(global-set-key "\C-xtw" 'balle-show-waiting-list)
(global-set-key "\C-xtx" 'balle-show-next-list)
(global-set-key (kbd "C-x <left>") 'next-user-buffer)
(global-set-key (kbd "C-x <right>") 'previous-user-buffer)
(global-set-key (kbd "C-c <up>") 'move-text-up)
(global-set-key (kbd "C-c <down>") 'move-text-down)
(global-set-key (kbd "C-c s") 'switch-to-buffer)
(global-set-key "\C-xü" 'babel)
(global-set-key [f1] 'magit-status)
;(global-set-key [f2] 'display-time-world)
(global-set-key [f4] 'balle-grep-todos-in-dir)
(global-set-key [f5] 'flyspell-auto-correct-word)
(global-set-key [f6] 'flyspell-goto-next-error)
(global-set-key [f7] 'balle-flyspell-add-word)
(global-set-key [f8] 'org-capture)
(global-set-key [f9] 'balle-redmine-tickets)
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)
(global-set-key (kbd "C-c a") 'auto-complete) ; for latex command auto-completion

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(diary-entry-marker (quote diary-face))
 '(ecb-create-layout-frame-width 42)
 '(ecb-layout-name "balle2")
 '(ecb-options-version "2.40")
 '(ecb-split-edit-window-after-start nil)
 '(ecb-windows-width 0.13)
 '(org-agenda-files (quote ("~/organize/TODO.org" "~/organize/projekte.org" "~/organize/emacs.org"))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(diary ((t (:background "#243d9b" :foreground "white" :bold true)))))

(load-file "~/.emacs-custom")


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
