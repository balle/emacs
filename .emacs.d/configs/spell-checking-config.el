; spell checking
(require 'ispell)

(setq ispell-dictionary-alist
        '(
                  ("de_DE"
                            "[a-zäöüßA-ZÄÖÜ]" "[^a-zäöüßA-ZÄÖÜ]" "[']" nil
                            ("-d" "de_DE" "-i" "iso-8859-1") nil iso-8859-1)

                  ("en_US"
                            "[a-zA-Z]" "[^a-zA-Z]" "[']" nil
                            ("-d" "en_US" "-i" "iso-8859-1") nil iso-8859-1)

                  ("en_GB"
                            "[a-zA-Z]" "[^a-zA-Z]" "[']" nil
                            ("-d" "en_GB" "-i" "iso-8859-1") nil iso-8859-1)

              )
        )

(eval-after-load "ispell"
      (progn
        (setq ispell-dictionary "de_DE")
        ;(setq ispell-extra-args '("-t")) ; input is tex or latex
        (setq ispell-silently-savep t)   ; save personal dict without confirmation
                               )
      )

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
