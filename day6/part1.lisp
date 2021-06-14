(defparameter *raw-input* (with-open-file (stream "~/code/advent2020/day6/input")
			    (let ((contents (make-string (file-length stream))))
			      (read-sequence contents stream)
			      contents)))

(ql:quickload "cl-ppcre")

(defvar *group* (cl-ppcre:split (format nil "~%~%") *raw-input*))

(defvar *votes* (loop for g in *group*
			  collect (sort (loop for x across (remove #\linefeed g) collect x) #'char>)))

(defvar *distinct-votes* (loop for vote in *votes*
			collect (remove-duplicates vote)))

(format t "~A" (apply #'+ (loop for v in *distinct-votes*
      collect (length v))))
