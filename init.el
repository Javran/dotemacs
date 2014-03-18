(package-initialize)
(load-library "xscheme")

(let ((emacs-home (expand-file-name "~/.emacs.d/")))
  ;; extension-dir :: some plugin that are not provided by *elpa
  ;; jav-conf-dir  :: my customizations
  ;; my-elfs       :: my elisp files
  (let ((extension-dir (concat emacs-home "extensions/"))
        (jav-conf-dir (concat emacs-home "my-elfs/")))
    (add-to-list 'load-path extension-dir)
    (add-to-list 'load-path jav-conf-dir)
    ))

(require 'jav-emacs)
(require 'jav-keys)
(require 'jav-procs)
(require 'jav-misc)
(require 'jav-scheme)
(require 'jav-haskell)

;; highlight text between parentheses, might conflict with hl-sexp..
;; (setq show-paren-style 'expression)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(haskell-indent-after-keywords (quote (("where" 4 0) ("of" 2) ("do" 4) ("mdo" 4) ("rec" 2) ("in" 4 0) ("{" 2) "if" "then" "else" "let")))
 '(package-archives (quote (("melpa" . "http://melpa.milkbox.net/packages/") ("gnu" . "http://elpa.gnu.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil
                         :box nil :strike-through nil :overline nil :underline nil :slant normal
                         :weight normal :height 120 :width normal :foundry "unknown" :family "Luculent"))))
 ;; see discussion: http://stackoverflow.com/questions/22470820/font-lock-mode-in-haskell-mode-seems-to-ruin-the-width-of-single-spaces-in-emacs
 '(font-lock-function-name-face ((t (:foreground "mediumspringgreen" :weight bold :height 1.0)))))
