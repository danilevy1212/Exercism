;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun to-roman (number)
  "Returns the roman numeral representation of a given NUMBER as a string"
  (let ((sym2num    '(("M"  . 1000) ("CM" . 900) ("D"  . 500) ("CD" . 400) ("C"  . 100)
                      ("XC" .   90) ("L"  .  50) ("XL" .  40) ("X"  .  10) ("IX" .   9)
                      ("V"  .    5) ("IV" .   4) ("I"  .   1)))
        (dec        number)
        (res))
    (dolist (num sym2num)
      (while (>= (- dec (cdr num)) 0)
        (setq dec (- dec (cdr num)))
        (push (car num) res)))
    (string-join (nreverse res))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
