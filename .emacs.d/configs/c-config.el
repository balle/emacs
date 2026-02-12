(install-missing-packages '(flycheck-clang-analyzer))
(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      gdb-many-windows t
      gdb-show-main t
      lsp-idle-delay 0.1)  ;; clangd is fast

(defun balle-valgrind ()
  (interactive)
  (let ((cmd (read-shell-command "Valgrind-Command: " "valgrind build/")))
    (shell-command cmd))
)

(add-hook 'c-mode-hook '(lambda ()
			  (setq c-basic-offset 4
				tab-width 4
				indent-tabs-mode t
				compile-command "cmake -B build -DCMAKE_BUILD_TYPE=Debug && cmake --build build")
			 (define-key c-mode-map "\C-cc" 'compile)
			 (define-key c-mode-map "\C-cv" 'balle-valgrind)))


(with-eval-after-load 'lsp-mode
  (setq lsp-clients-clangd-args 
        '("--background-index" 
          "--clang-tidy"
          "--fallback-style=llvm"
          "--tweaks=-std=c23")))
