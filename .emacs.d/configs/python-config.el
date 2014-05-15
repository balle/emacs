(add-to-list 'load-path "~/.emacs.d/extensions/emacs-ctable")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-epc")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-deferred")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-jedi")

;(epy-setup-checker "pyflakes %f")
;(epy-setup-checker "epylint %f --rcfile=~/.emacs.d/configs/pylint.rc | grep -v 'Class has no __init__ method' | grep -v '_ is not callable'")

;; auto completion for jedi knights :)
(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)
(setq jedi:setup-keys t)


;; use ipython as python shell
(epy-setup-ipython)
(setq python-shell-interpreter "ipython")


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
          (append comint-preoutput-filter-functions
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
(define-key inferior-python-mode-map "\t" 'ipython-complete)

(add-to-list 'ac-modes 'inferior-python-mode)
(add-hook 'inferior-python-mode-hook '(lambda ()
	(auto-complete-mode t)))

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

(setq python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
