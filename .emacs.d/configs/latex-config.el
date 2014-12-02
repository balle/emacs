; latex
(install-missing-packages '(ac-math
			    tex-smart-umlauts))

(require 'reftex)
(require 'preview-latex)

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

; fold some latex code for better reading
; cool stuff from http://www.flannaghan.com/2013/01/11/tex-fold-mode
;; (add-hook 'LaTeX-mode-hook 
;;       (lambda () 
;;         (TeX-fold-mode 1)
;;         (add-hook 'find-file-hook 'TeX-fold-buffer t t)
;;         (add-hook 'after-change-functions 
;;               (lambda (start end oldlen) 
;;                 (when (= (- end start) 1)
;;                   (let ((char-point 
;;                                  (buffer-substring-no-properties 
;;                                   start end)))
;;                    (when (or (string= char-point "}")
;;                          (string= char-point "$"))
;;                     (TeX-fold-paragraph)))))
;;                t t)))

; automatically fill and indent
;(add-hook 'LaTeX-mode-hook 'LaTeX-fill-environment)

; auto-completion
(require 'ac-math)
(add-to-list 'ac-modes 'LaTeX-mode)
(add-to-list 'ac-modes 'latex-mode)

(defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands ac-source-yasnippet)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(ac-config-default)

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)

(require 'tex-smart-umlauts)
(add-hook 'LaTeX-mode-hook #'tex-smart-umlauts-decode)

(setq latex-mode-hook
 '(lambda ()
    (reftex-mode)
    (flyspell-mode)
    (ac-flyspell-workaround)
    (auto-complete-mode)
    (setq ac-delay 0.2)
    (define-key LaTeX-mode-map "\C-cu" 'LaTeX-find-matching-begin)
    (define-key LaTeX-mode-map "\C-cd" 'LaTeX-find-matching-end)
    (define-key LaTeX-mode-map "\C-ci" 'LaTeX-insert-item)
))
