;; customizations regarding scheme

;; go away, I need ido-mode
(setq quack-remap-find-file-bindings-p nil)

(defun racket-file-p (filename)
  "test if `filename` is a racket file
   (by looking at its file extension)"
  (and (stringp filename)
       (string= "rkt" (file-name-extension filename))))

(defun run-scheme-according-to-its-type ()
  "run a scheme implementation according to
   the current file type. If the current file's
   extension is '.rkt', racket will be called.
   otherwise mit-scheme will be called."
  (interactive)
  (if (racket-file-p (buffer-file-name))
      ;; racket file
      (run-racket-with-related-file)
    ;; well it's mit-scheme
    (run-mit-scheme-with-related-file)))

(add-hook 'scheme-mode-hook
	  (lambda ()
            (local-set-key
             (kbd "<f7>")
             'run-scheme-according-to-its-type)))

(provide 'jav-scheme)
