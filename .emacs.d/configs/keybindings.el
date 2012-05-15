(global-set-key "\M-+" 'enlarge-window)
(global-set-key "\M--" 'shrink-window)
(global-unset-key "\C-xm")
(global-set-key "\C-xm" 'balle-show-message-buffer)
(global-set-key "\C-cm" 'balle-show-magit-process-buffer)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-unset-key "\C-xrs")
(global-set-key "\C-xrs" 'bookmark-save)
(global-unset-key "\C-xrd")
(global-set-key "\C-xrd" 'bookmark-delete)
(global-set-key "\C-x\C-k" 'kill-matching-buffers)
(global-set-key "\C-xc" 'clean-buffer-list)
(global-set-key "\C-xg" 'grep-mode)
(global-unset-key "\M-,")
(global-set-key "\M-," 'balle-comment-line)
(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "M-y") 'browse-kill-ring)
(global-set-key (kbd "C-c <left>") 'balle-transpose-word-backwards)
(global-set-key (kbd "C-c <right>") 'transpose-words)
(global-set-key (kbd "M-s") 'balle-search-current-word-in-buffer)
(global-set-key "\C-xU" 'undo)
(define-key (current-global-map) (kbd "C-x r w") 'window-configuration-to-register)
(global-set-key "\C-x\C-q" 'goto-last-change)
(global-unset-key "\C-j")
(global-set-key "\C-jb" 'pop-global-mark)
(global-set-key "\C-jc" 'goto-last-change)
(global-set-key "\C-jl" 'ace-jump-line-mode)
(global-set-key "\C-jm" 'pop-global-mark)
(global-set-key "\C-js" 'ido-goto-symbol)
(global-set-key "\C-jw" 'ace-jump-word-mode)
(global-set-key (kbd "C-j <left>") 'backward-list)
(global-set-key (kbd "C-j <right>") 'forward-list)
(global-set-key (kbd "C-j <up>") 'outline-backward-same-level)
(global-set-key (kbd "C-j <down>") 'outline-forward-same-level)
(global-set-key "\C-xth" 'balle-show-hack-list)
(global-set-key "\C-xti" 'org-redmine-get-issue)
(global-set-key "\C-xtn" 'balle-show-note-list)
(global-set-key "\C-xtp" 'balle-show-python-list)
(global-set-key "\C-xtr" 'balle-show-read-list)
(global-set-key "\C-xts" 'balle-show-started-list)
(global-set-key "\C-xtt" 'balle-show-todo-list)
(global-set-key "\C-xtw" 'balle-show-waiting-list)
(global-set-key "\C-xtx" 'balle-show-next-list)
(global-set-key (kbd "M-[ d") 'backward-word)
(global-set-key (kbd "M-[ c") 'forward-word)
(global-set-key (kbd "C-x <left>") 'next-user-buffer)
(global-set-key (kbd "C-x <right>") 'previous-user-buffer)
(global-set-key (kbd "C-c <up>") 'move-text-up)
(global-set-key (kbd "C-c <down>") 'move-text-down)
(global-set-key (kbd "C-x <up>") 'win-switch-up)
(global-set-key (kbd "C-x <down>") 'win-switch-down)
(global-set-key "\C-c\C-u" 'outline-backward-same-level)
(global-set-key "\C-c\C-d" 'outline-forward-same-level)
(global-set-key (kbd "C-c s") 'switch-to-buffer)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(global-set-key "\C-xw" 'wiki)
(global-set-key [f1] 'magit-status)
(global-set-key [f2] 'calendar)
(global-set-key [f3] 'org-agenda)
(global-set-key [f4] 'balle-grep-todos-in-dir)
(global-set-key [f5] 'flyspell-auto-correct-word)
(global-set-key [f6] 'flyspell-goto-next-error)
(global-set-key [f7] 'balle-flyspell-add-word)
(global-set-key [f8] 'org-capture)
(global-set-key [f9] 'balle-redmine-tickets)
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)
