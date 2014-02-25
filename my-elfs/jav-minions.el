;; minions: a collection of customizations
;;  that only takes few lines.

;; seems to be an issue:
;;   https://github.com/dacap/keyfreq/issues/9
(require 'cl)
(require 'hlinum)
(require 'keyfreq)
(require 'quack)
(require 'yasnippet)

;; seems ibus is not working for my pc,
;; but I just leave these lines here...
;; (require 'ibus)
;; (add-hook 'after-init-hook 'ibus-mode-on)

;; emacs settings
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(global-linum-mode t)

;; auto-complete extends several lines,
;; which makes the column unstable while
;; I'm typing something.
(setq linum-format "%2d ")

;; highlight text between parentheses, might conflict with hl-sexp..
;; (setq show-paren-style 'expression)

(setq
 TeX-PDF-mode t
 ac-auto-show-menu t
 haskell-indent-spaces 4
 hl-sexp-background-color "RoyalBlue4"
 )

;; external browser
(setq
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "/usr/bin/firefox-bin"
 )

;; markdown settings
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

(add-to-list 'ac-modes 'markdown-mode)
;; Prevent Extraneous Tabs
;; http://www.gnu.org/software/emacs/manual/html_node/eintr/Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)

(setq make-backup-files nil)

(add-hook 'compilation-mode-hook
          (lambda ()
            ;; this mode just colorizes some output,
            ;; no need to visualize any whitespaces.
            (setq show-trailing-whitespace nil)))

(setq ac-ignore-case nil)

(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "M-/") 'ac-stop)

;; I should turn on this only for source codes...
;; (setq-default show-trailing-whitespace t)

(add-hook 'TeX-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)
            (auto-complete-mode t)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (progn
              (setq show-trailing-whitespace t)
              (local-set-key
               (kbd "<f7>") 'eval-buffer)
              (local-set-key
               (kbd "<return>") (key-binding (kbd "C-j"))))))

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)
            (local-set-key
             (kbd "<f7>") 'current-markdown-html-preview)))

(add-hook 'haskell-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)))

(add-hook 'scheme-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)))

(provide 'jav-minions)
