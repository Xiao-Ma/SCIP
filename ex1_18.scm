;Using the result of exercise 1.16 and 1.17, devise a procedure that generates
;an iterative process for multiplying two integers in terms of adding, doubling
;and halving and uses a logarithmic number of steps.

;*****************Solution****************
(define (fast-mult a b)
  (fast-mult-iter a b 0))
(define (fast-mult-iter a counter d)
  (cond ((= counter 0) d)
        ((even? counter) (fast-mult-iter (double a) (halve counter) d))
        (else (fast-mult-iter a (- counter 1) (+ a d)))))
(define (double a)
  (+ a a))
(define (halve a)
  (/ a 2))