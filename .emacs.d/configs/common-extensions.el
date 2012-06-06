; kill ring browser
(require 'browse-kill-ring)

; alarm clock
(require 'alarm)

; git settings
(require 'magit)
; (setq magit-process-popup-time 3)

; yasnippets
(if (fboundp 'yas/load-directory)
      (yas/load-directory "~/.emacs-snippets")
      (yas/load-directory "~/.emacs.d/extensions/emacs-for-python/extensions/yasnippet/snippets")
      (yas/load-directory "~/.emacs.d/extensions/emacs-for-python/snippets/"))
(setq yas/indent-line nil)

; ido menu
(autoload 'idomenu "idomenu" nil t)

; X clipboard support
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; oddmuse wiki support
(require 'yaoddmuse)

; ace jump mode
(require 'ace-jump-mode)

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
(setq winner-dont-bind-my-keys t)
(winner-mode 1)

;(require 'windows)
;(add-hook 'kill-emacs-hook '(lambda ()
;	(save-current-configuration)
;))
;(add-hook 'window-setup-hook '(lambda ()
;	(resume-windows)
;))

(require 'fill-column-indicator)

; show flymake errors in message buffer
(load-library "flymake-cursor")

; goto last change
(require 'goto-last-change)

; po-file editor
(require 'po-mode)
(setq auto-mode-alist
           (cons '("\\.po\\'\\|\\.po\\.|\\.po" . po-mode) auto-mode-alist))
     (autoload 'po-mode "po-mode" "Major mode for translators to edit PO files" t)
