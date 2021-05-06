(defvar *input* (with-open-file (in "~/code/advent2020/day3/input")
		  (loop for line = (read-line in nil)
			while line
			collect line)))

(defun is-wall (line pos)
  (format t "~A~%" pos)
  (eq #\# (char line (mod pos (length line)))))

(defvar *result* (loop for i in *input*
      for c from 0 by 3
      when (is-wall i c)
	collect i))

(format t "Result is: ~A~%" (length *result*))
