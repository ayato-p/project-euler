(use srfi-1)

(fold (lambda (a b)
	(if (> (cdr a) (cdr b)) a b))
      '(0 . 0)
      (map (lambda (x)
	     (cons x (let loop ((n x)
				(count 0))
		       (cond ((= n 1) count)
			     ((even? n) (loop (/ n 2) (+ count 1)))
			     (else (loop (+ (* 3 n) 1) (+ count 1)))))))
	   (iota 1000000 1)))


;;分かりやすく書いたバージョン
(define (collatz x)
  (let loop ((n x)
	     (count 0))
    (cond ((= n 1) count)
	  ((even? n) (loop (/ n 2) (+ count 1)))
	  (else (loop (+ (* 3 n) 1) (+ count 1))))))

(define result (map (lambda (x)
		      (cons x (collatz x)))
		    (iota 1000000 1)))

(fold (lambda (a b)
	(if (> (cdr a) (cdr b)) a b))
      '(0 . 0)
      result)
