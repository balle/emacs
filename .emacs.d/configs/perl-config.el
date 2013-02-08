(add-to-list 'load-path "~/.emacs.d/extensions/Emacs-PDE-0.2.16/lisp")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-flymake-perlcritic")

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(require 'perl-completion)
(require 'perlcritic)
(load "pde-load")

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook)
(add-hook 'cperl-mode-hook 'flymake-mode)

(setq flymake-perlcritic-command
        "~/.emacs.d/extensions/emacs-flymake-perlcritic/bin/flymake_perlcritic")
(setq flymake-perlcritic-severity 1)
(require 'flymake-perlcritic)

;(add-to-list 'flymake-allowed-file-name-masks
;             (list "\\.pl\\'" (apply-partially 'flymake-command-parse "perlcritic -1 %f")))

(add-hook  'n-cperl-mode-hook
           (lambda ()
             (when (require 'auto-complete nil t) ; no error whatever auto-complete.el is not installed.
               (auto-complete-mode t)
               (make-variable-buffer-local 'ac-sources)
               (setq ac-sources
                     '(ac-source-perl-completion)))))

(defun n-cperl-mode-hook ()
    (setq cperl-indent-level 4)
    (setq cperl-continued-statement-offset 0)
    (setq cperl-extra-newline-before-brace t)
    (setq cperl-auto-newline nil)
    (setq cperl-autoindent-on-semi t)
    (set-face-background 'cperl-array-face "wheat")
    (set-face-background 'cperl-hash-face "wheat")

    (perl-completion-mode t)
    (flymake-mode t)
    (outline-minor-mode)
    (linum-mode t)
    (setq skeleton-pair t)

    (global-set-key [f10] 'flymake-goto-prev-error)
    (global-set-key [f11] 'flymake-goto-next-error)

    (global-set-key "(" 'skeleton-pair-insert-maybe)
    (global-set-key "[" 'skeleton-pair-insert-maybe)
    (global-set-key "{" 'skeleton-pair-insert-maybe)
    (global-set-key "\"" 'skeleton-pair-insert-maybe)
)
