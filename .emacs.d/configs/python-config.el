(setq py-indent-offset 4)
(setq-default indent-tabs-mode nil)

;(epy-setup-checker "pyflakes %f")
;(epy-setup-checker "pep8 %f")
(epy-setup-checker "epylint %f --rcfile=~/.emacs.d/configs/pylint.rc | grep -v 'Class has no __init__ method' | grep -v '_ is not callable'")
;(epy-setup-checker "~/.emacs.d/extensions/balle_epylint.sh %f")

(add-hook 'python-mode-hook '(lambda ()
	(define-key python-mode-map "\C-c \C-d" 'python-end-of-block)
	(add-hook 'before-save-hook 'delete-trailing-whitespace)
))

(defun balle-python-shift-left ()
  (interactive)
  (let (start end bds)
    (if (and transient-mark-mode
           mark-active)
	(setq start (region-beginning) end (region-end))
      (progn
	(setq bds (bounds-of-thing-at-point 'line))
	(setq start (car bds) end (cdr bds))))
  (python-shift-left start end))
  (setq deactivate-mark nil)
)
(defun balle-python-shift-right ()
  (interactive)
  (let (start end bds)
    (if (and transient-mark-mode
           mark-active)
	(setq start (region-beginning) end (region-end))
      (progn
	(setq bds (bounds-of-thing-at-point 'line))
	(setq start (car bds) end (cdr bds))))
  (python-shift-right start end))
  (setq deactivate-mark nil)
)

(add-hook 'python-mode-hook
	  (lambda ()
	    (global-set-key [f10] 'flymake-goto-prev-error)
	    (global-set-key [f11] 'flymake-goto-next-error)
	    (define-key python-mode-map (kbd "C-c <right>") 'balle-python-shift-right)
	    (define-key python-mode-map (kbd "C-c <left>") 'balle-python-shift-left)
	    (define-key python-mode-map "\C-co" 'balle-show-python-functions)
	    (define-key python-mode-map "\C-c\C-d" 'rope-show-calltip)
	    (define-key python-mode-map "\C-ci" 'rope-auto-import)
	    (setq ropemacs-autoimport-modules '("os.*" "shutil.*" "sys.*" "logging.*" "django.*" "piston.*"))
))

(setq pdb-path '/usr/lib/python2.7/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))
