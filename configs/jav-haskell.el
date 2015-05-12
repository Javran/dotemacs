;;; customizations for haskell-mode

;; (setq haskell-indent-spaces 4)

(add-to-list
 'completion-ignored-extensions
 ".hi")

(defun run-current-haskell-file ()
  "run current haskell file without
   user interaction"
  (interactive)
  (shell-command-and-go-to-bottom
   (format "runhaskell %s"
           (shell-quote-argument (proc-entry-or-current-file)))))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; (eval-after-load 'flycheck
;;   '(require 'flycheck-hdevtools))

(speedbar-add-supported-extension ".hs")

(require 'hi2)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(defun my-haskell-mode-hook ()
  "customizations for haskell mode"

  (ghc-init)

  (haskell-indentation-mode -1)
  ;; (turn-on-haskell-indent)
  (turn-on-hi2)

  (setq locale-coding-system 'utf-8)

  (local-set-key
   (kbd "<f7>")
   'run-current-haskell-file)
  (local-set-key
   (kbd "C-c C-c")
   'run-current-haskell-file)
  )

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(require 'hsenv)

(provide 'jav-haskell)
;;; jav-haskell.el ends here
