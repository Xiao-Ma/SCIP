;A function f is defined by the rule that f(n) = n if n < 3 and f(n) = f(n-1) +
;2f(n-2) + 3f(n-3) if n>=3. Write a procedure that computes f by means of a 
;recursive process. Write a procedure that computes f by means of an iterative
;process.

;*****************Solution***************
;Recursive:
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) 
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

;Iterative:
(define (f n)
  (if (< n 3)
      n 
      (f-iter 0 1 2 (- n 2))))
(define (f-iter a b c counter)
  (if (= counter 0)
      c
      (f-iter b c (+ (* 3 a) (* 2 b) c) (- counter 1))))