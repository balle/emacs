(deftheme balle
  "Created 2013-07-31.")

(custom-theme-set-faces
 'balle
 '(default ((t (:family "default" :foundry "default" :width normal :height 1 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "unspecified-fg" :background "unspecified-bg" :stipple nil :inherit nil))))
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 '(font-lock-builtin-face ((t (:foreground "#11f2f5"))))
 '(font-lock-comment-face ((t (:foreground "#888a85"))))
 '(font-lock-function-name-face ((t (:foreground "orange"))))
 '(font-lock-keyword-face ((t (:foreground "#11f2f5"))))
 '(font-lock-string-face ((t (:foreground "#6df14b"))))
 '(font-lock-type-face ((t (:foreground"#8ae234"))))
 '(font-lock-variable-name-face ((t (:foreground "#f6e388"))))
 
 '(highlight ((t (:background "#7eff00" :foreground "black"))))
 '(region ((t (:foreground "#ffffff" :background "#666666"))))

 '(ediff-even-diff-A ((t (:background "yellow" :foreground "black"))))
 '(ediff-current-diff-B ((t (:background "yellow" :foreground "black"))))
 '(ediff-fine-diff-B ((t (:background "yellow" :foreground "black"))))
 
 '(rst-level-1-face ((t (:background "yellow" :foreground "black"))))
 '(rst-level-2-face ((t (:background "yellow" :foreground "black"))))
 '(rst-level-3-face ((t (:background "yellow" :foreground "black"))))
 	  
 '(hl-line ((t (:foreground "#ffffff" :background "#666666"))))
 '(fci-rule-color ((t (:foreground "#ffffff"))))
 '(flymake-errline ((t (:foreground "#ffffff" :background "#cd0f06"))))
 '(flymake-warnline ((t (:foreground "black" :background "yellow"))))
 '(mode-line ((t (:foreground "#ffffff" :background "#000000"))))
 '(region ((t (:background "#2e4ad7" :foreground "#ffffff"))))
 '(minibuffer-prompt ((t (:foreground "#7299ff" :bold t))))
 '(show-paren-match-face ((t (:bold t :foreground "red"))))
)

(provide-theme 'balle)

