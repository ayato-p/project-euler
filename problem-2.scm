(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b max-value)
  (if (< max-value a)
      ()
      (cons a (fib-iter (+ a b) a max-value))))

(define (even-sum li)
  (even-sum-iter 0 li))

(define (even-sum-iter sum li)
  (cond
   ((null? li) sum)
   ((even? (car li)) (even-sum-iter (+ sum (car li)) (cdr li)))
   (else (even-sum-iter sum (cdr li)))))

(even-sum (fib 4000000))

;;-------------------------------------------------------------

(apply +
       (filter even?
	       (fib 4000000)))

