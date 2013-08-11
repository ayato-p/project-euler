(use math.prime)
(use gauche.sequence)

(define (sum-of-divisor x)
  (apply *
	 (map (^l
	       (apply +
		      (map-with-index (lambda (x y) (expt y x))
				      l)))
	      (map (^l (make-list (+ (length l) 1) (car l)))
		   (group-sequence (mc-factorize x))))))

(define (non-abundant? n)
  (> (- (sum-of-divisor n) n) n))

;;---
(define nal (filter non-abundant? (iota 28123 1)))

(length
 (filter (^x (<= x 28123))
	 (let loop ((ls nal))
	   (if (null? ls)
	       '()
	       (append (map (^x (+ x (car ls)))
			    nal)
		       (loop (cdr ls)))))))





