(setq sql-sqlite-program "sqlite3")
(add-to-list 'ac-modes 'sql-interactive-mode)
(setq ac-sources '(ac-source-words-in-buffer ac-source-yasnippet))

(add-hook 'sql-interactive-mode-hook '(lambda ()
  (yas/minor-mode)
  (auto-complete-mode)

  (cond
    ((eq sql-product 'sqlite)
      (sql-send-string ".tables")
    )
    ((eq sql-product 'postgres)
      (sql-send-string "\dt")
    )
    ((eq sql-product 'mysql)
      (sql-send-string "show tables;")
    )
  )
))


;; save history per db type
(setq comint-input-ring-size 10000)

(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
	(rval 'sql-product))
    (if (symbol-value rval)
	(let ((filename 
	       (concat "~/.emacs.d/sql/"
		       (symbol-name (symbol-value rval))
		       "-history.sql")))
	  (set (make-local-variable lval) filename))
      (error
       (format "SQL history will not be saved because %s is nil"
	       (symbol-name sql-product))))))

(add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)
