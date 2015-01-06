; filter spam
(gnus-registry-initialize)
(spam-initialize)
(setq my-trash-folder "INBOX/Trash")
(setq spam-split-group "INBOX/Junk")
(setq spam-use-bogofilter t)
(setq
 spam-log-to-registry t     ; for spam autodetection
 spam-use-regex-headers t   ; catch X-Spam-Flag (SpamAssassin)
 ;; all groups with ‘spam’ or 'junk' in the name contain spam
 gnus-spam-newsgroup-contents
            '(("spam" gnus-group-spam-classification-spam)
              ("junk" gnus-group-spam-classification-spam))
 spam-mark-only-unseen-as-spam t
 spam-mark-ham-unread-before-move-from-spam-group t)

;; delete mail with X key, use x to move to trash
(defun my-gnus-summary-catchup-and-exit ()
  (interactive)
  (gnus-summary-catchup-and-exit t t))

(defun my-gnus-summary-delete-article ()
  (interactive)
  (gnus-summary-delete-article)
  (next-line))

(defun my-gnus-summary-move-article-to-trash ()
  (interactive)
  (gnus-summary-move-article nil my-trash-folder)
  (next-line))

(defun my-gnus-show-last-articles ()
  (interactive)
  (gnus-summary-insert-old-articles 20))

(let ((map gnus-summary-mode-map))
  (define-key map (kbd "x") 'my-gnus-summary-move-article-to-trash)
  (define-key map (kbd "X") 'my-gnus-summary-delete-article)
  (define-key map (kbd "/l") 'my-gnus-show-last-articles)
  (define-key map (kbd "c") 'my-gnus-summary-catchup-and-exit))

; dont ask stupid questions
(setq gnus-novice-user nil)

;; Fetch only part of the article
(setq gnus-read-active-file 'some)

;; what header to display in article
(setq gnus-visible-headers "^From:\\|^To:\\|^CC:\\|^Subject:\\|^Newsgroups:\\|^Date:\\|^User-Agent:")

;; columns in summary buffer
(setq gnus-summary-line-format "%i %U%R%d%I%(%[%4L: %-23,23f%]%) %s\n")

;; Tree view for groups
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; use threads
(setq gnus-summary-thread-gathering-function
            'gnus-gather-threads-by-subject)
(setq gnus-thread-hide-subtree t)
;(setq gnus-thread-ignore-subject t)

; remember password for session
(setq imap-store-password t)

; close message buffer after sending
(setq message-kill-buffer-on-exit t)

;; automatically scan for new messages
(gnus-demon-add-handler `gnus-demon-scan-news 5 5)
(gnus-demon-init)

;; sort messages by score nd date in reverse order
(setq gnus-thread-sort-functions '((not gnus-thread-sort-by-date)
				   gnus-thread-sort-by-total-score))

;; No HTML mail
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

;; Setup GPG/PGP
(require 'epa-file)
(epa-file-enable)

;; remember addresses
(add-to-list 'load-path "~/.emacs.d/extensions/bbdb-2.35/lisp")
(setq bbdb-file "~/bbdb")
(require 'bbdb)
(bbdb-initialize)
(setq bbdb-use-pop-up nil)
(setq
     bbdb-offer-save 1                        ;; 1 means save-without-asking
     bbdb-always-add-address t                ;; add new addresses to existing...
     bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx
     bbdb-completion-type nil                 ;; complete on anything
     bbdb-complete-name-allow-cycling t       ;; cycle through matches
     bbbd-message-caching-enabled t           ;; be fast
     bbdb-use-alternate-names t               ;; use AKA
     ;; auto-create addresses from mail
     bbdb/mail-auto-create-p 'bbdb-ignore-some-messages-hook
     bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
     ;; NOTE: there can be only one entry per header (such as To, From)
     ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html
     '(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter")))

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(autoload 'bbdb/send-hook "moy-bbdb" "Function to be added to `message-send-hook' to notice records when sending messages" t)
(add-hook 'message-send-hook 'bbdb/send-hook)
(add-hook 'message-mode-hook
	  (function (lambda()
            (progn
              (flyspell-mode)
              (local-set-key (kbd "<tab>") 'bbdb-complete-name)
		      ))))

;; enable auto completion
(add-to-list 'ac-modes 'message-mode)
(setq ac-sources '(ac-source-semantic ac-source-yasnippet))
(ac-config-default)
(setq ac-delay 0.2)

;; delete mail immediately
(setq nnmail-expiry-wait 'immediate)

;; show all old messages in mail (INBOX) groups
;(defadvice gnus-summary-mode (after show-all-mails (&optional group))
;  (if (search "INBOX" group)
;      (gnus-summary-insert-old-articles t)))

;; vcard support
;; (require 'vcard)

;; don't ask how many emails to download
(setq gnus-large-newsgroup t)

;; Read usenet news and RSS feeds with gwene.org
(setq gnus-secondary-select-methods '((nntp "news.gwene.org")))

;; IMAP keep-alive
(setq imap-ping-interval (* 10 60))

;; emacs 24 has builtin keep-alive support
(if (< emacs-major-version 24)
    (progn
      (setq imap-ping-timer nil)

      (defun imap-ping-handler ()
        ;; ping all active IMAP servers in `nnimap-server-buffer-alist'
        (when (boundp 'nnimap-server-buffer-alist)
          (let ((servers nil))
            (mapc
             (lambda (server-buffer)
               (let ((server (car server-buffer))
                     (buffer (cadr server-buffer)))
                 (when (and (get-buffer buffer) (not (member server servers)))
                   (ignore-errors
                     (with-local-quit
                       (with-temp-message
                           (format "Pinging %s..." server)
                         (imap-send-command-wait "NOOP" buffer)
                         (message "Pinging %s...done" server))))
                   (setq servers (cons server servers)))))
             nnimap-server-buffer-alist)))

        (let* ((current (current-time))
               (timer imap-ping-timer)
               ;; compute the time when this timer will run again
               (next-time (timer-relative-time
                           (list (aref timer 1) (aref timer
                                                      2) (aref timer 3))
                           (* 5 (aref timer 4)) 0)))
          ;; if the activation time is far in the past, skip executions
          ;; until we reach a time in the future.  This avoids a long
          ;; pause if Emacs has been suspended for hours.
          (or (> ((not )th 0 next-time) (nth 0 current))
              (and (= (nth 0 next-time) (nth 0 current))
                   (> (nth 1 next-time) (nth 1 current)))
              (and (= (nth 0 next-time) (nth 0 current))
                   (= (nth 1 next-time) (nth 1 current))
                   (> (nth 2 next-time) (nth 2 current)))
              (progn
                (timer-set-time timer (timer-next-integral-multiple-of-time
                                       current imap-ping-interval)
                                imap-ping-handler)
                (timer-activate timer)))))

      (setq imap-ping-timer
            (run-at-time t imap-ping-interval 'imap-ping-handler))))

; mail search
(require 'nnir)

; scoring
(setq gnus-use-scoring t)
(setq bbdb/gnus-score-default 2000)
(setq max-specpdl-size 100000)

; load custom settings
(load-file "~/.gnus-custom")
