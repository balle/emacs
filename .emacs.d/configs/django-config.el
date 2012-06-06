(add-to-list 'load-path "~/.emacs.d/extensions/auto-complete-1.3")
(require 'auto-complete-config nil t)
(require 'django-mode)
(require 'django-html-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
(setq ac-dwim t)
(ac-config-default)
(auto-complete-mode)
(add-to-list 'ac-modes 'django-mode)
(add-to-list 'ac-modes 'django-html-mode)
(add-to-list 'ac-modes 'django-html-mumamo-mode)
;(add-to-list 'ac-modes 'html-mode)
(add-to-list 'ac-modes 'nxhtml-mode)
(setq django-indent-width 4)

(load "~/.emacs.d/extensions/nxhtml/autostart.el")
(setq mumamo-background-colors nil)


;; Mumamo is making emacs 23.3 freak out:
(when (equal emacs-major-version 23)
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function)))

(add-hook 'django-html-mode-hook '(lambda ()
    (define-key django-html-mode-map "\C-c\C-d" 'django-html-close-tag)
))


