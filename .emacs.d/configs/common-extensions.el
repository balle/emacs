(install-missing-packages '(auto-complete
			    yasnippet
			    undo-tree
			    browse-kill-ring
			    smex
			    magit
			    flycheck
			    key-chord
			    ace-jump-mode
			    dired+
			    bookmark+
			    win-switch
			    bookmark+
			    smartparens
			    outline-magic
			    spray
			    ibuffer-git
			    ibuffer-tramp))

(add-to-list 'load-path "~/.emacs.d/extensions/outline-magic")
(require 'outline-magic)

; speed reading mode
(require 'spray)
(setq spray-wpm 400)
(setq spray-margin-top 1)
(setq spray-margin-left 1)

; kill ring browser
(require 'browse-kill-ring)

; magic text folding
(require 'outline-magic)

; alarm clock
(require 'alarm)

; more bookmarking features like tags
(require 'bookmark+)
(setq bmkp-prompt-for-tags-flag nil)

; M-x ido completion
(require 'smex)
(smex-initialize)

; git settings
(require 'magit)
; (setq magit-process-popup-time 3)
(if (>= emacs-major-version 24)
    (progn
      (add-to-list 'load-path "~/.emacs.d/extensions/emacs-git-gutter")
      (require 'git-gutter)
      (global-git-gutter-mode t)))

; auto-completion
(require 'auto-complete)
(setq ac-dwim t)
(ac-config-default)
(define-key ac-complete-mode-map "\t" 'ac-expand)
(setq-default ac-sources '(ac-source-yasnippet
			   ac-source-abbrev
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers))
(global-auto-complete-mode t)

; yasnippets
(if (fboundp 'yas/load-directory)
      (yas/load-directory "~/.emacs-snippets"))
(setq yas/indent-line nil)
(yas-global-mode 1)

(add-hook 'text-mode-hook 'yas-minor-mode)
(add-hook 'text-mode-hook 'auto-complete-mode)

; flycheck - better syntax checking
(if (>= emacs-major-version 24)
    (progn
      (require 'flycheck)
      (setq flycheck-pylintrc "~/.emacs.d/configs/pylint.rc")
      (add-hook 'after-init-hook #'global-flycheck-mode)
))

; X clipboard support on console
(load-file "~/.emacs.d/extensions/xclip/xclip.el")
(turn-on-xclip)

; better keybindings
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-one-key-delay 0.15)

; ace jump mode
(require 'ace-jump-mode)

; easier window switching
(require 'win-switch)

; advaned undo
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-limit 50000)

; better bookmarking support
(add-to-list 'load-path "~/.emacs.d/extensions/bookmark-plus")
(require 'bookmark+)

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

(require 'smartparens-config)
