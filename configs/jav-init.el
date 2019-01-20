;; most of the customizations should reside in this file

;; disgusting
(electric-indent-mode -1)
(add-hook
 'after-change-major-mode-hook
 (lambda()
   (electric-indent-mode -1)))

(load-library "xscheme")
(require 'jav-emacs)
(require 'jav-keys)
(require 'jav-procs)
(require 'jav-misc)
(require 'jav-scheme)
(require 'jav-haskell)
(require 'jav-purescript)

(defun indent-or-complete ()
  (interactive)
  (if (looking-at "\\_>")
      (company-complete-common)
    (indent-according-to-mode)))

(defun complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-complete-common)
    (indent-according-to-mode)))

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-emacs-lisp-load-path load-path)

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(require 'flycheck)

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

(add-hook 'after-init-hook 'global-company-mode)

(global-set-key "\t" 'indent-or-complete)

;; TODO: http://bit.ly/1dZH1B4


(add-hook 'doc-view-mode-hook
          (lambda ()
            (linum-mode -1)))

(require 'company-yasnippet)
(setq company-idle-delay 0.1)
(setq company-dabbrev-ignore-case t)
(setq company-dabbrev-downcase nil)
(setq mouse-yank-at-point t)
;; (add-to-list 'company-backends 'company-yasnippet)

;; (load "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")
(load "~/.emacs.d/lisp/PG/generic/proof-site")

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'factor-mode)

(provide 'jav-init)
