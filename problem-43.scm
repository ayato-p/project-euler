(use util.combinations)

(define-constant *pandigital0to9*
  (map (^p (apply string-append (map number->string p)))
       (permutations (iota 10))))

(define (sub-string-divisivility? s)
  (let ((d2-4 (string->number (string-copy s 1 4)))
	(d3-5 (string->number (string-copy s 2 5)))
	(d4-6 (string->number (string-copy s 3 6)))
	(d5-7 (string->number (string-copy s 4 7)))
	(d6-8 (string->number (string-copy s 5 8)))
	(d7-9 (string->number (string-copy s 6 9)))
	(d8-10 (string->number (string-copy s 7 10))))
    (and (zero? (mod d2-4 2))
	 (zero? (mod d3-5 3))
	 (zero? (mod d4-6 5))
	 (zero? (mod d5-7 7))
	 (zero? (mod d6-8 11))
	 (zero? (mod d7-9 13))
	 (zero? (mod d8-10 17)))))

(fold (lambda (x y)
	(+ (string->number x) y))
      0
      (filter sub-string-divisivility?
	      *pandigital0to9*))
