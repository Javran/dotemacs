(require 'package)

(dolist
    (pkg-entry
     '(("melpa"
	. "https://melpa.org/packages/")))
  ;; insert packages at the end of the list
  (add-to-list 'package-archives pkg-entry t))

(package-initialize)

;; dropping the default "-l" before initialization.
;; https://github.com/purcell/exec-path-from-shell/issues/40
;; or alternatively let .zprofile source from .profile: https://superuser.com/a/187673/459888
(setq exec-path-from-shell-arguments (quote ("-i")))
(exec-path-from-shell-initialize)

(dolist
    (lpath
     (list
      ;; extensions not provided by *ELPA
      (expand-file-name "extensions" user-emacs-directory)))
  (add-to-list 'load-path lpath))

(load-file "~/.emacs.d/configs/global.el")
(load-file "~/.emacs.d/configs/haskell.el")
(load-file "~/.emacs.d/configs/webdev.el")
(load-file "~/.emacs.d/configs/typescript.el")

;;; Look-and-feel related stuff are organized here because it is easier to simply eval-buffer and try it out.
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(global-linum-mode t)
(column-number-mode nil)

;; https://github.com/bbatsov/solarized-emacs
(load-theme 'solarized-dark t)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; https://github.com/nonsequitur/smex
(require 'smex)
(smex-initialize)

(require 'hlinum)
(hlinum-activate)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)



;;; Following parts are reserved for emacs to update its own configs.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; Dhall auto-formating must be disabled otherwise it destorys some comments.
 '(dhall-format-at-save nil)
 '(ido-default-file-method (quote selected-window))
 '(lsp-enable-snippet nil)
 '(package-selected-packages
   (quote
    (yaml-mode dhall-mode tide exec-path-from-shell add-node-modules-path flycheck-color-mode-line js2-mode web-mode crux lsp-haskell lsp-mode flycheck lsp-ui company-lsp keyfreq expand-region hlinum ag smex magit solarized-theme)))
 '(typescript-indent-level 2)
 ;; those auto-things are absolutely stupid and I want none of them.
 '(web-mode-enable-auto-closing nil)
 '(web-mode-enable-auto-expanding nil)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-opening nil)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-enable-auto-quoting nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
