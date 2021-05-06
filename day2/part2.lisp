(ql:quickload "cl-ppcre")

(defvar *input* (with-open-file (in "~/code/advent2020/day2/input")
		  (loop for line = (read-line in nil)
			while line
			collect (substitute #\Space #\- (remove #\: line)))))

(defvar *parsed* (loop for l in *input*
		       collect (cl-ppcre:split "\\ " l)))

(defun xor (a b)
  (and (or a b) (not (and a b))))

(defvar *results* (loop for line in *parsed*
			for start = (parse-integer (nth 0 line))
			for end = (parse-integer (nth 1 line))
			for test = (char (nth 2 line) 0)
			for input = (nth 3 line)
			when (xor (eq (char input (- start 1)) test) (eq (char input (- end 1)) test))
			collect start))

(format t "~A~%" (length *results*))
      
