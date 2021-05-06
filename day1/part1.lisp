(defparameter *magic-number* 2020)

(defun magic-compare (value)
  (- *magic-number* value))

(defparameter *source-data*
  (with-open-file (in "~/code/advent2020/day1/input")
    (loop for line = (read-line in nil)
	  while line
	  collect (parse-integer line))))

(defparameter *comparison*
  (loop for num in *source-data*
	collect (magic-compare num)))

(defparameter *match*
  (loop for num in *source-data*
	when (find num *comparison*)
	  collect (list num (magic-compare num))))

(format t "Found matching pair: ~a~%" (car *match*))
(format t "Product of elements: ~a~%" (apply #'* (car *match*)))
