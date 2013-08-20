(use util.combinations)
(use util.list)
(use gauche.sequence)
(use srfi-13)

(length (combinations (iota 1000 1) 3)

(define ans
  (map-with-index (^(i x) (cons (+ i 1) x))
		  (make-list (expt 10 3) 0)))


;; a < b < c


(apply +
       (map (^x (* x x))
	    `(30 40)))


(let ((a 20) (b 48) (p 120))
  (= (* p p)
     (+ (* 2 a p)
	(-(* 2 a b))
	(* 2 b p))))

