; kill ring browser
(require 'browse-kill-ring)

; alarm clock
(require 'alarm)

; git settings
(add-to-list 'load-path "~/.emacs.d/extensions/magit")
(require 'magit)
; (setq magit-process-popup-time 3)
(if (>= emacs-major-version 24)
    (progn
      (add-to-list 'load-path "~/.emacs.d/extensions/emacs-git-gutter")
      (require 'git-gutter)
      (global-git-gutter-mode t)))

; yasnippets
(add-to-list 'load-path "~/.emacs.d/extensions/yasnippet")
(load-file "~/.emacs.d/extensions/yasnippet/yasnippet.el")
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	"~/.emacs-snippets-custom"
	"~/.emacs-snippets"
	"~/.emacs.d/extensions/yasnippet/snippets"
	"~/.emacs.d/extensions/emacs-for-python/extensions/yasnippet/snippets"
	"~/.emacs.d/extensions/emacs-for-python/snippets/"
	))

(setq yas/indent-line nil)
(yas-global-mode 1)

; flycheck - better syntax checking
(if (>= emacs-major-version 24)
    (progn
      (add-to-list 'load-path "~/.emacs.d/extensions/flycheck")
      (add-hook 'after-init-hook #'global-flycheck-mode)))

; X clipboard support on console
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; ace jump mode
(require 'ace-jump-mode)

; easier window switching
(require 'win-switch)

; sunrise commander as file manager
(require 'sunrise-commander)
(add-hook 'sr-mode-hook
          (lambda ()
               (define-key dired-mode-map (kbd "<left>") 'sr-history-prev)
               (define-key dired-mode-map (kbd "<right>") 'sr-history-next)))

; advaned undo
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-limit 50000)

; better bookmarking support
(add-to-list 'load-path "~/.emacs.d/extensions/bookmark-plus")
(require 'bookmark+)

; show fill column
(require 'fill-column-indicator)

; activate ido mode
(ido-mode t)

; show flymake errors in message buffer
(load-library "flymake-cursor")

; goto last change
(require 'goto-last-change)

; ido goto symbol
(load-library "ido-goto-symbol")

; eval and replace
(load-library "eval-and-replace")

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

; calendar
(add-to-list 'load-path "~/.emacs.d/extensions/emacs-calfw")
(require 'calfw-cal)
(require 'calfw-ical)
(require 'calfw-org)
(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    (cfw:cal-create-source "Orange") ; diary source
    )))
