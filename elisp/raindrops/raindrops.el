;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)



(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((res ()) (is-factor (lambda (x) (= 0 (mod n x)))))
    (when (funcall is-factor 7)
      (add-to-list 'res "Plong"))
    (when (funcall is-factor 5)
      (add-to-list 'res "Plang"))
    (when (funcall is-factor 3)
      (add-to-list 'res "Pling"))
    (if (= 0 (length res))
        (int-to-string n)
      (mapconcat 'identity res ""))))

(provide 'raindrops)
;;; raindrops.el ends here
