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
(load "ai-config")

(load "keybindings")

(load-file "~/.emacs-custom")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(package-selected-packages
   '(ollama-buddy yasnippet which-key undo-tree smex smartparens pyenv-mode paradox magit lsp-ui lsp-pyright key-chord ibuffer-vc ibuffer-tramp flycheck company bug-hunter browse-kill-ring ace-jump-mode ac-slime)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
