(define (square x)
  (* x x))
 
(define (func a b c)
  (cond
   ((>= a 1000) -1)
   ((>= b 1000) (func (+ a 1) 1 1))
   ((>= c 1000) (func a (+ b 1) 1))
   ((and (= (+ a b c) 1000)
   (= (+ (square a) (square b)) (square c)))
    (* a b c))
   (else
    (func a b (+ c 1)))))
 
(func 1 1 1)
