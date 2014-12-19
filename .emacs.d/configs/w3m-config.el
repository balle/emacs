; browser
(install-missing-packages '(w3m))
(require 'w3m-autoloads)

(setq browse-url-browser-function 'w3m-goto-url-new-session)
;(setq browse-url-browser-function 'w3m-browse-url browse-url-new-window-flag t)

; set user agent
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

; allow cookies
(setq w3m-use-cookies t)
(setq w3m-cookie-accept-bad-cookies t)

; default search engine
(require 'w3m-search)

(add-to-list 'w3m-search-engine-alist
    '("ixquick" "https://www.ixquick.com/do/search?q=%s"))

(setq w3m-search-default-engine "ixquick")

; set proxy
;(setq w3m-command-arguments
;      (nconc w3m-command-arguments
;             '("-o" "http_proxy=http://proxy.hogege.com:8000/")))

; web jump
(defun balu-wiki (topic)
  "Opens the Balu wiki in w3m-new-session"
  (interactive (list
                (read-string "Enter the topic (default: linux/systemd): " nil nil "linux/systemd" nil)))
  (browse-url (format "http://balu-wiki.readthedocs.org/en/latest/%s.html" topic))
)

; save sessions
(defun w3m-register-desktop-save ()
  "Set `desktop-save-buffer' to a function returning the current URL."
  (setq desktop-save-buffer (lambda (desktop-dirname) w3m-current-url)))

(add-hook 'w3m-mode-hook 'w3m-register-desktop-save)
(add-hook 'w3m-form-input-textarea-mode-hook '(lambda () (yas-minor-mode))

(defun w3m-restore-desktop-buffer (d-b-file-name d-b-name d-b-misc)
  "Restore a `w3m' buffer on `desktop' load."
  (when (eq 'w3m-mode desktop-buffer-major-mode)
    (let ((url d-b-misc))
      (when url
        (require 'w3m)
        (if (string-match "^file" url)
            (w3m-find-file (substring url 7))
          (w3m-goto-url-new-session url))
        (current-buffer)))))

(add-to-list 'desktop-buffer-mode-handlers '(w3m-mode . w3m-restore-desktop-buffer))


; copy url at point
(defun w3m-copy-url-at-point ()
  (interactive)
  (let ((url (w3m-anchor)))
    (if (w3m-url-valid url)
	(kill-new (w3m-anchor))
      (message "No URL at point!"))))

(add-hook 'w3m-mode-hook
	  (lambda ()
	    (local-set-key "\M-W" 'w3m-copy-url-at-point)
	    (local-set-key (kbd "<up>") 'previous-line)
	    (local-set-key (kbd "<down>") 'next-line)
	    (local-set-key (kbd "<left>") 'backward-char)
	    (local-set-key (kbd "<right>") 'forward-char)))
