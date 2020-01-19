;; $ go get -u golang.org/x/tools/cmd/guru
;; $ go get github.com/rogpeppe/godef
;; $ go get -u github.com/nsf/gocode
;; $ go get -u golang.org/x/tools/cmd/goimports
;; $ go get -u github.com/dougm/goflymake


(add-to-list 'load-path "~/.emacs.d/extensions/go-mode.el")
(require 'go-mode)
(require 'go-guru)
(require 'go-autocomplete)

(setq tab-width 4)
(setq standard-indent 4)
(setq indent-tabs-mode nil)
(setq gofmt-args "")

;; Key bindings specific to go-mode
(define-key go-mode-map "\C-cg" 'godef-jump)

(add-hook 'go-mode-hook '(lambda ()
	(auto-complete-mode t)))
