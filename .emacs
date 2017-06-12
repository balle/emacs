
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/extensions")

(setq load-c-config nil)
(setq load-database-config nil)
(setq load-django-config nil)
(setq load-html-config nil)
(setq load-irc-config nil)
(setq load-javascript-config nil)
(setq load-latex-config nil)
(setq load-lisp-config nil)
(setq load-clojure-config nil)
(setq load-org-config nil)
(setq load-ansible-config nil)
(setq load-puppet-config nil)
(setq load-python-config nil)
(setq load-spell-checking-config nil)
(setq load-rst-config nil)
(setq load-sunrise-commander-config nil)
(setq load-terminal-config nil)
(setq load-w3m-config nil)
(setq load-calendar-config nil)
(setq load-music-config nil)

(load "general-options")
(load "custom-lib")
(load "balle-lib")
(load "common-extensions")

(load-file "~/.emacs-custom")

(if load-c-config (load "c-config"))
(if load-database-config (load "database-config"))
(if load-django-config (load "django-config"))
(if load-html-config (load "html-config"))
(if load-irc-config (load "erc-config"))
(if load-javascript-config (load "javascript-config"))
(if load-latex-config (load "latex-config"))
(if load-lisp-config (load "lisp-config"))
(if load-clojure-config (load "clojure-config"))
(if load-org-config (load "org-config"))
(if load-ansible-config (load "ansible-config"))
(if load-puppet-config (load "puppet-config"))
(if load-python-config (load "python-config"))
(if load-rst-config (load "rst-config"))
(if load-spell-checking-config (load "spell-checking-config"))
(if load-sunrise-commander-config (load "sunrise-config"))
(if load-terminal-config (load "terminal-config"))
(if load-w3m-config (load "w3m-config"))
(if load-calendar-config (load "calendar-config"))
(if load-music-config (load "emms-config"))

(load "keybindings")
(load-file "~/.emacs-custom")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.bmk")
 '(package-selected-packages
   (quote
    (binclock pomidor auto-complete-distel edts yasnippet win-switch web-mode w3m use-package undo-tree try trr tex-smart-umlauts spray spotify smex smartparens robe restclient python-test pyimport pyflakes paradox outline-magic ob-ipython multishell multi-term magit key-chord jedi ibuffer-tramp ibuffer-git hy-mode helm-rhythmbox helm-recoll helm-emms gnuplot fooddice flycheck dired+ clojure-cheatsheet calfw browse-kill-ring bookmark+ axiom-environment ack ace-jump-mode ac-slime ac-math ac-cider)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
