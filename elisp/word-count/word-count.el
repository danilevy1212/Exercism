;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:

(require 's)
(require 'cl-lib)

(defun word-count (string)
  "Returns pair list containing the WORDS and NUMBER of instances in a given STRING"
  (let ((word-list (s-split-words (replace-regexp-in-string "[^A-Za-z0-9 ]" "" (downcase string))))
        (word-pair))
    (dolist (word word-list)
      (if (alist-get word word-pair nil nil #'string=)
          (setq word-pair
                (cl-substitute `(,word . ,(+ 1 (cdr (assoc word word-pair))))
                               (assoc word word-pair)
                               word-pair))
        (setq word-pair (append word-pair `((,word . 1))))))
    word-pair))

(provide 'word-count)
;;; word-count.el ends here
