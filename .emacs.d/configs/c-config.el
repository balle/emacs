(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      gdb-many-windows t
      gdb-show-main t
      lsp-idle-delay 0.1)  ;; clangd is fast


(add-hook 'c-mode-hook '(lambda ()
			  (setq c-basic-offset 4
				tab-width 4
				indent-tabs-mode t
				compile-command "cmake -B build")
			  (define-key c-mode-map "\C-cc" 'compile)))


