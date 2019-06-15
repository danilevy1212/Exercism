;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional param)
  (concat "One for " (or param "you") ", one for me."))

(provide 'two-fer)
;;; two-fer.el ends here
