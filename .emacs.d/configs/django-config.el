(require 'pony-mode)
(add-hook 'pony-minor-mode-hook '(lambda ()
;	(define-key pony-minor-mode-map [f2] 'pony-syncdb)
;	(define-key pony-minor-mode-map [f3] 'balle-django-migrate)
))

(require 'flymake)
(defun flymake-html-init ()
	  (let* ((temp-file (flymake-init-create-temp-buffer-copy
	                     'flymake-create-temp-inplace))
	         (local-file (file-relative-name
	                      temp-file
	                      (file-name-directory buffer-file-name))))
	    (list "balle_tidy" (list local-file))))

;(add-to-list 'flymake-allowed-file-name-masks
;	     '("\\.html$\\|\\.htm" flymake-html-init))

(add-to-list 'flymake-err-line-patterns
	     '("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)"
	       nil 1 2 4))

(require 'django-html-mode)
;(require 'django-mode)
;(add-to-list 'ac-modes 'django-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mode))
(add-to-list 'ac-modes 'django-html-mode)

(load "~/.emacs.d/extensions/nxhtml/autostart.el")
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; Mumamo is making emacs 23.3 freak out:
(when (and (equal emacs-major-version 23)
           (equal emacs-minor-version 3))
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


