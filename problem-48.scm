
(fold (lambda (x y)
	(+ (expt x x) y))
      0
      (lrange 1 1000))
