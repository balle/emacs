(install-missing-packages '(django-html-mode))
(require 'django-html-mode)

;(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

(ac-config-default)
(auto-complete-mode)
(add-to-list 'ac-modes 'django-mode)
(add-to-list 'ac-modes 'django-html-mode)
(add-to-list 'ac-modes 'django-html-mumamo-mode)
(setq django-indent-width 4)
