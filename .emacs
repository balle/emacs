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
(autoload 'python-mode "python-config" "Python mode" t)
(autoload 'sgml-mode "html-config" "HTML mode" t)
(autoload 'sgml-mode "django-config" "Django mode" t)
(autoload 'sql-interactive-mode "database-config" "SQL mode" t)
(autoload 'json-mode "javascript-config" "Javascript mode" t)
(autoload 'js-mode "javascript-config" "Javascript mode" t)
(add-to-list 'auto-mode-alist '("\\.cl$" . lisp-mode))
(autoload 'lisp-mode "lisp-config" "lisp mode" t)
(autoload 'latex-mode "latex-config" "Latex mode" t)
(autoload 'latex-mode "spell-checking-config" "Spell checking mode" t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(autoload 'puppet-mode "puppet-config" "puppet mode" t)

;(load "re-builder-with-pcre")
;(setq reb-re-syntax 'perl)

; keybindings
(load "keybindings")

(load-file "~/.emacs-custom")
