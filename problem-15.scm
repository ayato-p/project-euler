(let* ((f (lambda (x) (fold * 1 (iota x 1))))
       (f40 (f 40))
       (f20 (f 20)))
  (/ f40 (* f20 f20)))
