(require 'package)

(dolist
    (pkg-entry
     '(("melpa"
	. "https://melpa.org/packages/")))
  ;; insert packages at the end of the list
  (add-to-list 'package-archives pkg-entry t))

(package-initialize)

(dolist
    (lpath
     (list
      ;; extensions not provided by *ELPA
      (expand-file-name "extensions" user-emacs-directory)))
  (add-to-list 'load-path lpath))

(load-file "~/.emacs.d/configs/global.el")

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
 '(ido-default-file-method (quote selected-window))
 '(package-selected-packages
   (quote
    (keyfreq expand-region hlinum ag smex magit solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
