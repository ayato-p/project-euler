(use srfi-1)
(define (prime-factors x)
  (define (set-tup! tup a)
    (if (assv-ref tup a)
	(assv-set! tup a (+ (assv-ref tup a) 1))
	(acons a 1 tup)))
  (if (< x 2)
      `((1 . 1))
      (let loop ((n x)
		 (test 2)
		 (tup `()))
	(cond [(= (/ n test) 1) (set-tup! tup test)]
	      [(zero? (modulo n test))
	       (loop (/ n test) test (set-tup! tup test))]
	      [else
	       (loop n (+ test 1) tup)]))))

(define (divisor-count x)
  (let loop ((l (prime-factors x))
	     (ans 1))
    (cond [(null? l) ans]
	  [else (loop (cdr l) (* ans (+ (cdr (car l)) 1)))])))


(define (test)
  (let loop ((i 1))
    (cond [(<= 500 (divisor-count (fold + 0 (iota i 1)))) (fold + 0 (iota i 1))]
	  [else (loop (+ i 1))])))
(test) 
