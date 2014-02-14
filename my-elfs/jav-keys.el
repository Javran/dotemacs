;; global key settings

(global-set-key (kbd "<f2> l") 'org-store-link)
(global-set-key (kbd "<f2> a") 'org-agenda)
(global-set-key (kbd "<f2> b") 'org-iswitchb)
(global-set-key (kbd "<f9> s") 'magit-status)
(global-set-key (kbd "<f9> l") 'magit-log)
(global-set-key (kbd "C-,") 'newline-before-current-line)
(global-set-key (kbd "C-5") 'goto-match-paren)

(provide 'jav-keys)
