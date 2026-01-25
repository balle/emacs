(install-missing-packages '(lsp-mode
                            helm
                            helm-lsp
			    helm-xref			    
			    company
			    yasnippet
			    flycheck
			    undo-tree
			    browse-kill-ring
			    smex
			    key-chord	
			    ace-jump-mode
			    smartparens
			    which-key
			    paradox
                            bug-hunter
			    ibuffer-vc
			    ibuffer-tramp))

; kill ring browser
(require 'browse-kill-ring)

; M-x ido completion
(require 'smex)
(smex-initialize)

; git settings
; (setq magit-process-popup-time 3)
(if (>= emacs-major-version 25)
    (progn
      (install-missing-packages '(magit))
      (require 'magit)
      (setq magit-refresh-status-buffer nil)
      (setq auto-revert-buffer-list-filter
      'magit-auto-revert-repository-buffer-p)))
      ;(add-to-list 'load-path "~/.emacs.d/extensions/emacs-git-gutter")
      ;(require 'git-gutter)
      ;(global-git-gutter-mode t)))

; yasnippets
(require 'yasnippet)
(setq yas/indent-line nil)
(yas-global-mode 1)

(add-hook 'text-mode-hook 'yas-minor-mode)

; flycheck - better syntax checking
(if (>= emacs-major-version 25)
    ;; (progn
    ;;   (install-missing-packages '(flycheck))
    ;;   (require 'flycheck)
    ;;   (setq flycheck-pylintrc "~/.emacs.d/configs/pylint.rc")
    ;;   (add-hook 'after-init-hook #'global-flycheck-mode)
    (add-to-list 'load-path "~/.emacs.d/extensions/flycheck")
    ;(load-file "~/.emacs.d/extensions/flycheck/flycheck.el")
    (require 'flycheck)
)

; ace jump mode
(require 'ace-jump-mode)

; advaned undo
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-limit 50000)
(setq undo-tree-visualizer-timestamps t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs-backup")))

; activate ido and ibuffer mode
(require 'ibuffer-vc)
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
	 (vc-status 8 8 :left)
	 " "
	 filename-and-process)))

(require 'smartparens-config)
(smartparens-global-mode-enable-in-buffers)

;; (helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

;; lsp mode
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))

(which-key-mode)
