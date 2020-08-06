;; $ export PATH=$PATH:$GOPATH/bin
;; $ go get -u -v golang.org/x/tools/cmd/guru
;; $ go get -u -v github.com/rogpeppe/godef
;; $ go get -u -v github.com/nsf/gocode
;; $ go get -u -v golang.org/x/tools/cmd/goimports
;; $ go get -u -v github.com/dougm/goflymake
;; $ go get -u -v github.com/motemen/gore

(install-missing-packages '(gotest
			    gorepl-mode))


(add-to-list 'load-path "~/.emacs.d/extensions/go-mode.el")
(require 'go-mode)
(require 'go-autocomplete)
(require 'gotest)

;; source code navigator
(require 'go-guru)

;; a repl for interactive go programming
(require 'gorepl-mode)

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

(add-hook 'go-mode-hook '(lambda ()
	(auto-complete-mode t)))
