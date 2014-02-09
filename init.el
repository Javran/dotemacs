(package-initialize)
(require 'hlinum)
(hlinum-activate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e"
			      "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
			      default)))
 '(global-linum-mode t)
 '(haskell-indent-spaces 4)
 '(menu-bar-mode nil)
 '(package-archives (quote (("melpa" . "http://melpa.milkbox.net/packages/")
			    ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(quack-programs (quote ("mitscheme" "racket" "bigloo"
			  "csi" "csi -hygienic" "gosh"
			  "gsi" "gsi ~~/syntax-case.scm -"
			  "guile" "kawa" "mit-scheme" "mred -z"
			  "mzscheme" "mzscheme -il r6rs"
			  "mzscheme -il typed-scheme"
			  "mzscheme -M errortrace"
			  "mzscheme3m" "mzschemecgc" "rs"
			  "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil
		:stipple nil
		:inverse-video nil
		:box nil
		:strike-through nil
		:overline nil
		:underline nil
		:slant normal
		:weight normal
		:height 120
		:width normal
		:foundry "unknown"
		:family "DejaVu Sans Mono")))))

;; required by ghc mode
;;   using flymake
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))


;; global settings
(show-paren-mode 1)

;; seems to be an issue:
;;   https://github.com/dacap/keyfreq/issues/9
(require 'cl)
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(global-set-key (kbd "<f2> l") 'org-store-link)
(global-set-key (kbd "<f2> a") 'org-agenda)
(global-set-key (kbd "<f2> b") 'org-iswitchb)
