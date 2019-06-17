;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(defun sum-of-squares (N)
  "Returns the sum of squares on a given number"
  (seq-reduce #'+ (loop for i from 1 to N
                      collect (expt i 2))
              0))

(defun square-of-sum (N)
  "Returns the square-of-sum on a given number"
  (expt (seq-reduce #'+ (loop for i from 1 to N
                              collect i)
                    0)
        2))

(defun difference (N)
  "Returns the difference of the square of sums with the sum of squares"
  (- (square-of-sum N) (sum-of-squares N)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
