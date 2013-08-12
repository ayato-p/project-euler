
(use util.combinations)

(define (pentagon-number n)
  (/ (* n (- (* 3 n) 1)) 2))

(define-constant *pentagon-numbers*
  (map (^x (cons x (pentagon-number x))) (lrange 1 (expt 10 4))))

(define (pentagon-number? n)
  (rassq n *pentagon-numbers*))

(filter (^p (let* ((pj (cdar p))
		   (pk (cdadr p))
		   (sum (+ pk pj))
		   (sub (- pk pj)))
	      (every pentagon-number? `(,sum ,sub))))
	(combinations* *pentagon-numbers* 2))

