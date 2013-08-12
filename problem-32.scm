(apply +
       (let loop ((product 1000) (ans '()))
	 (if (> product 9999)
	     ans
	     (if (let in-loop ((divisor 2))
		   (cond [(> divisor (exact-integer-sqrt product)) #f]
			 [(and (zero? (mod product divisor))
			       (equal? (sort (apply append (map number->list
								`(,product
								  ,divisor
								  ,(div product divisor)))))
				       (iota 9 1)))]
			 [else (in-loop (+ divisor 1))]))
		 (loop (+ product 1) (cons product ans))
		 (loop (+ product 1) ans)))))
