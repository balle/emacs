; borrowed from http://emacs.wordpress.com/2007/01/17/eval-and-replace-anywhere/
(defun fc-eval-and-replace ()
    "Replace the preceding sexp with its value."
      (interactive)
        (backward-kill-sexp)
          (condition-case nil
                    (prin1 (eval (read (current-kill 0)))
                                        (current-buffer))
                (error (message "Invalid expression")
                                  (insert (current-kill 0)))))
