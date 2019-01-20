(require 'package)

(dolist
    (pkg-entry
     '(("melpa"          . "http://melpa.org/packages/")
       ("melpa-stable"   . "http://stable.melpa.org/packages/")
       ))
  ;; insert packages at the end of the list
  (add-to-list 'package-archives pkg-entry t))

(setenv "PATH"
  (concat
   (expand-file-name "~/.nvm/versions/node/v10.15.0/bin") path-separator
   (getenv "PATH")))
(add-to-list 'exec-path
             (expand-file-name "~/.nvm/versions/node/v10.15.0/bin"))
(package-initialize)

(dolist
    (lpath
     (list
      ;; extensions not provided by *ELPA
      (expand-file-name "extensions" user-emacs-directory)
      ;; my own customization
      (expand-file-name "configs" user-emacs-directory)))
  (add-to-list 'load-path lpath))

;; http://emacs.stackexchange.com/a/19110/8294
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
(require 'tramp)

;; all the other customizations should be placed in jav-init
;; the rest part of this file is left for emacs to update customizations
;; and we don't have to be mad about emacs producing quite unreadable codes
(require 'jav-init)

(load-theme 'solarized-dark t)
(setq solarized-high-contrast-mode-line t)

;; (load-file
;;  (let ((coding-system-for-read 'utf-8))
;;    (shell-command-to-string "agda-mode locate")))

;; see discussion: http://stackoverflow.com/questions/22470820/font-lock-mode-in-haskell-mode-seems-to-ruin-the-width-of-single-spaces-in-emacs (theme manoj-dark breaks layout)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(c-default-style
   (quote
    ((c++-mode . "java")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc javascript-jshint)))
 '(flycheck-haskell-runghc-command (quote ("cabal" "exec" "--" "runghc")))
 '(haskell-cabal-list-comma-position (quote after))
 '(hi2-ifte-offset 2)
 '(hi2-layout-offset 4)
 '(hi2-left-offset 4)
 '(hi2-starter-offset 0)
 '(ido-default-file-method (quote selected-window))
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (flycheck-haskell kotlin-mode scala-mode csharp-mode typescript-mode llvm-mode json-mode web-mode mocha tuareg tabbar-ruler sr-speedbar solarized-theme smex racket-mode psci paredit magit lua-mode idris-mode fuel flymake-hlint flymake-haskell-multi flymake-cursor flycheck-purescript flycheck-hdevtools flycheck-elm expand-region ess elm-mode elixir-mode deferred ctable company-ghc company-coq company-cabal company-auctex coffee-mode clojure-test-mode cdlatex buffer-move bison-mode auto-complete ag keyfreq hindent hi2 hlinum)))
 '(proof-splash-enable nil)
 '(proof-splash-time 0)
 '(safe-local-variable-values
   (quote
    ((flycheck-clang-language-standard . c++11)
     (sgml-basic-offset . 4)
     (sgml-basic-offset . 2)
     (js2-basic-offset . 2)
     (sgml-parent-document "users_guide.xml" "book" "chapter")
     (buffer-file-coding-system . utf-8-unix)
     (haskell-language-extensions "-XArrows")
     (flycheck-gcc-language-standard . c++11)
     (flycheck-clang-definitions NOT_OJ)
     (flycheck-gcc-definitions NOT_OJ)
     (flycheck-clang-definitions . NOT_OJ)
     (flycheck-gcc-definitions . NOT_OJ)
     (flycheck-clang-definitions . "NOT_OJ")
     (flycheck-gcc-definitions . "NOT_OJ"))))
 '(tab-width 4)
 '(tooltip-hide-delay 100000)
 '(tooltip-use-echo-area t)
 '(typescript-auto-indent-flag nil)
 '(typescript-indent-level 2)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-enable-auto-quoting nil))
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
