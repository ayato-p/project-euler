  
(define (euler-problem-1 n)
  (ep1-iter 0 0 n))

(define (>= a b)
  (or (> a b) (= a b)))

(define (inc x)
  (+ x 1))

(define (ep1-iter sum count max)
  (cond
   ((>= count max) sum)
   ((= (modulo count 3) 0)
    (ep1-iter (+ sum count) (inc count) max))
   ((= (modulo count 5) 0)
    (ep1-iter (+ sum count) (inc count) max))
   (else
    (ep1-iter sum (inc count) max))))

(euler-problem-1 1000)

;;----------------------------------------
(apply +
       (filter (^x (or (zero? (mod x 3))
			 (zero? (mod x 5))))
	       (iota 1000)))




