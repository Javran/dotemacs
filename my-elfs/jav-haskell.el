;;; customizations for haskell-mode

;; required by ghc mode
;;   using flymake
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

(add-hook 'haskell-mode-hook
	  'turn-on-haskell-indent)

(provide 'jav-haskell)
