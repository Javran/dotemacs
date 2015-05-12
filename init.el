(require 'package)

(dolist
    (pkg-entry
     '(("melpa"          . "http://melpa.milkbox.net/packages/")
       ("melpa-stable"   . "http://melpa-stable.milkbox.net/packages/")))
  ;; insert packages at the end of the list
  (add-to-list 'package-archives pkg-entry t))

(package-initialize)

(dolist
    (lpath
     (list
      ;; extensions not provided by *ELPA
      (expand-file-name "extensions" user-emacs-directory)
      ;; my own customization
      (expand-file-name "configs" user-emacs-directory)))
  (add-to-list 'load-path lpath))

;; all the other customizations should be placed in jav-init
;; the rest part of this file is left for emacs to update customizations
;; and we don't have to be mad about emacs producing quite unreadable codes
(require 'jav-init)

;; see discussion: http://stackoverflow.com/questions/22470820/font-lock-mode-in-haskell-mode-seems-to-ruin-the-width-of-single-spaces-in-emacs (theme manoj-dark breaks layout)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
  '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc)))
 '(haskell-cabal-list-comma-position (quote after))
 '(hi2-ifte-offset 2)
 '(hi2-layout-offset 4)
 '(hi2-left-offset 4)
 '(hi2-starter-offset 0)
 '(ido-default-file-method (quote selected-window))
 '(proof-splash-enable nil)
 '(proof-splash-time 0)
 '(quack-programs (quote ("mzscheme" "racket" "guile" "mit-scheme" "scheme")))
 '(safe-local-variable-values
   (quote
    ((sgml-parent-document "users_guide.xml" "book" "chapter")
     (buffer-file-coding-system . utf-8-unix)
     (flycheck-gcc-language-standard . c++11)
     (flycheck-clang-definitions NOT_OJ)
     (flycheck-gcc-definitions NOT_OJ)
     (flycheck-clang-definitions . NOT_OJ)
     (flycheck-gcc-definitions . NOT_OJ)
     (flycheck-clang-definitions . "NOT_OJ")
     (flycheck-gcc-definitions . "NOT_OJ"))))
 '(tooltip-hide-delay 100000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Luculent"))))
 '(font-lock-function-name-face ((t (:foreground "mediumspringgreen" :weight bold :height 1.0))))
 '(ghc-face-error ((t nil)))
 '(ghc-face-hole ((t nil)))
 '(ghc-face-warn ((t nil))))
