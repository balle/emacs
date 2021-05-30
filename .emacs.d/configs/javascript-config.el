(install-missing-packages '(js2-mode
			    json-mode))

(require 'json-mode)
(require 'js2-mode)

(add-hook 'js-mode-hook 'js2-minor-mode)

; json
(setq auto-mode-alist
           (cons '("\\.json" . json-mode) auto-mode-alist))

; by misty-rc
(defun json-reformat (beg end)
  (interactive "r")
  (shell-command-on-region beg end "python -m json.tool" nil t))

(add-hook 'js-mode-hook '(lambda ()
  (define-key js-mode-map (kbd "C-c j") 'json-reformat)
))
