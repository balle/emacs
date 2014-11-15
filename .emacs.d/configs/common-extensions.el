; kill ring browser
(require 'browse-kill-ring)

; alarm clock
(require 'alarm)

; M-x ido completion
(add-to-list 'load-path "~/.emacs.d/extensions/smex")
(require 'smex)
(smex-initialize)

; code folding
(add-to-list 'load-path "~/.emacs.d/extensions/outline-magic")
(require 'outline-magic)
(outline-minor-mode)

; project management
(add-to-list 'load-path "~/.emacs.d/extensions/s")
(add-to-list 'load-path "~/.emacs.d/extensions/epl")
(add-to-list 'load-path "~/.emacs.d/extensions/dash")
(add-to-list 'load-path "~/.emacs.d/extensions/pkg-info")
;(add-to-list 'load-path "~/.emacs.d/extensions/recentf")
(add-to-list 'load-path "~/.emacs.d/extensions/projectile")
;(require 'recentf-ext)
(require 'recentf)
(recentf-mode 1)
;(setq recentf-max-menu-items 25)
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

; git settings
(add-to-list 'load-path "~/.emacs.d/extensions/git-rebase-mode-20140928.1547")
(add-to-list 'load-path "~/.emacs.d/extensions/git-commit-mode-0.13")
(add-to-list 'load-path "~/.emacs.d/extensions/magit")
(require 'magit)
; (setq magit-process-popup-time 3)
(if (>= emacs-major-version 24)
    (progn
      (add-to-list 'load-path "~/.emacs.d/extensions/emacs-git-gutter")
      (require 'git-gutter)
      (global-git-gutter-mode t)))

; yasnippets
(if (fboundp 'yas/load-directory)
      (yas/load-directory "~/.emacs-snippets")
      (yas/load-directory "~/.emacs.d/extensions/emacs-for-python/extensions/yasnippet/snippets")
      (yas/load-directory "~/.emacs.d/extensions/emacs-for-python/snippets/"))
(setq yas/indent-line nil)

; flycheck - better syntax checking
(if (>= emacs-major-version 24)
    (progn
      (add-to-list 'load-path "~/.emacs.d/extensions/f")
      (add-to-list 'load-path "~/.emacs.d/extensions/s")
      (add-to-list 'load-path "~/.emacs.d/extensions/cl-lib")
      (add-to-list 'load-path "~/.emacs.d/extensions/dash")
      (add-to-list 'load-path "~/.emacs.d/extensions/flycheck")
      (require 'flycheck)
      (setq flycheck-pylintrc "~/.emacs.d/configs/pylint.rc")
      (add-hook 'after-init-hook #'global-flycheck-mode)
))

; X clipboard support on console
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; better keybindings
(add-to-list 'load-path "~/.emacs.d/extensions/key-chord")
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-one-key-delay 0.15)

; ace jump mode
(require 'ace-jump-mode)

; easier window switching
(require 'win-switch)

; discover emacs functions
(add-to-list 'load-path "~/.emacs.d/extensions/makey")
(add-to-list 'load-path "~/.emacs.d/extensions/discover")
(require 'discover)
(global-discover-mode 1)

; sunrise commander as file manager
(add-to-list 'load-path "~/.emacs.d/extensions/sunrise-commander")
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

; activate ido and ibuffer mode
(add-to-list 'load-path "~/.emacs.d/extensions/ibuffer-git")
(add-to-list 'load-path "~/.emacs.d/extensions/ibuffer-tramp")
(require 'ibuffer-git)
(require 'ibuffer-tramp)
(ido-mode t)
(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-tramp-set-filter-groups-by-tramp-connection)
      (ibuffer-do-sort-by-alphabetic)))

(setq ibuffer-formats
      '((mark modified read-only " "
	 (name 42 42 :left :elide)
	 " "
	 (mode 16 16 :left :elide)
	 " "
	 (git-status 8 8 :left)
	 " "
	 filename-and-process)))

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
