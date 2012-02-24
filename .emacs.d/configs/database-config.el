(setq sql-sqlite-program "sqlite3")
(add-to-list 'ac-modes 'sql-interactive-mode)
(setq ac-source-yasnippet t)

(add-hook 'sql-interactive-mode-hook '(lambda ()
  (yas/minor-mode)
  (sql-send-string ".tables")
))
