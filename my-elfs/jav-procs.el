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

(provide 'jav-procs)
