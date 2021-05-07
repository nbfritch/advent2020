(defparameter *raw-input* (with-open-file (stream "~/code/advent2020/day6/input")
			    (let ((contents (make-string (file-length stream))))
			      (read-sequence contents stream)
			      contents)))

(ql:quickload "cl-ppcre")

(defvar *chunks* (cl-ppcre:split (format nil "~%~%") *raw-input*))

(loop for c in *chunks*
      collect (remove #\linefeed c))
