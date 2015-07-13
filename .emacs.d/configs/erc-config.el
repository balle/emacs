(require 'tls)

; ask for nick password
(require 'erc-services)
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password t)

(require 'erc-track)
(erc-track-mode t)

(add-hook 'erc-mode-hook
          '(lambda ()
	     (auto-complete-mode)
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)))

(require 'erc-netsplit)
(erc-netsplit-mode t)

(erc-timestamp-mode t)
(setq erc-timestamp-format "[%R-%m/%d]")

;; (defun start-irc ()
;;    "Connect to IRC."
;;    (interactive)
;;    (erc-tls :server "irc.oftc.net" :port 6697
;;         :nick "ootput" :full-name "ootput")
;;    (erc :server "irc.freenode.net" :port 6667
;;         :nick "ootput" :full-name "ootput")
;;    (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#screen" "#ion")
;;                                        ("oftc.net" "#debian"))))

(defun stop-irc ()
 (interactive)
 (dolist (buf (buffer-list))
  (with-current-buffer buf
    (message "MUH %s" major-mode)
    (if (eq (prin1-to-string major-mode) "erc-mode")
      (progn
	(message "MAEH")
      (kill-buffer buf))))))
