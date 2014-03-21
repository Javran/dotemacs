;; some customized procedures

(defvar command-output-buffer
  "*Shell Command Output*")

(defun newline-before-current-line ()
  "start a new line before the current line
   and move cursor there"
  (interactive)
  (let ((n (line-number-at-pos)))
    (if (= n 1)
        ;; for the first line:
        ;; move to begin, nl, prev-line
        (progn
          (beginning-of-line)
          (newline)
          (previous-line))
      ;; else, we already have a previous line
      (progn
        (previous-line)
        (end-of-line)
        (newline-and-indent)))))

;; thanks to nounch for this command
(defun shell-command-and-go-to-bottom (cmdline &optional compilation)
  "run shell command, and move to the bottom of the result
if optional argument 'compilation' is not nil, switch to
compilation-mode for output buffer."
  (interactive "M")
  (let ((ret-val
         (shell-command cmdline command-output-buffer)))
    (let ((w (get-buffer-window command-output-buffer)))
      ;; two possibilities:
      ;; * output-buffer gets brought up,
      ;;   we move to the bottom, and print exitcode in the mini-buffer
      ;; * mini-buffer is used, in this case, nop.
      (when w
          (with-selected-window w
            (when compilation
              (compilation-mode))
            (end-of-buffer)
            (message "exitcode: %d (%s)" ret-val (current-time-string)))))))

(defun shell-command-compile-and-go-to-bottom (cmdline)
  "run shell command, and move to the bottom of the result
   the result will be shown in compliation-mode"
  (interactive "M")
  (shell-command-and-go-to-bottom cmdline t))

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t nil)))

(defun string-without-spacesp (str)
  "test if a given value is a string and
does not contain any space"
 (and (stringp str)
       (string-match "^[^[:space:]]*$" str)))

(defun safe-mit-scheme-entry-filenamep (entry-file)
  "test if the given filename is safe to be used
   as a mit-scheme entry file"
  (string-without-spacesp entry-file))

(defun proc-entry-or-current-file ()
  "examine and return variable 'proc-entry',
if its value is empty, return current buffer file name"
  (let ((p-entry (cdr (assoc 'proc-entry file-local-variables-alist))))
    (if (and (stringp p-entry)
             (not (string= p-entry "")))
        p-entry
      (buffer-file-name))))

(defun run-mit-scheme-with-related-file ()
  "run mit-scheme with specified file
   if file local variable `proc-entry` is valid,
   it will be used, the current file will be used
   otherwise. `proc-entry` must be a string
   that does not contain any whitespace"
  (interactive)
  (let ((p-entry (cdr (assoc 'proc-entry file-local-variables-alist))))
    (let ((file-to-run (if (and (stringp p-entry)
                                (not (string= p-entry "")))
                           p-entry
                         (buffer-file-name))))
      (shell-command-compile-and-go-to-bottom
       (format "mit-scheme --load %s"
               (shell-quote-argument (proc-entry-or-current-file))))
      )))

;; TODO: refactor and merge with run-mit-scheme-with-related-file
(defun run-racket-with-related-file ()
  "run racket with specified file
   if file local variable `proc-entry` is valid,
   it will be used, the current file will be used
   otherwise. `proc-entry` must be a string
   that does not contain any whitespace"
  (interactive)
  (let ((p-entry (cdr (assoc 'proc-entry file-local-variables-alist))))
    (let ((file-to-run (if (and (stringp p-entry)
                                (not (string= p-entry "")))
                           p-entry
                         (buffer-file-name))))
      (shell-command-compile-and-go-to-bottom
       (format "racket %s"
               (shell-quote-argument file-to-run)))
      )))

(defun pandoc-markdown-to-html (file-src file-dst)
  "convert markdown files into HTML files."
  (shell-command
   (format "pandoc %s -s --highlight-style=pygments -o %s" file-src file-dst)))

(defun current-markdown-html-preview ()
  "generate HTML file for current editing file
   using pandoc, and the open browser to preview
   the resulting HTML file"
  (interactive)
  ;; create place to store the temp HTML file output
  (mkdir "/tmp/markdown_tmps/" t)
  (let* ((dst-dir "/tmp/markdown_tmps/")
         (file-dst
          (concat dst-dir
                  (file-name-base (buffer-file-name))
                  ".html"))
         (url-dst
          (concat "file://" file-dst)))
    (pandoc-markdown-to-html (buffer-file-name)
                             file-dst)
    (browse-url url-dst)))

(provide 'jav-procs)
