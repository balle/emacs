(add-to-list 'load-path "~/.emacs.d/extensions/key-chord")

(require 'multi-term)
(require 'ace-jump-mode)
(require 'key-chord)
(require 'yasnippet)

(key-chord-mode 1)
(setq key-chord-one-key-delay 0.15)
(key-chord-define-global "jj" 'ace-jump-mode)

(add-hook 'term-mode-hook (lambda ()
    (setq yas/dont-activate nil)
    (yas/minor-mode-on)
    (add-to-list 'term-bind-key-alist '("C-c C-n" . multi-term-next))
    (add-to-list 'term-bind-key-alist '("C-c C-p" . multi-term-prev))
    (add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))
    (add-to-list 'term-bind-key-alist '("C-c C-k" . term-char-mode))
))

(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term)
