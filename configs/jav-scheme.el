;; customizations regarding scheme

;;(setq quack-fontify-style nil
;;      quack-programs '("racket" "guile" "mit-scheme" "scheme"))

;; go away, I need ido-mode
;;(setq quack-remap-find-file-bindings-p nil)

(require 'jav-procs)

(defun racket-file-p (filename)
  "test if `filename` is a racket filehc
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
             (kbd "C-c C-c")
             'run-scheme-according-to-its-type)
            (local-set-key
             (kbd "<f7>")
             'run-scheme-according-to-its-type)))

;; highlight current sexp
(require 'highlight-sexp)
(add-hook 'scheme-mode-hook 'highlight-sexp-mode)
(add-hook 'lisp-mode-hook 'highlight-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-sexp-mode)

(put 'proc-entry 'safe-local-variable
     'safe-mit-scheme-entry-filenamep)

(provide 'jav-scheme)
