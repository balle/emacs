; spell checking
(require 'ispell)

(setq ispell-dictionary "german")
(setq ispell-silently-savep t)
(setq-default ispell-program-name "hunspell")
(setq ispell-really-hunspell t)
(setq ispell-skip-html t)

(defun turn-on-flyspell-mode ()
   (flyspell-mode 1)
)

(defun balle-flyspell-add-word ()
  (interactive)
  (setq word (ispell-get-word nil))
  (ispell-add-per-file-word-list (car word))
)
