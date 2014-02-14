;; global key settings

;; smex requires initialization
;;   otherwise smex-major-mode-commands
;;   might not work
(smex-initialize)

(require 'jav-procs)

;; assign <f2> for org-mode
(global-set-key (kbd "<f2> l") 'org-store-link)
(global-set-key (kbd "<f2> a") 'org-agenda)
(global-set-key (kbd "<f2> b") 'org-iswitchb)

;; assign <f9> for git related operations
(global-set-key (kbd "<f9> s") 'magit-status)
(global-set-key (kbd "<f9> l") 'magit-log)

;; only include related commands
(global-set-key (kbd "M-x") 'smex-major-mode-commands)
;; can also call all possible commands when necessary
(global-set-key (kbd "M-X") 'smex)
;; keep the old M-x just in case
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; new functionalities that I usually use
(global-set-key (kbd "C-,") 'newline-before-current-line)
(global-set-key (kbd "C-5") 'goto-match-paren)

(provide 'jav-keys)
