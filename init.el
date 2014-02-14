(package-initialize)
(load-library "xscheme")
(require 'hlinum)
(hlinum-activate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(global-linum-mode t)
 '(haskell-indent-spaces 4)
 '(menu-bar-mode nil)
 '(package-archives (quote (("melpa" . "http://melpa.milkbox.net/packages/") ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(quack-programs (quote ("mitscheme" "racket" "bigloo" "csi" "csi -hygienic" "gosh" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mred -z" "mzscheme" "mzscheme -il r6rs" "mzscheme -il typed-scheme" "mzscheme -M errortrace" "mzscheme3m" "mzschemecgc" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; required by ghc mode
;;   using flymake
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))


;; global settings
(show-paren-mode 1)

;; seems to be an issue:
;;   https://github.com/dacap/keyfreq/issues/9
(require 'cl)
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(ido-mode 1)

(global-auto-complete-mode t)

(defun newline-before-current-line ()
  "start a new line before the current line
   and move cursor there"
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line))

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(global-set-key (kbd "<f2> l") 'org-store-link)
(global-set-key (kbd "<f2> a") 'org-agenda)
(global-set-key (kbd "<f2> b") 'org-iswitchb)
(global-set-key (kbd "<f9> s") 'magit-status)
(global-set-key (kbd "<f9> l") 'magit-log)
(global-set-key (kbd "C-,") 'newline-before-current-line)
(global-set-key (kbd "C-5") 'goto-match-paren)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defun local-set-minor-mode-key (mode key def)
  "Overrides a minor mode keybinding for the local
   buffer, by creating or altering keymaps stored in buffer-local
   `minor-mode-overriding-map-alist'."
  (let* ((oldmap (cdr (assoc mode minor-mode-map-alist)))
         (newmap (or (cdr (assoc mode minor-mode-overriding-map-alist))
                     (let ((map (make-sparse-keymap)))
                       (set-keymap-parent map oldmap)
                       (push `(,mode . ,map) minor-mode-overriding-map-alist)
                       map))))
    (define-key newmap key def)))

(defun run-on-current-buffer ()
  "run mit-scheme on current buffer"
  (interactive)
  (shell-command
   (format "mit-scheme --load %s"
	   (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(add-hook 'scheme-mode-hook
	  (lambda ()
	    (local-set-key (kbd "<f7>")
			   'run-on-current-buffer)))

(setq-default indent-tabs-mode nil)
(add-hook 'haskell-mode-hook
	  'haskell-indentation-mode)

(setq make-backup-files nil)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-engine 'xetex)))

(setq ac-ignore-case nil)
(setq-default show-trailing-whitespace t)
