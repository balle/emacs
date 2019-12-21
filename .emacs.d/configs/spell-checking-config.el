; spell checking
(require 'ispell)

(setq ispell-local-dictionary "de_DE")
(setq ispell-local-dictionary-alist '(("de_DE" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "de_DE") nil utf-8)))
(setq ispell-silently-savep t)
(setq-default ispell-program-name "hunspell")
(setq ispell-really-hunspell t)
(setq ispell-skip-html t)

(eval-after-load "ispell"
(progn
(setq ispell-dictionary "de_DE")
;(setq ispell-extra-args '("-t")) ; input is tex or latex
(setq ispell-silently-savep t) ; save personal dict without confirmation
))


(defun turn-on-flyspell-mode ()
   (flyspell-mode 1)
)

(defun balle-flyspell-add-word ()
  (interactive)
  (setq word (ispell-get-word nil))
  (ispell-add-per-file-word-list (car word))
)
