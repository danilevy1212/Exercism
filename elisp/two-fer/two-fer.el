;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional param)
  (let ((name (if (not param)
                  "you"
                param)))
    (concat "One for " name ", one for me."))
  )

(provide 'two-fer)
;;; two-fer.el ends here
