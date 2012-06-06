; Load modules and configs
(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/extensions")
(add-to-list 'load-path "~/.emacs.d/extensions/magit")
(add-to-list 'load-path "~/.emacs.d/extensions/ac-math")
(add-to-list 'load-path "~/.emacs.d/extensions/auctex-11.86")
(add-to-list 'load-path "~/.emacs.d/extensions/org-7.8.03/lisp")
(add-to-list 'load-path "~/.emacs.d/extensions/org-redmine")
(add-to-list 'load-path "~/.emacs.d/extensions/django-mode")
(load-file "~/.emacs.d/extensions/emacs-for-python/epy-init.el")
(load "custom-lib")
(load "balle-lib")

(load "general-options")
(load "common-extensions")

(load "latex-config")
;(autoload 'LaTeX-mode "latex-config")
(load "python-config")
(load "django-config")
(load "database-config")
(load "javascript-config")
;(autoload 'html-mode "django-config" "" t)
(load "spell-checking-config")
(load "org-config")
(org-mode)
(load "re-builder-with-pcre")
(setq reb-re-syntax 'perl)

; keybindings
(load "keybindings")

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
