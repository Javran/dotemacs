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
;; (require 'yasnippet)

;; auto-complete extends several lines,
;; which makes the column unstable while
;; I'm typing something.
(setq linum-format "%2d ")

(setq ido-ignore-extensions t)

(add-to-list
 'completion-ignored-extensions
 ".ibc")

;; markdown settings
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override nil)

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(defun my/use-tslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (tslint (and root
                      (expand-file-name "node_modules/tslint/bin/tslint"
                                        root))))
    (when (and tslint (file-executable-p tslint))
      (setq-local flycheck-typescript-tslint-executable tslint))))
(add-hook 'flycheck-mode-hook #'my/use-tslint-from-node-modules)

;; (add-to-list 'auto-mode-alist '("\\.\\(pl\\|pro\\|lgt\\)" . prolog-mode))


;; for some reasons, tab doesn't work as expected
(add-hook 'markdown-mode-hook
          (lambda ()
            ;;(yas-minor-mode -1)
            ))

;;(yas-global-mode 1)

;;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;;(define-key yas-minor-mode-map (kbd "TAB") nil)
;; (define-key yas-minor-mode-map (kbd "<f6> e") 'yas-expand)

;; highlight current line
(hlinum-activate)

;; record key frequency
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; enable ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; http://stackoverflow.com/questions/7479565/emacs-ido-mode-and-creating-new-files-in-directories-it-keeps-changing-the-dire
(setq ido-auto-merge-work-directories-length -1)

;; see manual: http://cx4a.org/software/auto-complete/manual.html#Installation
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;; (ac-config-default)


;; (global-auto-complete-mode t)

;; (add-to-list 'ac-modes 'markdown-mode)
;; (add-to-list 'ac-modes 'org-mode)
;; Prevent Extraneous Tabs
;; http://www.gnu.org/software/emacs/manual/html_node/eintr/Indent-Tabs-Mode.html

;; (setq ac-ignore-case nil)

;; (define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
;; (define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
;; (define-key ac-complete-mode-map (kbd "M-/") 'ac-stop)

;; (add-hook 'TeX-mode-hook
;;           (lambda ()
;;             (auto-complete-mode t)))

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
             (kbd "<f7>") 'current-markdown-pdf-preview)
            (local-set-key
             (kbd "C-c C-c") 'current-markdown-pdf-preview)))


;; (add-hook 'makefile-mode-hook
;;           (lambda ()
;;             (auto-complete-mode)))
(add-hook 'c++-mode-hook
          (lambda ()
            (flycheck-gcc-include-path
             "/usr/include/qt5"
             "/usr/include/qt5/QtCore"
             "/usr/include/qt5/QtWidgets")))


(defun run-current-prolog-file ()
  "run current haskell file without
   user interaction"
  (interactive)
  (shell-command-and-go-to-bottom
   (format "gprolog --consult-file %s"
           (shell-quote-argument (proc-entry-or-current-file)))))

;; (add-hook 'prolog-mode-hook
;;           (lambda ()
;;             (auto-complete-mode)
;;             (local-set-key
;;              (kbd "<f7>")
;;              'run-current-prolog-file)))

;; org-mode
(require 'org)

(add-hook 'org-mode-hook '(load "auctex.el" nil t t))
;; when marking something as done
;; always keep the time.
(setq org-log-done t)

(add-to-list
 'org-agenda-files
 "~/symlinks/org-mode/default.org")

(add-to-list
 'org-agenda-files
 "~/symlinks/org-mode/mobile.org")

(setq org-mobile-inbox-for-pull "~/symlinks/org-mode/mobile.org")
(setq org-mobile-directory "~/symlinks/org-mobile-sync/")
(setq org-directory "~/symlinks/org-mode/")

(setq org-default-notes-file "~/symlinks/org-mode/default.org")

(setq-default c-basic-offset 4)

(defun run-python-file ()
  "run mit-scheme with specified file
   if file local variable `proc-entry` is valid,
   it will be used, the current file will be used
   otherwise. `proc-entry` must be a string
   that does not contain any whitespace"
  (interactive)
  (shell-command-compile-and-go-to-bottom
   (format "python %s"
           (shell-quote-argument (proc-entry-or-current-file)))))

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key
             (kbd "C-c C-c")
             'run-python-file)))

(require 'sr-speedbar)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

(provide 'jav-misc)
