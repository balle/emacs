(add-to-list 'load-path "~/.emacs.d/extensions/zencoding")
(add-to-list 'load-path "~/.emacs.d/extensions/htmlize-20130207.2102")
(add-to-list 'load-path "~/.emacs.d/extensions/simple-httpd-20121224.1121")
(add-to-list 'load-path "~/.emacs.d/extensions/impatient-mode-20130127.1656")
(require 'impatient-mode)
(require 'rename-sgml-tag)

(setq ac-dwim t)
(ac-config-default)
(auto-complete-mode)
(add-to-list 'ac-modes 'sgml-mode)


(add-to-list 'auto-mode-alist '("\\.html?$" . sgml-mode))

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'sgml-mode-hook '(lambda ()
   (define-key sgml-mode-map "\C-ce" 'zencoding-expand-line)
   (define-key sgml-mode-map "\C-c\C-r" 'rename-sgml-tag)
))

(defadvice sgml-delete-tag (after reindent-buffer activate)
  (cleanup-buffer)
)


