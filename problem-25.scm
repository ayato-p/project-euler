(define (make-table)
  (list '*table*))

(define (lookup key table)
  (let
      ((record (assoc key (cdr table))))
    (if record
	(cdr record)
	#f)))

(define (insert! key value table)
  (let
      ((record (assoc key (cdr table))))
    (if record
	(set-cdr! record value)
	(set-cdr! table (cons (cons key value) (cdr table))))))

(define (memorize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((priviously-coumuted-result (lookup x table)))
	(or priviously-coumuted-result
	    (let ((result (f x)))
	      (insert! x result table)
	      result))))))

(define memo-fib
  (memorize (lambda (n)
	      (cond [(<= n 1) n]
		    [else
		     (+ (memo-fib (- n 1))
	 		(memo-fib (- n 2)))]))))

;;---

(let loop ((n 1))
  (if (> (memo-fib n) (expt 10 (- 1000 1)))
      n
      (loop (+ n 1))))
  
