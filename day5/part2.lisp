(defparameter *input* (with-open-file (in "~/code/advent2020/day5/input")
			 (loop for line = (read-line in nil)
			       while line
			       collect line)))
(defparameter *parsed* (loop for i in *input*
			     for lsub = (substitute #\0 #\L i)
			     for rsub = (substitute #\1 #\R lsub)
			     for fsub = (substitute #\0 #\F rsub)
			     for bsub = (substitute #\1 #\B fsub)
			     collect (parse-integer bsub :radix 2)))
