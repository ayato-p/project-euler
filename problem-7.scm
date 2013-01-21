
(define (>= a b)
  (or (> a b) (= a b)))

(define (inc x)
  (+ x 1))

(define (prime? x)
  (define (prime-iter a)
    (cond
     ((> a (sqrt x)) #t)
     ((= (modulo x a) 0) #f)
     (else
      (prime-iter (+ a 1)))))
  (prime-iter 2))

(define (prime-number n)
  (define (prime-iter p x counter max-count)
    (cond
     ((>= counter max-count) p)
     ((prime? x) (prime-iter x (inc x) (inc counter) max-count))
     (else
      (prime-iter p (inc x) counter max-count))))
  (prime-iter 0 2 0 n))

(prime-number 10001)
	 

