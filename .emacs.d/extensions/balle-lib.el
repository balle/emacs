(defun balle-grep-todos-in-dir (dir &optional not-recursive)
  "Grep recursively for TODO comments in the given directory"
  (interactive "Ddirectory:")
  (let ((recur "-r"))
    (if not-recursive
      (setq recur "")
    )
    (grep (concat "grep -nH -I " recur " -E \"[\\#\\/\\-\\;\\*]\s*TODO|FIXME|XXX:?\" " dir " 2>/dev/null"))
  )
  (enlarge-window 7)
)

(defun balle-show-python-functions ()
  "Show all defs in current Python-mode buffer"
  (interactive)
  (occur "^ *def ")
  (enlarge-window 7)
  (switch-to-buffer-other-window "*Occur*")
)


(defun balle-show-message-buffer ()
  (interactive)
  (switch-to-buffer-other-window "*Messages*")
  (next-multiframe-window)
  (enlarge-window 10)
)

(defun balle-show-magit-process-buffer ()
  (interactive)
  (switch-to-buffer-other-window "*magit-process*")
  (enlarge-window 5)
)

(defun wiki (page)
  (interactive "sPage: ")
  (yaoddmuse-edit "BaLu" page)
)
