(add-load-path "." :relative)
(use text.csv)
;;14*26
(define *words-text* "./problem-42/words.txt")

(define (triangle-number n) (* 1/2 n (+ n 1)))

(define-constant *triangle-numbers*
  (map triangle-number
       (lrange 1 1000)))

(define (triangle-number? n)
  (member n *triangle-numbers*))

(define-constant *words*
  (call-with-input-file *words-text*
    (^p ((make-csv-reader #\,) p))))

(define (word-score word)
  (fold (lambda (x y) (+ (- (char->integer x) 64) y))
	0
	(string->list word)))
 
(length
 (filter triangle-number?
	 (map word-score *words*)))

