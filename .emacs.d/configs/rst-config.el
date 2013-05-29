(add-to-list 'ac-modes 'rst-mode)
(setq ac-sources '(ac-source-semantic ac-source-yasnippet))

(add-hook 'rst-mode-hook '(lambda ()
    (auto-complete-mode)
    (flyspell-mode)
    (ac-flyspell-workaround)
    (setq ac-delay 0.2)
))
