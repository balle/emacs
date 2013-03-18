; Load modules and configs
(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-for-python/extensions")
(add-to-list 'load-path "~/.emacs.d/extensions")
(load-file "~/.emacs.d/extensions/emacs-for-python/epy-init.el")

(load "custom-lib")
(load "balle-lib")

(load "general-options")
(load "common-extensions")

(autoload 'rst-mode "rst-config" "RST mode" t)
(autoload 'c-mode "c-config" "C mode" t)
(autoload 'perl-mode "perl-config" "Perl mode" t)
(autoload 'python-mode "python-config" "Python mode" t)
(autoload 'sgml-mode "html-config" "HTML mode" t)
(autoload 'sgml-mode "django-config" "Django mode" t)
(autoload 'sql-interactive-mode "database-config" "SQL mode" t)
(autoload 'json-mode "javascript-config" "Javascript mode" t)
(autoload 'js-mode "javascript-config" "Javascript mode" t)
(autoload 'lisp-mode "lisp-config" "Lisp mode" t)
(load "org-config")
(autoload 'latex-mode "latex-config" "Latex mode" t)
(autoload 'latex-mode "spell-checking-config" "Spell checking mode" t)

(load "re-builder-with-pcre")
(setq reb-re-syntax 'perl)

; keybindings
(load "keybindings")

(load-file "~/.emacs-custom")
