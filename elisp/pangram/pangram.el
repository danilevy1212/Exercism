;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:
(defun is-pangram (STRING)
  "Returns t if given STRING is a pangram, nil otherwise"
  (let* ((sentence (downcase STRING))
         (letters "abcdefghijklmnopqrstuvwxyz")
         (char-in-s '(lambda (x) (seq-contains sentence x))))
    (seq-every-p char-in-s letters)))

(provide 'pangram)
;;; pangram.el ends here
