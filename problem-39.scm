(define (three-solutions p)
  (let loop ((p p) (n 3))
    (cond [(= n 0) 0]
	  [(= n 1) p]
	  [else
	   (let in-loop ((c 1) (ans '()))
	     (cond [(<= p 1) c]
		   [(> c (- p n)) ans]
		   [else (in-loop (+ c 1)
				  (cons
				   `(,c ,@(loop (- p c) (- n 1)))
				   ans))]))])))

(define (right-triangles-solutions n)
  (length (filter (^l
		   (not (null?
			 (let ((c (car l))
			       (a&b-s (cdr l)))
			   (filter (^(a&b)
				     (let ((a (car a&b))
					   (b (cdr a&b)))
				       (= (expt c 2)
					  (+ (expt a 2)
					     (expt b 2)))))
				   a&b-s)))))
		  (three-solutions n))))

(
 (^x (> (cadr x) 5))
	(let loop ((n 2) (ans '()))
	  (if (> n 1000)
	      ans
	      (loop (+ n 1)
		    (cons `(,n ,(right-triangles-solutions n))
			  ans)))))

