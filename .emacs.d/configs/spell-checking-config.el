; spell checking
(require 'ispell)

(setq ispell-dictionary-base-alist
  '(
 	("de_DE"
 	 "[a-zäöüßA-ZÄÖÜ]" "[^a-zäöüßA-ZÄÖÜ]" "[']" nil
 	 ("-d" "de_DE") nil utf-8)
	
 	("de_CH"
 	 "[a-zäöüA-ZÄÖÜ]" "[^a-zäöüA-ZÄÖÜ]" "[']" nil
 	 ("-d" "de_CH") nil utf-8)
	
 	("en_US"
 	 "[a-zA-Z]" "[^a-zA-Z]" "[']" nil
 	 ("-d" "en_US") nil utf-8)
	
 	("en_GB"
 	 "[a-zA-Z]" "[^a-zA-Z]" "[']" nil
 	 ("-d" "en_GB") nil utf-8)
	
    )
)

(eval-after-load "ispell"
    (progn
         (setq ispell-dictionary "de_DE")
	 (setq ispell-extra-args '("-i" "utf-8"))
	 (setq ispell-silently-savep t)
     )
)

;(setq flyspell-default-dictionary "swissgerman")
(setq-default ispell-program-name "hunspell")
(setq ispell-really-hunspell t)

(defun turn-on-flyspell-mode ()
   (flyspell-mode 1)
)

(defun balle-flyspell-add-word ()
  (interactive)
  (setq word (ispell-get-word nil))
  (ispell-add-per-file-word-list (car word))
)
