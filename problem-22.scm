(add-load-path "." :relative)
(use text.csv)

(define *names-text* "./problem-22/names.txt")

(apply +
       (let ((num 0))
	 (map (^x (* (inc! num) (name->score x)))
	      (sort
	       (car (call-with-input-file *names-text*
		      (^p (port->list (make-csv-reader #\,) p))))
	       (lambda (x y) (string<? x y))))))

(define (name->score name)
  (apply + (map (^x (- (char->integer x) 64))
		(string->list name))))
