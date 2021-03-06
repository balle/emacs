;; $ export PATH=$PATH:$GOPATH/bin
;; $ go get -u -v golang.org/x/tools/cmd/guru
;; $ go get -u -v github.com/rogpeppe/godef
;; $ go get -u -v github.com/nsf/gocode
;; $ go get -u -v golang.org/x/tools/cmd/goimports
;; $ go get -u -v github.com/dougm/goflymake
;; $ go get -u -v github.com/motemen/gore/cmd/gore
;; $ go get -u -v github.com/go-delve/delve/cmd/dlv
;; $ GO111MODULE=on go get golang.org/x/tools/gopls@latest

(install-missing-packages '(go-mode
    			    go-guru
			    go-dlv
			    lsp-mode))

(add-to-list 'load-path "~/.emacs.d/extensions/go-mode.el")
(require 'go-mode)
(require 'go-autocomplete)
(require 'go-dlv)

;; setup lsp mode
(require 'lsp-mode)

(setq lsp-log-io t)
(setq lsp-clients-go-server "gopls")
(add-hook 'go-mode-hook #'lsp)

;; source code navigator
(require 'go-guru)

;; formating options
(setq tab-width 4)
(setq standard-indent 4)
(setq indent-tabs-mode nil)

;; automatically add imports and format source code on save
(setq gofmt-command "goimports")
(setq gofmt-args "")
(add-hook 'before-save-hook 'gofmt-before-save)


;; Key bindings specific to go-mode
(define-key go-mode-map "\C-cg" 'godef-jump)
(define-key go-mode-map "\C-cd" 'go-guru-describe)

(add-hook 'go-mode-hook '(lambda ()
			  (auto-complete-mode t)
			  (smartparens-mode t)
			  (lsp-mode)
			  ))

;; gore repl
;; (add-hook 'go-mode-hook #'gorepl-mode)
