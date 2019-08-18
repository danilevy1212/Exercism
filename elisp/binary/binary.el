;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-decimal (n)
  "Given a STRING n representing a number in base 2, returns an integer representing
  the value of n in base10"
  (let ((shift-amount (- (length n) 1))
        (res          0))
    (dolist (elt (append n nil) res)
      (when (not (string-match-p (regexp-quote (string elt)) "01"))
        (return 0))
      (setq res (+ res (* (string-to-number (string elt)) (lsh 1 shift-amount))))
      (setq shift-amount (- shift-amount 1)))))

(provide 'binary)
;;; binary.el ends here
