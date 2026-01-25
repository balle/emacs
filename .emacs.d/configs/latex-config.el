; latex
;(install-missing-packages '(tex-smart-umlauts ac-math))

(require 'reftex)
;(require 'preview-latex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-electric-escapy t)
;(setq-default TeX-master "../main")
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq TeX-show-compilation nil)
(setq TeX-toggle-debug-boxes nil)
(setq file_line_error_style t)
(setq TeX-view-program-list '(("Acrobat" "acroread %o")))
(setq TeX-view-program-selection '((output-pdf "Acrobat")))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq flyspell-delay 60)

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)

;(require 'tex-smart-umlauts)
;(add-hook 'LaTeX-mode-hook #'tex-smart-umlauts-decode)

(setq latex-mode-hook
 '(lambda ()
    (reftex-mode)
    (flyspell-mode)
    ;(tex-smart-umlauts-mode)
    (define-key latex-mode-map "\C-cu" 'LaTeX-find-matching-begin)
    (define-key latex-mode-map "\C-cd" 'LaTeX-find-matching-end)
    (define-key latex-mode-map "\C-ci" 'LaTeX-insert-item)
   ))

