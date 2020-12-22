(asdf:load-system :cl-ppcre)

(defun flatten (structure)
  (cond ((null structure) nil)
        ((atom structure) (list structure))
        (t (mapcan #'flatten structure))))

(defparameter *data*
  (let ((in (open "~/Programming/advent2020/day2/input")))
    (loop for line = (read-line in nil)
       while line
	  collect (cl-ppcre:split "\\s+" line))))

(defparameter *parsed*
  (loop for line in *data*
	collect (list (cl-ppcre:split "-" (car line)) (cl-ppcre:split ":" (car (cdr line))) (car (cdr (cdr line))))))

(defparameter *flattened*
  (loop for x in *parsed*
	collect (flatten x)))

(loop for (low high char password) in *flattened*
      with c = (count (coerce char 'character) password)
      when (and (> low c) (< high c))
      collect password)
