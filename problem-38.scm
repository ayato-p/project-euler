(use util.combinations)
(use util.list)
(use gauche.sequence)
(use srfi-13)

(define-constant *pandigital-pultiples*
  (sort 
   (map (^l (apply string-append
		   (map number->string
			l)))
	(permutations (iota 9 1)))
   string>))

(define (string-slices str len)
  (map list->string (slices (string->list str) len)))


(let ((len 0))
  (map (^(str) (map string->number (string-slices str len)))
       (take *pandigital-pultiples* 10)))

(string-slices "hoge" )

(let1 n 192384576
  (let loop ((len 2)))
  (let loop ((i 1))
    ()



