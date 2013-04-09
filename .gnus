; filter spam
(spam-initialize)
(require 'gnus-bogofilter)
(setq bogofilter-spam-group "INBOX.Junk")
(setq spam-use-bogofilter t)

;; delete mail with x key
(defun my-gnus-summary-catchup-and-exit ()
  (interactive)
  (gnus-summary-catchup-and-exit t t))

(defun my-bogofilter (arg)
  (interactive)
  (let ((articles (sort (copy-sequence (gnus-summary-work-articles nil)) '<))
	(save-excursion
	  (while articles
	    (gnus-summary-remove-process-mark (car articles))
	    (let ((article (car articles))
		   (tl/gnus-article-buffer article)
		   (with-temp-buffer
		     (insert-buffer art)
		     (call-process-region (point-min) (point-max) "bogofilter"
					  nil nil nil arg)
		     (if (eq arg "-s")
			 (gnus-summary-move-article 1 bogofilter-spam-group)))
		   (setq articles (cdr articles)))))))))

(defun my-bogofilter-register-spam ()
  (interactive)
  (my-bogofilter "-s"))

(defun my-bogofilter-register-ham ()
  (interactive)
  (my-bogofilter "-n"))

(let ((map gnus-summary-mode-map))
  (define-key map (kbd "x") 'gnus-summary-delete-article)
  (define-key map (kbd "c") 'my-gnus-summary-catchup-and-exit))
(setq gnus-novice-user nil)

;; Fetch only part of the article
(setq gnus-read-active-file 'some)

;; what header to display in article
(setq gnus-visible-headers "^From:\\|^Subject:\\|^Newsgroups:\\|^Date:\\|^User-Agent:")

;; columns in summary buffer
(setq gnus-summary-line-format "%U%R%d%I%(%[%4L: %-23,23f%]%) %s\n")

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

;; sort messages by date in reverse order
(setq gnus-thread-sort-functions '((not gnus-thread-sort-by-date)))

;; Setup GPG/PGP
(require 'epa-file)
(epa-file-enable)

;; remember addresses
(add-to-list 'load-path "~/.emacs.d/extensions/bbdb-2.34/lisp")
(setq bbdb-file "~/.emacs.d/bbdb")
(require 'bbdb)
(bbdb-initialize)
(setq
     bbdb-offer-save 1                        ;; 1 means save-without-asking
     bbdb-use-pop-up nil                        ;; allow popups for addresses
     bbdb-electric-p t                        ;; be disposable with SPC
     bbdb-popup-target-lines  1               ;; very small
     bbdb-dwim-net-address-allow-redundancy t ;; always use full name
     bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs
     bbdb-always-add-address t                ;; add new addresses to existing...
     bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx
     bbdb-completion-type nil                 ;; complete on anything
     bbdb-complete-name-allow-cycling t       ;; cycle through matches
     bbbd-message-caching-enabled t           ;; be fast
     bbdb-use-alternate-names t               ;; use AKA
     bbdb-elided-display t                    ;; single-line addresses
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
		      (local-set-key (kbd "<tab>") 'bbdb-complete-name)
		      )))

;; Read usenet news and RSS feeds with gwene.org
(setq gnus-secondary-select-methods '((nntp "news.gwene.org")))

; load custom settings
(load-file "~/.gnus-custom")