;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

(defun allergen-list (score)
  "Given a certain integer SCORE, returns a list of strings of allergies"
  (let ((allergies   '("cats" "pollen" "chocolate" "tomatoes"
                     "strawberries" "shellfish" "peanuts" "eggs"))
        (small-score (logand 255 score))
        (test   128)
        (res))
    (dolist (elt allergies res)
      (when (>= (- small-score test) 0)
        (setq small-score (- small-score test))
        (setq res (push elt res)))
      (setq test (lsh test -1)))))

(defun allergic-to-p (score allergent)
  "Given a certain interger SCORE and an allergent STRING, returns t if allergent is
   contained in the allergy list of the given score"
    (member allergent (allergen-list score)))

(provide 'allergies)
;;; allergies.el ends here
