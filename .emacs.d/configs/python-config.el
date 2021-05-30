(install-missing-packages '(ctable
			    epc
			    deferred
			    jedi
			    flymake-python-pyflakes))

;; auto completion for jedi knights :)
(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)
(setq jedi:setup-keys t)

(require 'flymake)
(add-to-list 'ac-modes 'python-mode)
(add-hook 'python-mode-hook '(lambda ()
			       (eldoc-mode)
			       (flymake-mode)
	(auto-complete-mode t)))

;; use ipython as python shell
;(setq python-shell-interpreter "ipython")
;(setq python-shell-interpreter-args "")

;; auto-completion for ipython
;; borrowed from ipython.el
(defvar ipython-completion-command-string
  "print(';'.join(get_ipython().complete('%s', '%s')[1])) #PYTHON-MODE SILENT\n"
  "The string send to ipython to query for all possible completions")
(defun ipython-complete ()
  "Try to complete the python symbol before point. Only knows about the stuff
in the current *Python* session."
  (interactive)
  (let* ((ugly-return nil)
	 (sep ";")
	 (python-process (or (get-buffer-process (current-buffer))
					;XXX hack for .py buffers
			     (get-process py-which-bufname)))
	 ;; XXX currently we go backwards to find the beginning of an
	 ;; expression part; a more powerful approach in the future might be
	 ;; to let ipython have the complete line, so that context can be used
	 ;; to do things like filename completion etc.
	 (beg (save-excursion (skip-chars-backward "a-z0-9A-Z_./\-" (point-at-bol))
			      (point)))
	 (end (point))
	 (line (buffer-substring-no-properties (point-at-bol) end))
	 (pattern (buffer-substring-no-properties beg end))
	 (completions nil)
	 (completion-table nil)
	 completion
	 (comint-preoutput-filter-functions
x	  (append comint-preoutput-filter-functions
		  '(ansi-color-filter-apply
		    (lambda (string)
		      (setq ugly-return (concat ugly-return string))
		      "")))))
    (process-send-string python-process
			 (format ipython-completion-command-string pattern line))
    (accept-process-output python-process)
    (setq completions
	  (split-string (substring ugly-return 0 (position ?\n ugly-return)) sep))
					;(message (format "DEBUG completions: %S" completions))
    (setq completion-table (loop for str in completions
				 collect (list str nil)))
    (setq completion (try-completion pattern completion-table))
    (cond ((eq completion t))
	  ((null completion)
	   (message "Can't find completion for \"%s\" based on line %s" pattern line)
	   (ding))
	  ((not (string= pattern completion))
	   (delete-region (- end (length pattern)) end)
	   (insert completion))
	  (t
	   (message "Making completion list...")
	   (with-output-to-temp-buffer "*IPython Completions*"
	     (display-completion-list (all-completions pattern completion-table)))
	   (message "Making completion list...%s" "done")))))

(add-hook 'interior-python-mode '(lambda ()
       (define-key inferior-python-mode-map "\t" 'ipython-complete)))

(add-hook 'python-mode-hook '(lambda ()
	(add-hook 'before-save-hook 'delete-trailing-whitespace)
	(setq imenu-create-index-function 'python-imenu-create-index)
        (outline-minor-mode)
        ;(linum-mode t)
        (define-key python-mode-map (kbd "C-c <right>") 'balle-python-shift-right)
        (define-key python-mode-map (kbd "C-c <left>") 'balle-python-shift-left)
        (define-key python-mode-map "\C-co" 'balle-show-python-functions)
        (define-key python-mode-map "\C-cd" 'jedi:show-doc)
        (define-key python-mode-map "\C-cg" 'jedi:goto-definition)
        (define-key python-mode-map "\C-ci" 'rope-auto-import)
        (define-key python-mode-map "\C-x\C-e" 'python-shell-send-defun)
        (define-key python-mode-map "\C-ff" 'python-fill-paragraph-function)
	(global-set-key (kbd "C-c C-<up>") 'move-text-up)
	(global-set-key (kbd "C-c C-<down>") 'move-text-down)
        (setq ropemacs-autoimport-modules '("os.*" "shutil.*" "string.*" "sys.*" "logging" "logging.*" "urllib" "urllib2" "flask"))
        (setq ansi-color-for-comint-mode t)
))

;; python code checker
;;(require 'pyflakes)

;; manage python imports
(if (>= emacs-major-version 25)
  (progn
    (install-missing-packages '(pyimport)) ; python-test))
    (require 'pyimport)
    (setq pyimport-pyflakes-path "/usr/bin/pyflakes")))

    ;; run python unit tests from within emacs
    ;(require 'python-test)))

;; run pyflakes-3 with flycheck
;; code borrowed from https://github.com/Wilfred/flycheck-pyflakes/blob/master/flycheck-pyflakes.el
(require 'flycheck)
(flycheck-define-checker python-pyflakes
  "A Python syntax and style checker using the pyflakes utility.
To override the path to the pyflakes executable, set
`flycheck-python-pyflakes-executable'.
See URL `http://pypi.python.org/pypi/pyflakes'."
  :command ("/usr/local/bin/pyflakes-3" source-inplace)
  :error-patterns
  ((error line-start (file-name) ":" line ":" (message) line-end))
  :modes python-mode)

(add-to-list 'flycheck-checkers 'python-pyflakes)
