(add-to-list 'load-path "~/.emacs.d/extensions/slime")
(require 'slime)

(setq inferior-lisp-program "/usr/bin/sbcl")
;(setq inferior-lisp-program "/usr/local/bin/clisp")

(setq slime-net-coding-system 'utf-8-unix)
(setq lisp-indent-function 'common-lisp-indent-function)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;(slime-setup '(slime-repl))
(slime-setup '(slime-fancy))

(add-to-list 'auto-mode-alist '("\\.cl$" . lisp-mode))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'interferior-lisp-mode-hook (lambda () (interferior-slime-mode t)))

(define-key slime-mode-map "\C-cx" 'slime-selector)
(define-key slime-mode-map "\C-ci" 'slime-inspect)
