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

(global-flycheck-mode)
(setq-default flycheck-emacs-lisp-load-path load-path)

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
;; (add-to-list 'company-backends 'company-yasnippet)

(load "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")


(provide 'jav-init)
