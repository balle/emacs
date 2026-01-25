(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")  ; Logical prefix for LSP actions
  :config
  (lsp-enable-which-key-integration t)
  :hook ((python-mode . lsp-deferred)))

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-hover t))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

(add-hook 'python-mode-hook 'lsp-mode)

(use-package pyenv-mode
  :ensure t
 :init
 (add-to-list 'exec-path "~/.pyenv/")
 (setenv "WORKON_HOME" "~/.pyenv/")
 :config
 (pyenv-mode))
(add-hook 'python-mode-hook 'pyenv-mode)

(provide 'python-config)

;;; python-config.el ends here
