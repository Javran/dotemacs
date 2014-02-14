;; some customized procedures

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

(defun safe-mit-scheme-entry-filenamep (entry-file)
  "test if the given filename is safe to be used
   as a mit-scheme entry file"
  (and (stringp entry-file)
       (string-match "^[^[:space:]]*$" entry-file)))

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
      (shell-command
       (format "mit-scheme --load %s"
               (shell-quote-argument file-to-run)))
      (revert-buffer t t t))))

(provide 'jav-procs)
