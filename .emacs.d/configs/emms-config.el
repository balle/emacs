(install-missing-packages '(emms))

(require 'emms-setup)
;(require 'emms-browser)
(require 'emms-streams)
(require 'emms-mode-line)
;(require 'emms-lyrics)

(emms-standard)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/")


(emms-mode-line 1)
;(emms-lyrics 1)
(emms-browser-make-filter "all" 'ignore)

(require 'emms-history)

(defun emms-sleep-timer (minutes)
  (interactive "nMinutes: ")
  (sleep-for (* minutes 60))
  (emms-history-save)
  (emms-pause))

;(setq emms-history-start-playing t)
;(emms-history-load)
