(ql:quickload "cl-ppcre")

(defparameter *required* '("byr" "iyr" "eyr" "hgt" "hcl" "ecl" "pid"))

(defparameter *separator* (format nil "~%~%"))

(defvar *input* (with-open-file (stream "~/code/advent2020/day4/input")
		  (let ((contents (make-string (file-length stream))))
		    (read-sequence contents stream)
		    contents)))

(defvar *split-input* (cl-ppcre:split *separator* *input*))

(defun has-all-required (line)
  (loop for r in *required*
	always (search r line)))

(defvar *results* (loop for l in *split-input*
			when (has-all-required l)
			collect t))

(format t "~A~%" (length *results*))

