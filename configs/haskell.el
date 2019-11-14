;;; Haskell-specific configs

(require 'lsp)
(require 'lsp-mode)
(require 'lsp-haskell)

(setq lsp-prefer-flymake nil)

(add-hook 'haskell-mode-hook #'lsp)
