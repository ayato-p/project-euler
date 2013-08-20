(use util.combinations)
(use math.prime)
(use srfi-1)

(define a-list (filter odd? (lrange -999 1000)))

(define b-list
  (let1 c (take-while (^x (< x 1000)) *primes*)
    (append (map - c) c)))

(define ab-pair
  (filter (^p (let ((a (car p)) (b (cadr p)))
		(bpsw-prime? (+ a b 1))))
	  (cartesian-product `(,a-list ,b-list))))

(sort 
 (map (^p (let ((a (car p)) (b (cadr p)))
	    (cons p
		  (length (take-while bpsw-prime?
				      (map (^n (+ (expt n 2) (* a n) b))
					   (iota 100)))))))
      ab-pair)
 (^(x y) (> (cdr x) (cdr y))))




