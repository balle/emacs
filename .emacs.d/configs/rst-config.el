(add-hook 'rst-mode-hook '(lambda ()
    (auto-complete-mode)
    (flyspell-mode)
    (ac-flyspell-workaround)
    (setq ac-delay 0.2)
))
