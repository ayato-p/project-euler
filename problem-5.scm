(define (!= a b)
  (not (= a b)))
 
(define (dec x)
  (- x 1))
 
(define (inc x)
  (+ x 1))
 
(define (divided? x n)
  (cond
   ((zero? n) #t)
   ((!= (modulo x n) 0) #f)
   (else
    (divided? x (dec n)))))
 
(define (divided-number x)
  (cond
   ((divided? x 20) (print x))
   (else
    (divided-number (inc x)))))
 
(divided-number 20)

;;-----別解-----

2520 = 8 * 9 * 5 * 7
16 * 9 * 5 * 7 * 11 * 13 * 17 * 19 = 232782560
(* 16 9 5 7 11 13 17 19)
