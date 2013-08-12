(length
 (delete-duplicates

  (let1 ls (lrange 2 101)
    (let loop ((l ls))
      (if (null? l)
	  '()
	  (append (map (^x (expt (car l) x))
		       ls)
		  (loop (cdr l))))))))
