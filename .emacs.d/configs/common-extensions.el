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

; X clipboard support on console
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; ace jump mode
(require 'ace-jump-mode)

(load-file "~/.emacs.d/extensions/emacs-for-python/extensions/highlight-indentation.el")
(require 'highlight-indentation)

; easier window switching
(require 'win-switch)

; advaned undo
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-limit 50000)

; advanced bookmarking features
(require 'bookmark+)

; show fill column
(require 'fill-column-indicator)

; activate ido mode
(ido-mode t)

; show flymake errors in message buffer
(load-library "flymake-cursor")

; goto last change
(require 'goto-last-change)

; expand region
(add-to-list 'load-path "~/.emacs.d/extensions/expand-region")
(require 'expand-region)

; mark multiple / multiple cursors
(add-to-list 'load-path "~/.emacs.d/extensions/multiple-cursors")
(add-to-list 'load-path "~/.emacs.d/extensions/mark-multiple")
(require 'multiple-cursors)

; po-file editor
(require 'po-mode)
(setq auto-mode-alist
           (cons '("\\.po\\'\\|\\.po\\.|\\.po" . po-mode) auto-mode-alist))
     (autoload 'po-mode "po-mode" "Major mode for translators to edit PO files" t)

