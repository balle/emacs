;; borrowed from https://www.reddit.com/r/emacs/comments/6f0rkz/my_fancy_eshell_prompt/
;; and slightly modified. Thanks!
(setq eshell-prompt-function
(lambda ()
(concat
(propertize "┌─[" 'face `(:foreground "green"))
(propertize (format-time-string "%H:%M:%S" (current-time)) 'face `(:foreground "yellow"))
(propertize "]──[" 'face `(:foreground "green"))

(propertize (user-login-name) 'face (if (= (user-uid) 0) `(:foreground  "red") `(:foreground  "white")))
(propertize "@" 'face `(:foreground "white"))
(propertize (system-name) 'face `(:foreground "white"))

(propertize "]──[" 'face `(:foreground "green"))
(propertize (concat (eshell/pwd)) 'face `(:foreground "blue"))

(propertize "]\n" 'face `(:foreground "green"))
(propertize "└─>" 'face `(:foreground "green"))
(propertize (if (= (user-uid) 0) " # " " $ ") 'face `(:foreground "green"))
)))
