(require 'perl-completion)
(load "pde-load")

(add-hook 'cperl-mode-hook
  (lambda()         
    (perl-completion-mode t)
    (flymake-mode)
  )
)

;(add-hook 'cperl-mode-hook 'flymake-mode)

