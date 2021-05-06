(defvar *input* (with-open-file (in "~/code/advent2020/day3/input")
		  (loop for line = (read-line in nil)
			while line
			collect line)))

(defun is-wall (line pos)
  (if line
      (eq #\# (char line (mod pos (length line))))
      nil))

(defun for-slope (board dx dy)
  (length (loop for cy from 0 by dy to (length board)
		for cx from 0 by dx
	when (is-wall (nth cy board) cx)
	collect cy)))

(defvar *calculations* (list (for-slope *input* 1 1)
			 (for-slope *input* 3 1)
			 (for-slope *input* 5 1)
			 (for-slope *input* 7 1)
			 (for-slope *input* 1 2)))

(loop for c in *calculations*
      do (format t "~A~%" c))

(format t "Product: ~A~%" (apply '* *calculations*))
