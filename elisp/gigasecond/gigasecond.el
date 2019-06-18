;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:


(defun from(sec min hour day month year)
  "Returns the decoded time 10^9 seconds from the given time"
  (butlast (decode-time
            (+ (time-to-seconds (encode-time sec min hour day month year "UTC"))
               1000000000) "UTC")
           3))


(provide 'gigasecond)
;;; gigasecond.el ends here
