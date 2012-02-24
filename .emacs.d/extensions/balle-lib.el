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

; comment out current line
(defun balle-comment-line ()
   (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (comment-region (region-beginning) (region-end))
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

; load dvorak enhanced keys
(defun balle-dvorak-on ()
  (interactive)
  ;(global-set-key (kbd "C-q") ctl-x-map)
  ;(keyboard-translate ?\C-q ?\C-x)
  (keyboard-translate ?\C-j ?\C-c)
  (global-set-key (kbd "C-q C-o") 'save-buffer)
  (global-set-key (kbd "C-q C-j") 'save-buffers-kill-terminal)
  (global-set-key (kbd "C-q C-i") 'ido-find-file)
  (global-set-key (kbd "C-ö") 'yank)
  (global-set-key (kbd "C-,") 'kill-region)
  (global-set-key (kbd "C-o") 'isearch-forward)
)

; unload dvorak enhanced keys
(defun balle-dvorak-off ()
  (interactive)
  ;(global-set-key (kbd "C-x") ctl-x-map)
  ;(keyboard-translate ?\C-q ?\C-x)
  (keyboard-translate ?\C-c ?\C-c)
  (global-set-key (kbd "C-x C-s") 'save-buffer)
  (global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal)
  (global-set-key (kbd "C-x C-f") 'ido-find-file)
  (global-set-key (kbd "C-y") 'yank)
  (global-set-key (kbd "C-w") 'kill-region)
  (global-set-key (kbd "C-s") 'isearch-forward)
)

; search word under cursor
(defun balle-search-current-word-in-buffer ()
  (interactive)
  (require 'thingatpt)

  (if (boundp 'balle-mark-current-sym)
    (unhighlight-regexp balle-mark-current-sym)
  )

  (setq balle-mark-current-sym (thing-at-point 'symbol))

  (unless (null balle-mark-current-sym)
    (let ((case-fold-search nil))
      (search-forward balle-mark-current-sym)
    )
  )
)

(defun balle-transpose-word-backwards (arg)
  (interactive "*p")
  (transpose-subr 'backward-word arg)
)

(defun json-validate ()
  (interactive)
  (json-read)
)

(defun wiki (page)
  (interactive "sPage: ")
  (yaoddmuse-edit "BaLu" page)
)
