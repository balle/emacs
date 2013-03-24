;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gnus-bogofilter.el - Bogofilter commands for Gnus
;;
;; The original code was made by Lucas Bergman (2004-01-21). Slightly
;; modified by Teemu Likonen (2009-03-02).
;;
;; Put this file somewhere in your load-path and add line
;;
;;     (require 'gnus-bogofilter)
;;
;; to Gnus's init file (~/gnus.el).
;;
;; Variable `bogofilter-spam-group' can be customized. It's a string
;; consisting a mail bag-end and a spam mail group. The default value is
;; "nnmaildir:spam". This script defines two interactive commands:
;; `bogofilter-register-spam' and `bogofilter-register-ham'. They
;; operate on the current message. For more info, see the documentation
;; of these functions.
;;

(eval-when-compile
  (require 'gnus)
  (require 'gnus-sum))

(defcustom bogofilter-spam-group "nnmaildir:spam"
  "Message group to which spam messages will be moved.
Command `gnus-bogofilter-register-spam' will move messages to
this group."
  :type '(string)
  :group 'gnus-article)

(defun tl/gnus-article-buffer (&optional article)
  (let ((article (gnus-summary-article-number)))
    (save-window-excursion
      (gnus-summary-goto-subject article)
      (gnus-summary-show-article t)
      (get-buffer gnus-article-buffer))))

(defun tl/gnus-bogofilter-register (bogo-switch)
  (let ((art (tl/gnus-article-buffer)))
    (with-temp-buffer
      (insert-buffer art)
      (call-process-region (point-min) (point-max) "bogofilter"
                           nil nil nil bogo-switch))))

(defun bogofilter-register-spam (&optional arg)
  "Register the current article as `spam' with bogofilter, then
move the article to the spam group, defined by
`bogofilter-spam-group'. This function is a shortcut to running the
current article through `bogofilter -s'.\n
With optional prefix argument, first unregister the message as
`ham', then register it as `spam' and move to the spam group.
This is a shortcut to running the article through `bogofilter
-Ns'."
  (interactive "P")
  (tl/gnus-bogofilter-register (if arg "-Ns" "-s"))
  (gnus-summary-move-article 1 bogofilter-spam-group))

(defun bogofilter-register-ham (&optional arg)
  "Register the current article as `ham' with bogofilter. This
function is a shortcut to running the current article through
`bogofilter -n'.\n
With optional prefix argument, first unregister the message as
`spam' and then register it as `ham'. This is a shortcut to
running the article through `bogofilter -Sn'."
  (interactive "P")
  (tl/gnus-bogofilter-register (if arg "-Sn" "-n")))

(let ((map gnus-summary-mode-map))
  (define-key map (kbd "C-c g s") 'bogofilter-register-spam)
  (define-key map (kbd "C-c g h") 'bogofilter-register-ham))

(provide 'gnus-bogofilter)
