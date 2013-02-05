(setq inferior-lisp-program "/usr/bin/sbcl")
;(setq slime-net-coding-system 'utf-8-unix)
(setq lisp-indent-function 'common-lisp-indent-function)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(setq slime-startup-animation t)
(add-to-list 'load-path "~/.emacs.d/extensions/slime")
(require 'slime)

;(slime-setup '(slime-repl))
(slime-setup '(slime-fancy))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'interferior-lisp-mode-hook (lambda () (interferior-slime-mode t)))
