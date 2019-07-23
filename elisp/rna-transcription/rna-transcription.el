;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:

;;; Code:
(defun to-rna (dna)
  "Transforms the DNA string sequence to an RNA sequence"
  (let ((rna '((?C . ?G)
               (?G . ?C)
               (?A . ?U)
               (?T . ?A))))
    (concat (mapcar (lambda (elt)
                         (if (assq elt rna)
                             (alist-get elt rna)
                           (error "Invalid character in sequence")))
                       dna))))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
