; latex
(load "auctex.el" nil t t)
;(require "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-electric-escapy t)
(setq-default TeX-master "../main")
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
; automatically spellcheck buffer on opening
;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq TeX-show-compilation nil)
(setq TeX-toggle-debug-boxes nil)
(setq file_line_error_style t)
(setq TeX-view-program-list '(("Acrobat" "acroread %o")))
(setq TeX-view-program-selection '((output-pdf "Acrobat")))

; outline config (zusammenklappen)
;(add-hook 'LaTeX-mode-hook '(lambda()(
;  (outline-minor-mode 1)
;  (setq outline-minor-mode-prefix “\C-c\C-o”)
;)))
;(outline-minor-mode 1)

; auto-completion
(require 'ac-math)
(add-to-list 'ac-modes 'LaTeX-mode)
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-latex ac-source-latex-commands  ac-source-math-unicode)
               ac-sources))
)

(setq LaTeX-mode-hook
 '(lambda ()
    (ac-latex-mode-setup)
    (define-key LaTeX-mode-map "\C-cu" 'LaTeX-find-matching-begin)
    (define-key LaTeX-mode-map "\C-cd" 'LaTeX-find-matching-end)
    (define-key LaTeX-mode-map "\C-ci" 'LaTeX-insert-item)
))

