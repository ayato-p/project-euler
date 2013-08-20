(use srfi-1)
(use srfi-13)
(use util.combinations)
(use gauche.generator)
(use math.prime)

(define-constant *thousand-primes*
  (drop-while
   (^x (< x (expt 10 3)))
   (take-while (^x (< x (expt 10 4))) *primes*)))


(list->generator (combinations *thousand-primes* 3))
