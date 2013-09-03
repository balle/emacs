(add-to-list 'load-path "~/.emacs.d/extensions/emmet-mode")
(add-to-list 'load-path "~/.emacs.d/extensions/jinja2-mode")
(add-to-list 'load-path "~/.emacs.d/extensions/htmlize-20130207.2102")
(add-to-list 'load-path "~/.emacs.d/extensions/simple-httpd-20121224.1121")
(add-to-list 'load-path "~/.emacs.d/extensions/impatient-mode-20130127.1656")
(require 'impatient-mode)
(require 'rename-sgml-tag)

(setq ac-dwim t)
(ac-config-default)
(auto-complete-mode)
(add-to-list 'ac-modes 'sgml-mode)

(require 'emmet-mode)
(require 'jinja2-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'sgml-mode-hook '(lambda ()
  (define-key sgml-mode-map "\C-ce" 'emmet-expand-line)
  (define-key sgml-mode-map "\C-c\C-r" 'rename-sgml-tag)
  (flycheck-mode)
))

(defadvice sgml-delete-tag (after reindent-buffer activate)
  (cleanup-buffer)
)
