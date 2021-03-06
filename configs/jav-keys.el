;; global key settings

;; a document describing key binding convension
;; can be found in the following link:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Binding-Conventions.html
;; it seems I'd better define key bindings that begins
;; with C-c.

;; smex requires initialization
;;   otherwise smex-major-mode-commands
;;   might not work
(smex-initialize)

(require 'jav-procs)

;; don't need overwrite-mode at all
(define-key global-map (kbd "<insert>") nil)

;; assign <f2> for org-mode
(global-unset-key (kbd "<f2>"))
(global-set-key (kbd "<f2> c") 'org-capture)
(global-set-key (kbd "<f2> l") 'org-store-link)
(global-set-key (kbd "<f2> a") 'org-agenda)
(global-set-key (kbd "<f2> b") 'org-iswitchb)
;; another set of key bindings without using function keys
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
;; global TODO list in agenda mode?
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; assign <f6> for editing related tasks
;; TODO: this working around is .. not good
;; (global-unset-key (kbd "<f6>"))
;; (global-set-key (kbd "<f6> e") 'yas-expand)

(global-unset-key (kbd "<f9>"))
;; assign <f9> for git related operations
(global-set-key (kbd "<f9> s") 'magit-status)
(global-set-key (kbd "<f9> l") 'magit-log)

(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g l") 'magit-log)

;; let smex find all possible commands
(global-set-key (kbd "M-x") 'smex)
;; only let smex include related commands
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; keep the old M-x just in case
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; new functionalities that I usually use
(global-set-key (kbd "C-5") 'goto-match-paren)

;; buffer-move
;; http://www.emacswiki.org/cgi-bin/wiki/buffer-move.el
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; move to next/prev buffer
(global-set-key (kbd "C-`") 'next-buffer)
(global-set-key (kbd "<C-tab>") 'previous-buffer)

;; I need the focus
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; ag shortcut
(global-set-key (kbd "C-x C-g") 'ag)

(provide 'jav-keys)
