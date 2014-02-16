;; minions: a collection of customizations
;;  that only takes few lines.


;; seems to be an issue:
;;   https://github.com/dacap/keyfreq/issues/9
(require 'cl)
(require 'hlinum)
(require 'keyfreq)
(require 'quack)
(require 'yasnippet)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(yas-global-mode 1)
;; highlight current line
(hlinum-activate)

;; always show the balancing parenthesis
(show-paren-mode 1)

;; record key frequency
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; enable ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)

(global-auto-complete-mode t)

;; Prevent Extraneous Tabs
;; http://www.gnu.org/software/emacs/manual/html_node/eintr/Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)

(setq make-backup-files nil)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-engine 'xetex)))

(setq ac-ignore-case nil)
(setq-default show-trailing-whitespace t)

(provide 'jav-minions)
