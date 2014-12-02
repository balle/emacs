(install-missing-packages '(emmet-mode
			    jinja2-mode
			    htmlize
			    simple-httpd
			    impatient-mode))

(require 'impatient-mode)
(require 'rename-sgml-tag)

(setq ac-dwim t)
(ac-config-default)
(auto-complete-mode)
(add-to-list 'ac-modes 'sgml-mode)

(require 'emmet-mode)
(require 'jinja2-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'sgml-mode-hook '(lambda ()
  (define-key sgml-mode-map "\C-ce" 'emmet-expand-line)
  (define-key sgml-mode-map "\C-c\C-r" 'rename-sgml-tag)
  (flycheck-mode)
))

(defadvice sgml-delete-tag (after reindent-buffer activate)
  (cleanup-buffer)
)
