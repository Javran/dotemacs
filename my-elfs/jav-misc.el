;;; jav-misc: a collection of small customizations
;;;
;;; this file contains customizations that takes only few lines.
;;; some groups of customizations should be splitted
;;; into new files to make my conf more organized.

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

;; auto-complete extends several lines,
;; which makes the column unstable while
;; I'm typing something.
(setq linum-format "%2d ")

;; markdown settings
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; for some reasons, tab doesn't work as expected
(add-hook 'markdown-mode-hook
          (lambda ()
            (yas-minor-mode -1)))

(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<f6> e") 'yas-expand)

;; highlight current line
(hlinum-activate)

;; record key frequency
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; enable ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)

;; see manual: http://cx4a.org/software/auto-complete/manual.html#Installation
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)


(global-auto-complete-mode t)

(add-to-list 'ac-modes 'markdown-mode)
(add-to-list 'ac-modes 'org-mode)
;; Prevent Extraneous Tabs
;; http://www.gnu.org/software/emacs/manual/html_node/eintr/Indent-Tabs-Mode.html

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
            (auto-complete-mode t)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (progn
              (local-set-key
               (kbd "<f7>") 'eval-buffer)
              (local-set-key
               (kbd "<return>") (key-binding (kbd "C-j"))))))

(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key
             (kbd "<f7>") 'current-markdown-html-preview)))

(add-hook 'makefile-mode-hook
          (lambda ()
            (auto-complete-mode)))

;; org-mode
(require 'org)
;; when marking something as done
;; always keep the time.
(setq org-log-done t)
(add-to-list 'org-agenda-files
             "~/symlinks/my-notes/default.org")

(setq-default c-basic-offset 4)

(provide 'jav-misc)
