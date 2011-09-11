; xml support
  (setq auto-mode-alist
        (cons '("\\.\\(xml\\|xsl\\|rng\\|rss\\|xsd\\|xslt\\|xhtml\\)\\'" . nxml-mode)
              auto-mode-alist))
;  (setq magic-mode-alist
;	  (cons '("<?xml " . nxml-mode)
;	  magic-mode-alist))
;   (fset 'xml-mode 'nxml-mode)
(add-hook 'nxml-mode-hook
 (lambda ()
 (define-key nxml-mode-map (kbd "<f8>") 'browse-url-of-buffer)
 (define-key nxml-mode-map (kbd "<tab>") 'html-next-content)
 (define-key nxml-mode-map (kbd "S-<tab>") 'html-previous-content)))

