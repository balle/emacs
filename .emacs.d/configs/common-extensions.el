; kill ring browser
(require 'browse-kill-ring)
(global-set-key (kbd "M-y") 'browse-kill-ring)

; alarm clock
(require 'alarm)

; X clipboard support
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; oddmuse wiki support
(require 'yaoddmuse)

; easier window switching
(require 'win-switch)

; advaned undo
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-limit 50000)

; advanced bookmarks
(require 'bookmark+)

; display tabbar
;(require 'tabbar)
;(require 'tabbar-extension)
;(tabbar-mode)

; save window configuration
;(require 'windows)
;(add-hook 'kill-emacs-hook '(lambda ()
;	(save-current-configuration)
;))
;(add-hook 'window-setup-hook '(lambda ()
;	(resume-windows)
;))

; show flymake errors in message buffer
(load-library "flymake-cursor")

; goto last change
(require 'goto-last-change)

; po-file editor
(require 'po-mode)
(setq auto-mode-alist
           (cons '("\\.po\\'\\|\\.po\\.|\\.po" . po-mode) auto-mode-alist))
     (autoload 'po-mode "po-mode" "Major mode for translators to edit PO files" t)
