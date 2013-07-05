(add-to-list 'load-path "~/.emacs.d/extensions/emacs-ctable")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-epc")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-deferred")
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-jedi")

;(epy-setup-checker "pyflakes %f")
(epy-setup-checker "epylint %f --rcfile=~/.emacs.d/configs/pylint.rc | grep -v 'Class has no __init__ method' | grep -v '_ is not callable'")
(epy-setup-ipython)
(setq python-shell-interpreter "ipython")

(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)
(setq jedi:setup-keys t)

(add-hook 'python-mode-hook '(lambda ()
	(add-hook 'before-save-hook 'delete-trailing-whitespace)
	(setq imenu-create-index-function 'python-imenu-create-index)
        (outline-minor-mode)
        (linum-mode t)
        (global-set-key [f10] 'flymake-goto-prev-error)
        (global-set-key [f11] 'flymake-goto-next-error)
        (define-key python-mode-map (kbd "C-c <right>") 'balle-python-shift-right)
        (define-key python-mode-map (kbd "C-c <left>") 'balle-python-shift-left)
        (define-key python-mode-map "\C-co" 'balle-show-python-functions)
        (define-key python-mode-map "\C-cd" 'rope-show-calltip)
        (define-key python-mode-map "\C-ci" 'rope-auto-import)
        (define-key python-mode-map "\C-x\C-e" 'python-shell-send-defun)
        (define-key python-mode-map "\C-ff" 'python-fill-paragraph-function)
        (setq ropemacs-autoimport-modules '("os.*" "shutil.*" "string.*" "sys.*" "logging" "logging.*" "urllib" "urllib2"))
        (setq ansi-color-for-comint-mode t)
))

(setq python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
