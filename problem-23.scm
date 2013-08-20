(use math.prime)
(use gauche.sequence)
(use util.combinations)

(define (sum-of-divisor x)
  (apply *
	 (map (^l
	       (apply +
		      (map-with-index (lambda (x y) (expt y x))
				      l)))
	      (map (^l (make-list (+ (length l) 1) (car l)))
		   (group-sequence (mc-factorize x))))))

(define (non-abundant? n)
  (> (- (sum-of-divisor n) n) n))

;;---
(define nal (filter non-abundant? (iota 28123 1)))

(define data (make-list 28124 0))

(for-each
 (^i
  (for-each
   (^j
    (let1 sum (+ i j)
      (if (> sum 28123)
	  #f
	  (set! (ref data sum) sum))))
   nal))
 nal)

(let loop ((n 0) (ans 0))
  (if (> n 28123)
      ans
      (loop (+ n 1)(if (zero? (ref data n))
		       (+ n ans)
		       ans))))
