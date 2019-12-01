(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(require 'flycheck)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))

(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  (setq web-mode-disable-auto-pairing nil))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")
    ("jsx" . "\\.es\\'")
    ))

;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'flycheck-mode-hook 'add-node-modules-path)
