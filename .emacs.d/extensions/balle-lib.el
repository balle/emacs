(defun install-missing-packages (package-list)
  (unless package-archive-contents 
    (progn 
      (package-initialize) 
      (package-refresh-contents)))
  
;;  (package-initialize) 
;;  (package-refresh-contents)
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

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

;; (defun balle-projectile-open-all-recent ()
;;   "Open a project with all recent files"
;;   (interactive)
;;   (projectile-switch-project)
;;   (mapc (lambda (pfile) (find-file (concatenate 'string (projectile-project-root) pfile))) (projectile-recentf-files)))

; comment out current line
(defun balle-comment-line ()
   (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (comment-region (region-beginning) (region-end))
)

; goto next whitespace
(defun balle-goto-next-whitespace ()
   (interactive)
   (search-forward " ")
   (backward-char)
)

; goto previous whitespace
(defun balle-goto-prev-whitespace ()
   (interactive)
   (search-backward " ")
   (forward-char)
)

(defun balle-show-python-functions ()
  "Show all defs in current Python-mode buffer"
  (interactive)
  (occur "^ *def ")
  (enlarge-window 7)
  (switch-to-buffer-other-window "*Occur*")
)


;; (defun balle-show-message-buffer ()
;;   (interactive)
;;   (switch-to-buffer-other-window "*Messages*")
;;   (next-multiframe-window)
;;   (enlarge-window 10)
;; )

;; (defun balle-show-magit-process-buffer ()
;;   (interactive)
;;   (switch-to-buffer-other-window "*magit-process*")
;;   (enlarge-window 5)
;; )

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
;; (defun balle-search-current-word-in-buffer ()
;;   (interactive)
;;   (require 'thingatpt)

;;   (if (boundp 'balle-mark-current-sym)
;;     (unhighlight-regexp balle-mark-current-sym)
;;   )

;;   (setq balle-mark-current-sym (thing-at-point 'symbol))

;;   (unless (null balle-mark-current-sym)
;;     (let ((case-fold-search nil))
;;       (search-forward balle-mark-current-sym)
;;     )
;;   )
;; )

(defun balle-transpose-word-backwards (arg)
  (interactive "*p")
  (backward-word)
  (transpose-subr 'backward-word arg)
)

(defun balle-transpose-char-backwards (arg)
  (interactive "*p")
  (backward-char)
  (transpose-subr 'backward-char arg)
)

(defun balle-transpose-line-backwards (arg)
  (interactive "*p")
  (backward-line)
  (transpose-subr 'backward-line arg)
)

(defun balle-transpose-paragraph-backwards (arg)
  (interactive "*p")
  (backward-paragraph)
  (transpose-subr 'backward-paragraph arg)
)

(defun json-validate ()
  (interactive)
  (json-read)
)


(defun balle-rrd-to-org (rrdfile &optional export)
  """
  Dump current average values of a RRD database and convert them into an Org-mode table
  """
  (interactive "fFilename: ")
  (let ((buffer-name (concat "*RRD2ORG " rrdfile "*")))
    ;; get output of rrd file as ascii
    (call-process-shell-command
     (concat "rrdtool dump " rrdfile)
     nil
     buffer-name
     t)
    (switch-to-buffer buffer-name)

    ;; kill header
    (beginning-of-buffer)
    (push-mark)
   (search-forward "<database>")
   (kill-region (region-beginning) (region-end))
   (beginning-of-line)
   (kill-line)

   ;; kill footer
   (end-of-buffer)
   (push-mark)
   (search-backward "</database>")
   (beginning-of-line)
   (kill-region (region-beginning) (region-end))

   ;; kill begin of comment
   (beginning-of-buffer)
   (push-mark)
   (end-of-buffer)
   (search-backward "<!-- ")
   (search-forward "<!-- ")
   (string-rectangle (region-beginning) (region-end) "| ")

   ;; kill xml in the middle
   (beginning-of-buffer)
   (search-forward "CET")
   (push-mark)
   (end-of-buffer)
   (search-backward "CET / ")
   (search-forward "CET / ")
   (string-rectangle (region-beginning) (region-end) " | ")

   (beginning-of-buffer)
   (search-forward "--> <row><v>")
   (search-backward "--> <row><v>")
   (push-mark)
   (end-of-buffer)
   (search-backward "--> <row><v>")
   (search-forward "--> <row><v>")
   (string-rectangle (region-beginning) (region-end) "| ")

   ;; end of line
   (beginning-of-buffer)
   (end-of-line)
   (search-backward "</v></row>")
   (push-mark)
   (end-of-buffer)
   (search-backward "</v></row>")
   (search-forward "</v></row>")
   (kill-rectangle (region-beginning) (region-end))
;   (string-rectangle (region-beginning) (region-end) " |")

   ;; convert buffer to org table
   (org-mode)
   (beginning-of-buffer)
   (insert "| Timestamp | Unix time | Value |\n")

   (if export
       (org-table-export (concat rrdfile ".csv") "orgtbl-to-csv")
   )
  )
)

(defun balle-rrd-to-org-dir (dir &optional export)
  (interactive "DDirectory:")
  (mapcar (lambda(rrdfile)
	    (balle-rrd-to-org rrdfile export))
	  (directory-files dir t "\\.rrd$"))
)


(defun balle-get-matching-buffers (regexp)
  (interactive)
  (let ((my-buffers ()))
    (dolist (buffer (buffer-list))
      (let ((name (buffer-name buffer)))
      (when (and name (not (string-equal name ""))
                 (string-match regexp name))
        (push buffer my-buffers))))
    my-buffers))


;(buffer ispell-show-choices (after convert-choices)
   ; (save-excursion
;  (switch-to-buffer ispell-choices-buffer)
;  (beginning-of-buffer)
;  (push-mark)
;  (end-of-buffer)
;  (setq new-encoding 'utf-8)
;  (setq old-encoding 'iso-8859-1)
;  (recode-region (region-beginning) (region-end) new-encoding old-encoding)
   ; )
;)

(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))
