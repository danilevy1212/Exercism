;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 's)

(defun response-for (arg)
  "Return Bob's response to a fed string statement"
  (let ((statement (s-trim-right arg)))
    (cond
     ((s-blank-str? statement)
      "Fine. Be that way!")
     ((and (string-match-p "[[:alpha:]]" statement) (s-uppercase? statement))
      (if (s-suffix? "?" statement)
          "Calm down, I know what I'm doing!"
        "Whoa, chill out!"))
     (t
      (if (s-suffix? "?" statement)
          "Sure."
        "Whatever.")))))

(provide 'bob)
;;; bob.el ends here
