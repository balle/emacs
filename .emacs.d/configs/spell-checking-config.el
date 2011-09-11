; translation
(autoload 'babel "babel"
    "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
    "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
    "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
    "Use a web translation service to translate the current buffer." t)

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
