
(define (inc x)
  (+ x 1))

(define (prime-factor n)
  (prime-factor-iter 2 n))

(define (prime-factor-iter a n)
  (cond
   ((= (/ n a) 1) a)
   ((= (modulo n a) 0) (prime-factor-iter a (/ n a)))
   (else
    (prime-factor-iter (inc a) n))))

(prime-factor 100)
(prime-factor 600851475143)
