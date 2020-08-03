;; $ export GOPATH=~/go/bin
;; $ export PATH=$PATH:$GOPATH/bin
;; $ go get -u golang.org/x/tools/cmd/guru
;; $ go get github.com/rogpeppe/godef
;; $ go get -u github.com/nsf/gocode
;; $ go get -u golang.org/x/tools/cmd/goimports
;; $ go get -u github.com/dougm/goflymake


(add-to-list 'load-path "~/.emacs.d/extensions/go-mode.el")
(require 'go-mode)
(require 'go-guru)
(require 'go-autocomplete)

;; formating options
(setq tab-width 4)
(setq standard-indent 4)
(setq indent-tabs-mode nil)

;; automatically add imports on save
(setq gofmt-command "goimports")
(setq gofmt-args "")
(add-hook 'before-save-hook 'gofmt-before-save)


;; Key bindings specific to go-mode
(define-key go-mode-map "\C-cg" 'godef-jump)

(add-hook 'go-mode-hook '(lambda ()
	(auto-complete-mode t)))
