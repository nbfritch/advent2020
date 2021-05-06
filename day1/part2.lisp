(defvar *magic* 2020)

(defparameter *source-data*
  (with-open-file (in "~/code/advent2020/day1/input")
    (loop for line = (read-line in nil)
	  while line
	  collect (parse-integer line))))

(defun flatten (l)
  (cond ((null l) nil)
	((atom l) (list l))
	(t (loop for a in l appending (flatten a)))))

(defvar *solution* (loop for f in *source-data*
			 collect (loop for s in *source-data*
				       collect (loop for th in *source-data*
						     when (= *magic* (+ f s th))
						       collect (list f s th)))))

(format t "~A~%" (remove-duplicates (flatten *solution*)))
