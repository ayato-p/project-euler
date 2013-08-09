(add-load-path "." :relative)
(use text.csv)

(define *names-text* "./problem-22/names.txt")


(let1 num 0
      (fold (lambda (x y) (+ (* (inc! num) (name->score x)) y))
	    0
	    (sort (with-input-from-file *names-text*
		    (make-csv-reader #\,))
		  string<?)))

(define (name->score name)
  (fold (lambda (x y) (+ (- (char->integer x) 64) y))
	0
	(string->list name)))
