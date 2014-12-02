(require 'tls)

(defun start-irc ()
   "Connect to IRC."
   (interactive)
   (erc-tls :server "irc.chaostal.de" :port 6697
        :nick "balle" :full-name "Bastian Ballmann")
   (erc :server "localhost" :port 6667
        :nick "balle" :full-name "Bastian Ballmann")
   (setq erc-autojoin-channels-alist '(("irc.chaostalde" "#chaostal" "#ircnets"))))

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
