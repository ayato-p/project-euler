
(define (>= a b)
  (or (> a b) (= a b)))

(define (inc x)
  (+ x 1))

(define (palindrome)
  (palindrome-iter 0 100 100 999))

(define (palindrome-iter product variable1 variable2 max-count)
  (define temp-product (* variable1 variable2))
  (cond
   ((>= variable1 max-count) product)
   ((>= variable2 max-count)
    (palindrome-iter product (inc variable1) (inc variable1) max-count))
   ((and (palindrome? temp-product) (> (* variable1 variable2) product))
    (palindrome-iter temp-product variable1 (inc variable2) max-count))
   (else
    (palindrome-iter product variable1 (inc variable2) max-count))))

(use srfi-13)
(define (palindrome? x)
  (let ((str (number->string x)))
    (string=? str (string-reverse str))))

(palindrome)