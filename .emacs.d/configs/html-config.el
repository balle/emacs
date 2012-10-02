(add-to-list 'load-path "~/.emacs.d/extensions/zencoding")
(require 'rename-sgml-tag)

(setq ac-dwim t)
(ac-config-default)
(auto-complete-mode)
(add-to-list 'ac-modes 'sgml-mode)
(setq django-indent-width 4)

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'sgml-mode-hook '(lambda ()
   (undefine-key sgml-mode-map "\C-j")
   (define-key sgml-mode-map "\C-je" 'zencoding-expand-line)
   (define-key sgml-mode-map "\C-c\C-r" 'rename-sgml-tag)
))

(defadvice sgml-delete-tag (after reindent-buffer activate)
  (cleanup-buffer)
)


