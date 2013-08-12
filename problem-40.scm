
(use gauche.sequence)
(use srfi-13)

(define-constant *champernowne*
  (let1 sn "0"
	  (let loop ((n 1) (s sn))
	    (if (> (string-length s) (expt 10 6))
		s
		(loop (+ n 1)
		      (string-append s (number->string n)))))))

(apply *
       (map (^c (string->number (string c)))
	    (map (^i (ref *champernowne* (expt 10 i)))
		 (iota 6 1))))
