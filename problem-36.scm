(use gauche.sequence)
(use srfi-13)

(apply +
       (filter (^n (let ((sn (number->string n))
			 (snb (number->string n 2)))
		     (and (equal? sn (string-reverse sn))
			  (equal? snb (string-reverse snb)))))
	       (iota (expt 10 6))))
