; kill ring browser
(require 'browse-kill-ring)
(global-set-key (kbd "M-y") 'browse-kill-ring)

; X clipboard support
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; buffer move
;(require 'buffer-move)
;(global-set-key (kbd "<M-up>")     'buf-move-up)
;(global-set-key (kbd "<M-down>")   'buf-move-down)
;(global-set-key (kbd "<M-left>")   'buf-move-left)
;(global-set-key (kbd "<M-right>")  'buf-move-right)

; easier window switching
(require 'win-switch)

; advaned undo
(require 'undo-tree)
(global-undo-tree-mode)

; advanced bookmarks
(require 'bookmark+)

; display tabbar
(require 'tabbar)
(require 'tabbar-extension)
(tabbar-mode)

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

; speedbar
;(require 'sr-speedbar)
;(setq sr-speedbar-right-side nil)
;(sr-speedbar-toggle)

; workgroups
;(require 'workgroups)
;(setq wg-prefix-key (kbd "C-c w"))
;(workgroups-mode 1)
;(wg-load "~/.emacs.d/workgroups")

; autopair
;(require 'autopair)
;(autopair-global-mode)

; goto last change
(require 'goto-last-change)

; highlight todo and fixme comments
;(require 'fic-ext-mode)
;(add-hook 'python-mode-hook 'turn-on-fic-ext-mode)

