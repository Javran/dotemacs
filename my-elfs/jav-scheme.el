;; customizations regarding scheme

;; go away, I need ido-mode
(setq quack-remap-find-file-bindings-p nil)

(add-hook 'scheme-mode-hook
	  (lambda ()
	    (local-set-key (kbd "<f7> r")
			   'run-mit-scheme-with-related-file)))

(provide 'jav-scheme)
