(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-for-python/extensions")
(add-to-list 'load-path "~/.emacs.d/extensions")
(load-file "~/.emacs.d/extensions/emacs-for-python/epy-init.el")

(load "custom-lib")
(load "balle-lib")

(load "general-options")
(load "common-extensions")
(load "org-config")

(load "rst-config")
(autoload 'c-mode "c-config" "C mode" t)
(autoload 'perl-mode "perl-config" "Perl mode" t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;(autoload 'python-mode "python-config" "Python mode" t)
(load "python-config")
(add-to-list 'auto-mode-alist '("\\.html?$" . sgml-mode))
;(autoload 'sgml-mode "html-config" "HTML mode" t)
;(autoload 'sgml-mode "django-config" "Django mode" t)
(load "html-config")
(load "django-config")
(load "database-config")
(load "prolog-config")
;(autoload 'sql-interactive-mode "database-config" "SQL mode" t)
(autoload 'json-mode "javascript-config" "Javascript mode" t)
(autoload 'js-mode "javascript-config" "Javascript mode" t)
(add-to-list 'auto-mode-alist '("\\.cl$" . lisp-mode))
;(autoload 'lisp-mode "lisp-config" "lisp mode" t)
(load "lisp-mode")
(autoload 'latex-mode "latex-config" "Latex mode" t)
(load "spell-checking-config")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(autoload 'puppet-mode "puppet-config" "puppet mode" t)
(load "w3m-config")

;(load "re-builder-with-pcre")
;(setq reb-re-syntax 'perl)

; keybindings
(load "keybindings")

(load-file "~/.emacs-custom")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.bmk")
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
