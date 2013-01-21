(define (square x)
  (* x x))
(define (sum-of-square x)
  (define (sum-of-square-iter t n x)
    (cond
     ((> n x) t)
     (else
      (sum-of-square-iter (+ t (square n)) (inc n) x))))
  (sum-of-square-iter 0 1 x))
 
(sum-of-square 10)
 
(define (square-of-sum x)
  (square (/ (* (+ 1 x) x) 2)))
 
(square-of-sum 10)
 
(define (diff x)
  (- (square-of-sum x) (sum-of-square x)))
(diff 100)