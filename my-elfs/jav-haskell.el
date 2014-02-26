;;; customizations for haskell-mode

;; required by ghc mode
;;   using flymake
(autoload 'ghc-init "ghc" nil t)

(setq haskell-indent-spaces 4)

(setq haskell-indent-after-keywords
      (quote (("where" 4 0)
              ("of" 2)
              ("do" 4)
              ("mdo" 4)
              ("rec" 2)
              ("in" 4 0)
              ("{" 2)
              "if"
              "then"
              "else"
              "let")))

(defun my-haskell-mode-hook ()
  "customizations for haskell mode"
  (ghc-init)
  (flymake-mode)
  (haskell-indentation-mode -1)
  (turn-on-haskell-indent)
  (setq locale-coding-system 'utf-8)
  (flymake-haskell-multi-load)
  )

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(provide 'jav-haskell)
