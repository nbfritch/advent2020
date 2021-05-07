(defparameter *i*nput* (with-open-file (in "~/code/advent2020/day5/input")
			 (loop for line = (read-line in nil)
			       while line
			      collect line)))

