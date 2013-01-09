(add-to-list 'load-path "~/.emacs.d/extensions/cedet-1.1")
(load-file "~/.emacs.d/extensions/cedet-1.1/common/cedet.el")

;; needed for completion
(require 'semantic-ia)

;; needed for glibc includes
(require 'semantic-gcc)

;; * This enables the database and idle reparse engines
;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
;(semantic-load-enable-code-helpers)

;; enables semantic-stickyfunc-name that displays name of current function
;; in topmost line of buffer, semantic-decoration-mode to decorate tags,
;; using different styles, and semantic-idle-completion-mode for automatic
;; generation of possible names completions, if user stops his work for some time
(semantic-load-enable-gaudy-code-helpers)

; Enable template insertion menu
(global-srecode-minor-mode 1)

;(add-hook 'c-mode-hook '(lambda ()
;    (local-set-key (kbd "RET") 'newline-and-indent)
;    (local-set-key (kbd "TAB") 'semantic-ia-complete-symbol-menu)
;    (local-set-key "C-c d" 'semantic-ia-show-doc)
;    (local-set-key "C-c g" 'semantic-ia-fast-jump)
;    (define-key c-mode-map "C-d" 'kill-whole-line)
;    (linum-mode t)
;    (flymake-mode)
;))

;; Autocomplete
(add-to-list 'ac-modes 'c-mode)

(defun ac-c-mode-setup ()
  (setq ac-sources
     (append '(ac-source-semantic  ac-source-yasnippet)
               ac-sources))
)


;(add-to-list 'semantic-lex-c-preprocessor-symbol-file "/usr/include/stdlib.h")
