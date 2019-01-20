;;; jav-emacs: emacs customizations
;;;
;;; this file contains settings that
;;; are shipped with emacs.

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(global-linum-mode t)
(column-number-mode nil)

(setq
 TeX-PDF-mode t
;; ac-auto-show-menu t
 hl-sexp-background-color "RoyalBlue4"
 )

;; always show the balancing parenthesis
(show-paren-mode 1)

;; highlight text between parentheses, might conflict with hl-sexp..
;; (setq show-paren-style 'expression)

;; external browser
(setq
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "/usr/bin/firefox-bin"
 )

(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)

(dolist (maj-mod-hook
         '(TeX-mode-hook
           haskell-cabal-mode-hook
           emacs-lisp-mode-hook
           markdown-mode-hook
           haskell-mode-hook
           scheme-mode-hook
           makefile-mode-hook
           c-mode-hook
           c++-mode-hook
           R-mode-hook
           tuareg-mode-hook
           coq-mode-hook
           clojure-mode-hook
           python-mode-hook
           html-mode-hook
           compilation-mode-hook
           js-mode-hook
           css-mode-hook
           web-mode-hook
           ))
  (add-hook maj-mod-hook
            (lambda ()
              (setq show-trailing-whitespace t))))


;; https://github.com/senny/cabbage/issues/175
(global-auto-revert-mode)

(provide 'jav-emacs)
