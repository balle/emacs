(add-to-list 'load-path "~/.emacs.d/extensions/Emacs-PDE-0.2.16/lisp")

(require 'perl-completion)
(load "pde-load")

(add-hook 'cperl-mode-hook
  (lambda()
    (perl-completion-mode t)
    (flymake-mode)
  )
)

;(add-hook 'cperl-mode-hook 'flymake-mode)

