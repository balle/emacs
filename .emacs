(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/extensions")

(load "general-options")
(load "custom-lib")
(load "balle-lib")
(load "common-extensions")

(load "c-config")
(load "python-config")
(load "lisp-config")
(load "org-config")

(load "keybindings")
(load-file "~/.emacs-custom")
