(defparameter *source-data*
  (with-open-file (in "~/Programming/advent2020/day1/input")
    (loop for line = (read-line in nil)
	  while line
	  collect (parse-integer line))))

(defparameter *sorted* (sort *source-data* #'>))

(defparameter *something*
  (loop for first in *sorted*
	collect (list first (loop for second in *sorted*
				  when (> 2020 (+ first second))
				    collect (list second (find (- 2020 (+ first second)) *sorted*))))))

(loop for (first first-possible) in *something*
      when (loop for (second third) in first-possible
		 when (and second third)
		 collect (list second third))
      collect (list first))






(defparameter *less-than-2020* (apply #'append  (find-2 *sorted*)))

(defparameter *subtractions*
  (loop for (first second) in *less-than-2020*
	collect (list (- 2020 (+ first second)) (list first second))))

(loop for (x first-pair) in *subtractions*
      when (find x *less-than-2020*)
      collect (list (car first-pair) (car (cdr first-pair)) x))

(loop for (first second) in *less-than-2020*
      for third in *sorted*
      when (and (/= first third ) (/= second third) (= 2020 (+ first second third)))
      collect (list first second third))

(format t "~a~%" (find-2 *sorted*))

(defparameter *comparison*
  (loop for num in *source-data*
	collect (subtract-from-2020 num)))

(defparameter *stage-2*
  (loop for num))

(defparameter *match*
  (loop for original in *source-data*
	for subtract in *comparison*
	for last = (- subtract original)
	when (>= last 0)
	  collect (list original subtract last (+ original subtract last))))

(format t "Found matching pair: ~a~%" (car *match*))
(format t "Product of elements: ~a~%" (apply #'* (car *match*)))
