(define (twin f)
  (lambda (x)
    (f (f x))))

(define (sum-of-divisor n)
  (apply +
	 (filter (^x (zero? (mod n x)))
		 (lrange 1 (- n 1)))))

(define (twin-sod n)
  ((twin sum-of-divisor) n))

(define (amicable-number? n)
  (and (= (twin-sod n) n)
       (not (= (sum-of-divisor n) n))))

(apply +
       (filter amicable-number?
	       (lrange 1 10000)))
