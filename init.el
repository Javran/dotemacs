(require 'package)

(dolist
    (pkg-entry
     '(("melpa"
	. "https://melpa.org/packages/")
       ("melpa-stable"
	. "https://stable.melpa.org/packages/")))
  ;; insert packages at the end of the list
  (add-to-list 'package-archives pkg-entry t))

(package-initialize)

(dolist
    (lpath
     (list
      ;; extensions not provided by *ELPA
      (expand-file-name "extensions" user-emacs-directory)
      ;; my own customization
      (expand-file-name "configs" user-emacs-directory)))
  (add-to-list 'load-path lpath))
