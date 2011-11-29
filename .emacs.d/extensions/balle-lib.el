; load dvorak enhanced keys
(defun balle-dvorak-on ()
  (interactive)
  (global-set-key (kbd "C-q") ctl-x-map)  
  (global-set-key (kbd "C-j") ctl-c-map)  
  (global-set-key (kbd "C-q C-o") save-buffer)
  (global-set-key (kbd "C-q C-j") save-buffers-kill-terminal)
  (global-set-key (kbd "C-q C-i") ido-find-file)
  (global-set-key (kbd "") yank)
  (global-set-key (kbd "C-,") kill-region)
  (global-set-key (kbd "C-s") isearch-forward)
)

; code search
(defun balle-code-search (s)
  "search for code on koders.com"
  (interactive "sSearch:")
  (pop-to-buffer "*Code search*")
  (browse-url-w3 (concat "http://www.google.com/codesearch#search/&type=cs&q=" s) nil)
)

; comment out current line
(defun balle-comment-line ()
   (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (comment-region (region-beginning) (region-end))
)

; copy line to killring
(defun balle-copy-line-to-killring ()
  "copy whole line to kill ring"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (let ((str (buffer-substring (region-beginning) (region-end))))
    (kill-ring-save (region-beginning) (region-end))))
(global-set-key (kbd "C-c d") 'balle-copy-line-to-killring)

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
)

(defun balle-show-message-buffer ()
  (interactive)
  (switch-to-buffer-other-window "*Messages*")
  (next-multiframe-window)
  (enlarge-window 10)
)

; markiere das wort unter dem cursor im gesamten buffer
(defun mark-current-word-in-buffer ()
  (interactive)
  (require 'thingatpt)

  (if (boundp 'balle-mark-current-sym)
    (unhighlight-regexp balle-mark-current-sym)
  )

  (setq balle-mark-current-sym (thing-at-point 'symbol))

  (unless (null balle-mark-current-sym)
    (highlight-regexp balle-mark-current-sym)
  )
)

(defun unmark-current-word-in-buffer ()
  (interactive)
  (if (boundp 'balle-mark-current-sym)
    (unhighlight-regexp balle-mark-current-sym)
  )
)

(defun balle-killall-non-special-buffers()
   (interactive)

   (dolist buffer (buffer-list)
      (with-current-buffer buffer
         (let ((file (buffer-file-name)))
            (if (not file)
 ;              (kill-buffer buffer)
            )
         )
      )
   )
)


(defun wiki (page)
  (interactive "sPage: ")
  (yaoddmuse-edit "BaLu" page)
)
