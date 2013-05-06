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
  (define (prime-iter p x counter)
    (cond
     ((> counter n) ())
     ((prime? x) (cons x (prime-iter x (inc x) (inc counter))))
     (else
      (prime-iter p (inc x) (inc counter)))))
  (prime-iter 0 2 2))
 
(define (add-ls sum ls)
  (cond
   ((null? ls) sum)
   (else
    (add-ls (+ sum (car ls)) (cdr ls)))))
 
(add-ls 0 (prime-number 2000000))
