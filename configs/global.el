;;; Settings that should be applied globally.

;; always show the balancing parenthesis
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)

;; external browser
(setq
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "/usr/bin/xdg-open")

;; Some piece of junk that should be nuked from the universe.
;; https://www.reddit.com/r/emacs/comments/2mu7yi/disable_electric_indent_mode/cm7nhdt/
(electric-indent-mode -1)
(add-hook
 'after-change-major-mode-hook
 (lambda()
   (electric-indent-mode -1)))

;; https://github.com/senny/cabbage/issues/175
(global-auto-revert-mode 1)

;;; global key bindings

;; magit
(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g l") 'magit-log)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ag the silver searcher
(global-set-key (kbd "C-x C-g") 'ag)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; move to prev/next buffer: C-x <left> / C-x <right>

;; enable ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; http://stackoverflow.com/questions/7479565/emacs-ido-mode-and-creating-new-files-in-directories-it-keeps-changing-the-dire
(setq ido-auto-merge-work-directories-length -1)

(setq split-width-threshold 0)
(setq split-height-threshold 9999)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
