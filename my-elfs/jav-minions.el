;; minions: a collection of customizations
;;  that only takes few lines.


;; seems to be an issue:
;;   https://github.com/dacap/keyfreq/issues/9
(require 'cl)
(require 'hlinum)
(require 'keyfreq)

;; highlight current line
(hlinum-activate)

;; required by ghc mode
;;   using flymake
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; always show the balancing parenthesis
(show-paren-mode 1)

;; record key frequency
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; enable ido-mode
(ido-mode 1)


(global-auto-complete-mode t)

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

(provide 'jav-minions)
