(package-initialize)
(load-library "xscheme")

(let ((emacs-home (expand-file-name "~/.emacs.d/")))
  ;; extension-dir :: some plugin that are not provided by *elpa
  ;; jav-conf-dir  :: my customizations
  ;; my-elfs       :: my elisp files
  (let ((extension-dir (concat emacs-home "extensions/"))
        (jav-conf-dir (concat emacs-home "my-elfs/")))
    (add-to-list 'load-path extension-dir)
    (add-to-list 'load-path jav-conf-dir)
;;    (add-to-list 'load-path (concat emacs-home "extensions/structured-haskell-mode/elisp"))
    ))

(require 'jav-emacs)
(require 'jav-keys)
(require 'jav-procs)
(require 'jav-misc)
(require 'jav-scheme)
(require 'jav-haskell)

;; highlight text between parentheses, might conflict with hl-sexp..
;; (setq show-paren-style 'expression)

;; see discussion: http://stackoverflow.com/questions/22470820/font-lock-mode-in-haskell-mode-seems-to-ruin-the-width-of-single-spaces-in-emacs (theme manoj-dark breaks layout)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list (quote (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber") ("View" "evince %s.pdf" TeX-run-command t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-archives (quote (("melpa" . "http://melpa-stable.milkbox.net/packages/") ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(quack-programs (quote ("mzscheme" "racket" "guile" "mit-scheme" "scheme")))
 '(tooltip-hide-delay 100000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Luculent"))))
 '(font-lock-function-name-face ((t (:foreground "mediumspringgreen" :weight bold :height 1.0)))))
