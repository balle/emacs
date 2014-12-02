(install-missing-packages '(puppet-mode))
(require 'puppet-mode)

(add-to-list 'ac-modes 'puppet-mode)
(append ac-sources '(ac-source-semantic ac-source-yasnippet))
