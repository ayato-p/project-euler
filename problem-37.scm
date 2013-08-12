(use gauche.sequence)
(use math.prime)
(use srfi-1)
(use srfi-13)


(apply +
       (filter 
	(^n
	 (every bpsw-prime?
		(let ((sn (number->string n)))
		  (append
		   (map-with-index (lambda (i s) (string->number (string-drop-right s i)))
				   (make-list (string-length sn) sn))
		   
		   (map-with-index (lambda (i s) (string->number (string-drop s i)))
				   (make-list (string-length sn) sn))))))
	(take-while (^x (< x (expt 10 6))) (drop *primes* 4))))



