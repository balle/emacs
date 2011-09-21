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

;(require 'django-html-mode)
;(require 'django-mode)
;(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mode))
;(add-to-list 'ac-modes 'django-html-mode)

;(add-hook 'django-html-mode-hook '(lambda ()
;    (define-key django-html-mode-map "\C-c\C-d" 'django-html-close-tag)
;))


