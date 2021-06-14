(defparameter *raw-input* (with-open-file (stream "~/code/advent2020/day6/input")
			    (let ((contents (make-string (file-length stream))))
			      (read-sequence contents stream)
			      contents)))

(ql:quickload "cl-ppcre")

(defvar *groups* (cl-ppcre:split (format nil "~%~%") *raw-input*))
(defvar *grouped-votes* (loop for g in *groups*
			      collect (cl-ppcre:split (format nil "~%") g)))
(defvar *votes* (loop for g in *grouped-votes*
		      collect (loop for person in  g collect (loop for x across person collect x))))
(defvar *unique* (loop for g in *votes*
		       collect (reduce #'intersection g)))
(format t "~A"(apply #'+ (loop for u in *unique* collect (length u))))
