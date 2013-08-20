
(use util.combinations)

(define ab-list
  (filter (^x (and (not (zero? (mod x 10)))
		   (not (zero? (mod x 11)))))
	  (lrange 10 99)))
(define xy-list
  (filter (^x (and (not (zero? (mod x 10)))
		   (not (zero? (mod x 11)))))
	  (lrange 11 100)))

(define div-ab-xy
  (filter (^d (let ((ab (car d)) (xy (cadr d)))
		(< (/ ab xy) 1)))
	  (cartesian-product
	   `(,ab-list ,xy-list))))

(define (digit-canceling-fractions? ab xy)
  (let ((a (div ab 10)) (b (mod ab 10))
	(x (div xy 10)) (y (mod xy 10)))
    (= (/ ab xy)
       (cond [(= a x) (/ b y)]
	     [(= a y) (/ b x)]
	     [(= b x) (/ a y)]
	     [(= b y) (/ a x)]
	     [else 1]))))

(fold (^(p x) (* (/ (car p) (cadr p)) x))
      1
      (filter (^p (digit-canceling-fractions? (car p) (cadr p)))
	div-ab-xy))



