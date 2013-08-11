(define (reciprocal m)
  (let loop ((a '()) (b '()) (n 1))
    (if (find (^x (= (mod n m) x)) b)
	(reverse (cons (div n m) a))
	(loop (cons (div n m) a)
	      (cons (mod n m) b)
	      (* (mod n m) 10)))))

(let loop ((n 1) (a 0))
  (if (> n 1000)
      a
      (loop (+ n 1)
	    (if (> (length (reciprocal n)) a) n a))))

