; spell checking
(require 'ispell)
(setq ispell-program-name "aspell")
(setq ispell-local-dictionary-alist nil)
(add-to-list 'ispell-local-dictionary-alist
	     '("de_DE"
 	       "[[:alpha:]]" "[^[:alpha:]]"
	       "[']" t
	       ("-C" "-d" "de_DE")
 	        "~latin1" iso-8859-1)
 	     )

(setq ispell-dictionary "de_DE")
(setq ispell-local-dictionary "de_DE")
(setq ispell-default-dictionary "de_DE")
(setq flyspell-default-dictionary "de_DE")
(defun turn-on-flyspell-mode ()
   (flyspell-mode 1)
)

(defun balle-flyspell-add-word ()
  (interactive)
  (setq word (ispell-get-word nil))
  (ispell-add-per-file-word-list (car word))
)
