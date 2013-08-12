
(use util.combinations)
(use math.prime)

(define (pandigital n)
  (map (^l
	(string->number
	 (apply string-append
		(map number->string
		     l))))
       (permutations (iota n 1))))

(define (pandigital-prime? n)
  (any bpsw-prime? (pandigital n)))

(let loop ((n 1) (ans 0))
  (if (>= n 10)
      ans
      (loop (+ n 1) (if (pandigital-prime? n)
			n
			ans))))

(take-right 
 (sort (filter bpsw-prime?
	       (pandigital 7)))
 1)
