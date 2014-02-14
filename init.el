(package-initialize)
(load-library "xscheme")
(require 'hlinum)
(hlinum-activate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(global-linum-mode t)
 '(haskell-indent-spaces 4)
 '(menu-bar-mode nil)
 '(package-archives (quote (("melpa" . "http://melpa.milkbox.net/packages/") ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(quack-programs (quote ("mitscheme" "racket" "bigloo" "csi" "csi -hygienic" "gosh" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mred -z" "mzscheme" "mzscheme -il r6rs" "mzscheme -il typed-scheme" "mzscheme -M errortrace" "mzscheme3m" "mzschemecgc" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

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

(ido-mode 1)

(global-auto-complete-mode t)

;; my-elfs :: my elisp files
(setq jav-load-path
      (concat (expand-file-name "~/.emacs.d/")
              "my-elfs/"))

(add-to-list 'load-path jav-load-path)

(require 'jav-keys)
(require 'jav-procs)

(defun local-set-minor-mode-key (mode key def)
  "Overrides a minor mode keybinding for the local
   buffer, by creating or altering keymaps stored in buffer-local
   `minor-mode-overriding-map-alist'."
  (let* ((oldmap (cdr (assoc mode minor-mode-map-alist)))
         (newmap (or (cdr (assoc mode minor-mode-overriding-map-alist))
                     (let ((map (make-sparse-keymap)))
                       (set-keymap-parent map oldmap)
                       (push `(,mode . ,map) minor-mode-overriding-map-alist)
                       map))))
    (define-key newmap key def)))

(add-hook 'scheme-mode-hook
	  (lambda ()
	    (local-set-key (kbd "<f7>")
			   'run-mit-scheme-with-related-file)))

(setq-default indent-tabs-mode nil)
(add-hook 'haskell-mode-hook
	  'haskell-indentation-mode)

(setq make-backup-files nil)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-engine 'xetex)))

(setq ac-ignore-case nil)
(setq-default show-trailing-whitespace t)

(put 'proc-entry 'safe-local-variable
     'safe-mit-scheme-entry-filenamep)
