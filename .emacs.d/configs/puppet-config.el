(require 'puppet-mode)
(require 'flymake-puppet)

(add-to-list 'ac-modes 'puppet-mode)
(append ac-sources '(ac-source-semantic ac-source-yasnippet))

(add-hook 'puppet-mode-hook
          (lambda ()
            (flymake-puppet-load)))
