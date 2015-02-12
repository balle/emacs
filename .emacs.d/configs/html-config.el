(install-missing-packages '(web-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


;; (install-missing-packages '(emmet-mode
;; 			    jinja2-mode
;; 			    htmlize
;; 			    simple-httpd
;; 			    impatient-mode))

;; (require 'impatient-mode)
;; (require 'rename-sgml-tag)

;; (setq ac-dwim t)
;; (ac-config-default)
;; (auto-complete-mode)
;; (add-to-list 'ac-modes 'sgml-mode)

;; (require 'emmet-mode)
;; (require 'jinja2-mode)
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'sgml-mode-hook '(lambda ()
;;   (define-key sgml-mode-map "\C-ce" 'emmet-expand-line)
;;   (define-key sgml-mode-map "\C-c\C-r" 'rename-sgml-tag)
;;   (flycheck-mode)
;; ))

;; (defadvice sgml-delete-tag (after reindent-buffer activate)
;;   (cleanup-buffer)
;; )
