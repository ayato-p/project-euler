(use math.prime)
(use gauche.sequence)
(use util.combinations)
(use srfi-13)

(define (circulars n)
  (map string->number
       (let ((sn (number->string n)))
	 (map-with-index
	  (lambda (x s)
	    (string-append 
	     (string-take-right s (- (string-length s) x))
	     (string-take s x)))
	  (make-list (string-length sn) sn)))))

(define (circular-prime? n)
  (every bpsw-prime?
	 (circulars n)))

(length
 (filter circular-prime?
	 (take-while (^n (< n (expt 10 6))) *primes*)))




    
