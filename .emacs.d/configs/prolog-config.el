(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)

;(setq auto-mode-alist
;      (cons (cons "\\.pl" 'prolog-mode)
;            auto-mode-alist))

(add-to-list 'ac-modes 'prolog-mode)

(add-hook 'prolog-mode-hook '(lambda ()
    (outline-minor-mode)
    (global-set-key (kbd "C-c <tab>") 'outline-cycle)
))
