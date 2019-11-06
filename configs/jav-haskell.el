;;; customizations for haskell-mode

(setq haskell-indent-spaces 4)

(add-to-list
 'completion-ignored-extensions
 ".hi")

;; https://github.com/flycheck/flycheck-haskell/issues/89#issuecomment-394078307
(eval-after-load 'flycheck
  '(add-hook 'haskell-mode-hook #'flycheck-haskell-setup))

;; (eval-after-load 'flycheck
;;   '(require 'flycheck-hdevtools))

;; (speedbar-add-supported-extension ".hs")

(require 'hi2)

;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)

;;(add-hook 'haskell-mode-hook
;;          (lambda ()
;;            (set (make-local-variable 'company-backends)
;;                 (append '((company-capf company-dabbrev-code))
;;                         company-backends))))

(defun my-haskell-mode-hook ()
  "customizations for haskell mode"

  ;; (#'flycheck-haskell-setup)

  ;; (ghc-init)

  ;; (haskell-indentation-mode -1)
  ;; (turn-on-haskell-indent)
  ;; (turn-on-hi2)

  ;; (setq locale-coding-system 'utf-8)
  ;; (setq ghc-report-errors nil)
  ;; (add-to-list 'company-backends 'company-ghc)
  ;; (setq company-ghc-show-info nil)

  ;; (hindent-mode)
  )

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(require 'hindent)
(require 'hsenv)

(provide 'jav-haskell)
;;; jav-haskell.el ends here
