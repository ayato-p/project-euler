
(fold (lambda (a b)
	(print b)
	(+ (- (char->integer a) 48) b))
      0
      (string->list (number->string (expt 2 1000))))


