(install-missing-packages '(cider
			    ac-cider
			    clojure-cheatsheet))

;; cool idea found on http://root42.blogspot.ch/2014/08/how-to-automatically-refresh-cider-when.html
(add-hook 'cider-mode-hook
	  '(lambda () (add-hook 'after-save-hook
				'(lambda ()
				   (if (and (boundp 'cider-mode) cider-mode)
				       (cider-namespace-refresh)
				     )))))

(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
        "(require 'clojure.tools.namespace.repl)
    (clojure.tools.namespace.repl/refresh)"))

;(define-key clojure-mode-map (kbd "C-c C-r") 'cider-namespace-refresh)


