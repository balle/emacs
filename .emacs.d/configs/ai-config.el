(install-missing-packages '(ollama-buddy))
(use-package ollama-buddy
  :bind
  ("C-c o" . ollama-buddy-role-transient-menu)
  ("C-c O" . ollama-buddy-transient-menu-wrapper))

;; dont colorize the response
(add-hook 'ollama-buddy-mode-hook (lambda () (font-lock-mode -1)))

;; set the default model
;;(setq ollama-buddy-default-model "qwen2.5-coder:7b")
