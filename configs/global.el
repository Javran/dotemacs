;;; Settings that should be applied globally.

;; always show the balancing parenthesis
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)

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

;; move to next/prev buffer
(global-set-key (kbd "C-`") 'next-buffer)
(global-set-key (kbd "<C-tab>") 'previous-buffer)
