(defun subtract-from-2020 (value)
  (- 2020 value))

(defparameter *source-data*
  (with-open-file (in "~/Programming/advent2020/day1/input")
    (loop for line = (read-line in nil)
	  while line
	  collect (parse-integer line))))

(defparameter *comparison*
  (loop for num in *source-data*
	collect (subtract-from-2020 num)))

(defparameter *match*
  (loop for num in *source-data*
	when (find num *comparison*)
	  collect (list num (subtract-from-2020 num))))

(format t "Found matching pair: ~a~%" (car *match*))
(format t "Product of elements: ~a~%" (apply #'* (car *match*)))
