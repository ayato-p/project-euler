(add-load-path "." :relative)
(use gauche.sequence)
(use srfi-13)

(define *triangle-txt* "./problem-67/triangle.txt")

(define *data*
  (map (^s (map string->number (string-tokenize s)))
       (call-with-input-file *triangle-txt*
	 (^p (port->list read-line p)))))

(let loop ((depth (- (length *data*) 2)) (data *data*))
  (if (< depth 0)
      (caar data)
      (loop
       (- depth 1)
       (let ((il (ref data depth))
	     (jl (ref data (+ depth 1))))
	 (append
	  (take data depth)
	  `(,(map-with-index (^(i x)
			       (+ x (max (ref jl i) (ref jl (+ i 1)))))
			     il)))))))
