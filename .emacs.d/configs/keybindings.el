(global-set-key "\M-+" 'enlarge-window)
(global-set-key "\M--" 'shrink-window)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-unset-key "\C-xm")
;(global-set-key "\C-xm" 'balle-show-message-buffer)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(key-chord-define-global "jj" 'ace-jump-mode)
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
(global-set-key (kbd "M-t") nil) ;; Remove the old keybinding
(global-set-key (kbd "M-t c") 'transpose-chars)
(global-set-key (kbd "M-t C") 'balle-transpose-char-backwards)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t W") 'balle-transpose-word-backwards)
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t L") 'balle-transpose-line-backwards)
(global-set-key (kbd "M-t e") 'transpose-sexps)
(global-set-key (kbd "M-t s") 'transpose-sentences)
(global-set-key (kbd "M-t p") 'transpose-paragraphs)
(global-set-key (kbd "M-t P") 'balle-transpose-paragraph-backwards)
(global-set-key (kbd "M-t <left>") 'balle-transpose-word-backwards)
(global-set-key (kbd "M-t <right>") 'transpose-words)
(global-set-key (kbd "C-c <left>") 'balle-transpose-word-backwards)
(global-set-key (kbd "C-c <right>") 'transpose-words)
(global-set-key (kbd "M-s") 'balle-search-current-word-in-buffer)
(global-set-key "\C-xU" 'undo)
(global-set-key "\C-x\C-b" 'ibuffer)
(define-key (current-global-map) (kbd "C-x r w") 'window-configuration-to-register)
(global-set-key "\C-x\C-q" 'goto-last-change)
(global-unset-key "\C-j")
(global-set-key "\C-jb" 'pop-global-mark)
(global-set-key "\C-jc" 'goto-last-change)
(global-set-key "\C-jf" 'ido-goto-symbol)
(global-set-key "\C-jl" 'ace-jump-line-mode)
(global-set-key "\C-jm" 'pop-global-mark)
(global-set-key "\C-jp" 'forward-paragraph)
(global-set-key "\C-jP" 'backward-paragraph)
(global-set-key "\C-jS" 'balle-goto-prev-whitespace)
(global-set-key "\C-js" 'balle-goto-next-whitespace)
(key-chord-define-global "js" 'balle-goto-next-whitespace)
(key-chord-define-global "jS" 'balle-goto-prev-whitespace)
(global-set-key "\C-jw" 'ace-jump-word-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key "\C-cma" 'mc/mark-all-like-this)
(global-set-key "\C-cmb" 'mark-whole-buffer)
(global-set-key "\C-cmc" 'mc/edit-lines)
(global-set-key "\C-cme" 'er/expand-region)
(global-set-key "\C-cml" 'mark-line)
(global-set-key "\C-cmm" 'mc/mark-all-like-this)
(global-set-key "\C-cmn" 'mc/mark-next-like-this)
(global-set-key "\C-cmp" 'mc/mark-previous-like-this)
(global-set-key "\C-cmP" 'mark-paragraph)
(global-set-key "\C-cmw" 'mark-word)
(global-set-key "\C-ce" 'fc-eval-and-replace)
(global-set-key "\C-x\C-n" 'delete-newlines-in-region)
(global-set-key (kbd "C-j <left>") 'backward-list)
(global-set-key (kbd "C-j <right>") 'forward-list)
(global-set-key (kbd "C-j <up>") 'outline-backward-same-level)
(global-set-key (kbd "C-j <down>") 'outline-forward-same-level)

(global-set-key "\C-cke" 'kmacro-end-or-call-macro)
(global-set-key "\C-ckn" 'kmacro-cycle-ring-next)
(global-set-key "\C-ckp" 'kmacro-cycle-ring-previous)
(global-set-key (kbd "C-c !") 'shell-command-on-buffer-file)
(global-unset-key (kbd "M-!"))
(global-set-key (kbd "M-!") 'shell-command-on-buffer)
(global-set-key "\C-xte" 'balle-show-emacs-list)
(global-set-key "\C-xth" 'balle-show-hack-list)
(global-set-key "\C-xti" 'org-redmine-get-issue)
(global-set-key "\C-xtN" 'balle-show-note-list)
(global-set-key "\C-xtp" 'balle-show-python-list)
(global-set-key "\C-xtr" 'balle-show-read-list)
(global-set-key "\C-xts" 'balle-show-started-list)
(global-set-key "\C-xtt" 'balle-show-todo-list)
(global-set-key "\C-xtW" 'balle-show-waiting-list)
(global-set-key "\C-xtx" 'balle-show-next-list)
(global-set-key "\C-xtd" 'balle-show-daily-tasks)
(global-set-key "\C-xtw" 'balle-show-weekly-tasks)
(global-set-key "\C-xtm" 'balle-show-monthly-tasks)
(global-set-key "\C-xty" 'balle-show-yearly-tasks)
(global-set-key (kbd "M-[ d") 'backward-word)
(global-set-key (kbd "M-[ c") 'forward-word)
(global-set-key (kbd "C-c C-<up>") 'move-text-up)
(global-set-key (kbd "C-c C-<down>") 'move-text-down)
(global-set-key (kbd "C-x <up>") 'win-switch-up)
(global-set-key (kbd "C-x <down>") 'win-switch-down)
(global-set-key (kbd "C-x <left>") 'win-switch-left)
(global-set-key (kbd "C-x <right>") 'win-switch-right)

(global-set-key "\C-c\C-u" 'outline-backward-same-level)
(global-set-key "\C-c\C-d" 'outline-forward-same-level)
(global-set-key (kbd "C-c s") 'switch-to-buffer)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(global-set-key "\C-xw" 'wiki)
(global-set-key [f1] 'magit-status)
(global-set-key [f2] 'outline-cycle)
;(global-set-key [f3] 'org-agenda)
(global-set-key [f3] 'my-open-calendar)
(global-set-key [f4] 'balle-projectile-open-all-recent)
(global-set-key [f5] 'flyspell-auto-correct-word)
(global-set-key [f6] 'flyspell-goto-next-error)
(global-set-key [f7] 'balle-flyspell-add-word)
(global-set-key [f8] 'org-capture)
(global-set-key [f9] 'balle-redmine-tickets)
(global-set-key [f10] 'flycheck-prev-error)
(global-set-key [f11] 'flycheck-next-error)
