
(use gauche.sequence)

(define (digit-fifth-powers x)
  (apply +
	 (map (^c (expt (string->number (string c)) 5))
	      (number->string x))))

(apply +
       (let loop ((c 1) (ans '()))
	 (let1 n (digit-fifth-powers c)
	   (cond [(>= c (expt 10 6)) ans]
		 [(= c n) (loop (+ c 1) (cons n ans))]
	  [else (loop (+ c 1) ans)])))) ;; -1


      
