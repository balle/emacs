; Load modules and configs
(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-for-python/extensions")
(add-to-list 'load-path "~/.emacs.d/extensions")
(add-to-list 'load-path "~/.emacs.d/extensions/magit")
(load-file "~/.emacs.d/extensions/emacs-for-python/epy-init.el")

(load "custom-lib")
(load "balle-lib")

(load "general-options")
(load "common-extensions")

(load "rst-config")
(load "c-config")
(load "perl-config")
(load "python-config")
(load "html-config")
(load "django-config")
(load "database-config")
(load "javascript-config")
(load "spell-checking-config")
(load "org-config")
(load "latex-config")
;(autoload 'LaTeX-mode "latex-config")

(load "re-builder-with-pcre")
(setq reb-re-syntax 'perl)

; keybindings
(load "keybindings")

(load-file "~/.emacs-custom")
