;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'seq)

(defun anagrams-for (string candidates)
  "Returns a list of strings of all the anagrams of STRING within CANDIDATES"
  (let* ((sortseq (lambda (st)
                    (seq-sort #'> (downcase st))))
         (target (funcall sortseq string)))
    (seq-filter (lambda (elt)
                  (and (not (string-equal string (downcase elt)))
                       (string-equal target (funcall sortseq elt))))
                candidates)))

(provide 'anagram)
;;; anagram.el ends here
