;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun leap-year-p (year)
  "Returns t if YEAR is a leap year, else returns nil"
  (and (zerop (mod year 4)) (or (not (zerop (mod year 100)))
                                (zerop (mod year 400)))))

(provide 'leap)
;;; leap.el ends here
