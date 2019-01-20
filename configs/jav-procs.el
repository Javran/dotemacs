;;; some customized procedures

;; TODO: thie file should only store procedures that are commonly shared
;; those files that are only related to a specific major mode
;; should reside in the corresponding major-mode files.

(defvar command-output-buffer
  "*Shell Command Output*")

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
          (goto-char (point-max))
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
  (shell-command-compile-and-go-to-bottom
   (format "mit-scheme --load %s"
           (shell-quote-argument (proc-entry-or-current-file)))))

(defun run-racket-with-related-file ()
  "run racket with specified file
   if file local variable `proc-entry` is valid,
   it will be used, the current file will be used
   otherwise. `proc-entry` must be a string
   that does not contain any whitespace"
  (interactive)
  (shell-command-compile-and-go-to-bottom
   (format "racket %s"
           (shell-quote-argument (proc-entry-or-current-file)))))


(defun pandoc-markdown-to-pdf (file-src file-dst)
  "convert markdown files into pdf files."
  (shell-command
   (format "pandoc %s -s --pdf-engine=xelatex --highlight-style=pygments -V fontsize=12pt -t latex+tex_math_dollars  -o %s" file-src file-dst)))

(defun current-markdown-pdf-preview ()
  "generate pdf file for current editing file
   using pandoc, and the open browser to preview
   the resulting pdf file"
  (interactive)
  ;; create place to store the temp PDF file output
  (mkdir "/tmp/markdown_tmps/" t)
  (let* ((dst-dir "/tmp/markdown_tmps/")
         (file-dst
          (concat dst-dir
                  (file-name-base (buffer-file-name))
                  ".pdf")))
    (pandoc-markdown-to-pdf (buffer-file-name)
                             file-dst)

    (call-process-shell-command (concat "xdg-open "
                                        file-dst
                                        " &")
                                nil 0)))

;; http://stackoverflow.com/questions/20023363/emacs-remove-region-read-only
(defun set-region-writeable (begin end)
  "See http://stackoverflow.com/questions/7410125"
  (interactive "r")
  (let ((modified (buffer-modified-p))
        (inhibit-read-only t))
    (remove-text-properties begin end '(read-only t))
    (set-buffer-modified-p modified)))

;; from: http://stackoverflow.com/questions/3417438/closing-all-other-buffers-in-emacs
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

;; http://stackoverflow.com/questions/19407278/emacs-overwrite-with-carriage-return

(defun shell-like-filter (proc string)
  "Fill the buffer in the same way as it would be shown in bash"
  (let* ((buffer (process-buffer proc))
         (window (get-buffer-window buffer)))
    (with-current-buffer buffer
      ;; make sure we have a mark
      (if (not (mark)) (push-mark))
      ;; use the mark to represent the cursor location
      (exchange-point-and-mark)
      (dolist (char (string-to-list string))
        (cond
         ;; carriage return
         ((char-equal char ?\r)
          (move-beginning-of-line 1))
         ;; newline
         ((char-equal char ?\n)
          (move-end-of-line 1)(newline))
         (t
          ;; Overwrite character
          (if (/= (point) (point-max))
              (delete-char 1))
          (insert char))))
      (exchange-point-and-mark))
    (if window
        (with-selected-window window
          (goto-char (point-max))))))

 ;; (progn
 ;;  (setq proc
 ;;        (start-process "ghcghc" command-output-buffer
 ;;                       "/usr/bin/runghc" "/tmp/tmp/Carry.hs"))
 ;;  (set-process-filter proc 'shell-like-filter))

(provide 'jav-procs)
