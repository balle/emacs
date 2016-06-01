(install-missing-packages '(yaml-mode
			    ansible
			    ansible-doc))

(add-hook 'yaml-mode-hook '(lambda () (ansible 1)
			    (ansible-doc-mode 1)))

