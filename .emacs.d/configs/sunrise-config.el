; sunrise commander as file manager
(add-to-list 'load-path "~/.emacs.d/extensions/sunrise-commander")
(require 'sunrise-commander)
(add-hook 'sr-mode-hook
          (lambda ()
               (define-key dired-mode-map (kbd "<left>") 'sr-history-prev)
               (define-key dired-mode-map (kbd "<right>") 'sr-history-next)))
