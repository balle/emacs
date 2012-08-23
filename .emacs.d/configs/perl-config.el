(add-hook 'cperl-mode-hook
          (lambda()
            (load "pde-load")
            (require 'perl-completion)
            (perl-completion-mode t)))

(add-hook 'cperl-mode-hook 'flymake-mode)

