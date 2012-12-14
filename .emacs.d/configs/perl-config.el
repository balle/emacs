(add-to-list 'load-path "~/.emacs.d/extensions/Emacs-PDE-0.2.16/lisp")
(add-to-list 'load-path "~/.emacs.d/extensions/stylish-elisp")

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(require 'stylish)
(require 'perl-completion)
(require 'perlcritic)
(load "pde-load")

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(add-hook 'cperl-mode-hook 'flymake-mode)

(defun n-cperl-mode-hook ()
    (setq cperl-indent-level 4)
    (setq cperl-continued-statement-offset 0)
    (setq cperl-extra-newline-before-brace t)
    (setq cperl-auto-newline nil)
    (setq cperl-autoindent-on-semi t)
    (set-face-background 'cperl-array-face "wheat")
    (set-face-background 'cperl-hash-face "wheat")

    (perl-completion-mode t)
    (flymake-mode)

    (linum-mode t)
    (setq skeleton-pair t)
    (global-set-key "(" 'skeleton-pair-insert-maybe)
    (global-set-key "[" 'skeleton-pair-insert-maybe)
    (global-set-key "{" 'skeleton-pair-insert-maybe)
    (global-set-key "\"" 'skeleton-pair-insert-maybe)
)
