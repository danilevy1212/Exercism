;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun hamming-distance (fstring sstring)
  "Return the difference count between FSTRING and SSTRING."
    (if (= (length fstring) (length sstring))
        (cl-count nil (cl-mapcar #'eq fstring sstring))
      (error "Strings must be the same length")))

(provide 'hamming)
;;; hamming.el ends here
