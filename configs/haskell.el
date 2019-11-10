;;; Haskell-specific configs

(require 'lsp)
(require 'lsp-mode)
(require 'lsp-haskell)

(add-hook 'haskell-mode-hook #'lsp)
