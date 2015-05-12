;; customizations for PureScript

(load "purescript-mode-autoloads")

(defun purescript-hook ()
  (turn-on-purescript-simple-indent)
  (define-key purescript-mode-map (kbd "<return>") 'purescript-simple-indent-newline-same-col)
  (define-key purescript-mode-map (kbd "C-<return>") 'purescript-simple-indent-newline-indent)
  )

(add-hook 'purescript-mode-hook 'purescript-hook)

(provide 'jav-purescript)
