(use util.combinations)

(define (pandigital n)
  (map (^l (string->number (list->string l)))
       (permutations (string->list (number->string n)))))





(let loop ((n 1))
  )
