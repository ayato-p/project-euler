
(use util.combinations)

(define (list->number ls)
  (string->number
   (fold (lambda (x y) (string-append y (number->string x)))
	 ""
	 ls)))

(ref (map list->number
	  (permutations (iota 10)))
     999999)
