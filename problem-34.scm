(define (fact n)
  (if (zero? n) 1
      (let loop ((m n) (a 1))
	(if (= m 1) a (loop (- m 1) (* m a))))))

(define (string->num-list sls)
  (map (^c (string->number (string c)))
       (string->list (number->string sls))))

(let loop ((x 3) (ans 0))
  (if (> x (expt 10 5))
      ans
      (if (= x
	     (apply + (map fact (string->num-list x))))
	  (loop (+ x 1) (+ x ans))
	  (loop (+ x 1) ans))))


