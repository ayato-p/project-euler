
(define *pentagon-numbers*
  (map pentagon-number (lrange 1 (expt 10 4))))

(define (pentagon-number n)
  (/ (* n (- (* 3 n) 1)) 2))

(define (pentagon-number? n)
  (memq n *pentagon-numbers*))

(let1 n 2
  (let loop ((k n) (j (- n 1)) (ans -1))
    (let ((pj (pentagon-number j))
	  (pk (pentagon-number k)))
      (cond
       [(> k (expt 10 4)) ans]
       [(>= j k) (loop (+ k 1) 1 ans)]
       [(every pentagon-number? `(,(+ pk pj) ,(- pk pj)))
	(begin (print (- pk pj))
	       (loop k (+ j 1) (min (- pk pj) ans)))]
       [else (loop k (+ j 1) ans)]))))
