(add-to-list 'load-path "~/.emacs.d/extensions/Emacs-PDE-0.2.16/lisp")

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(add-hook 'cperl-mode-hook 'flymake-mode)

(defun n-cperl-mode-hook ()
    (setq cperl-indent-level 4)
    (setq cperl-continued-statement-offset 0)
    (setq cperl-extra-newline-before-brace t)
    (set-face-background 'cperl-array-face "wheat")
    (set-face-background 'cperl-hash-face "wheat")
)

(require 'perl-completion)
(load "pde-load")

(add-hook 'cperl-mode-hook
  (lambda()
    (perl-completion-mode t)
    (flymake-mode)
  )
)



