(define (fact n)
  (letrec ((fact-iter
	    (lambda (n a)
	      (if (= n 1)
		  a
		  (fact-iter (- n 1) (* a n))))))
    (fact-iter n 1)))

(fact 100)
