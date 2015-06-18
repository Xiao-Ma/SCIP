;Ex1.7 The good-enough? test used in computing square roots will not be
;very effective for finding the square roots for very small or very large
;numbers due to the limited precision. Explain these statements with examples
;showing how the test fails for small and large numbers.
;An alternative strategy for implementing good-enough? is to watch how guess
;changes from one iteration to the next and to stop when the change is a very
;small fraction of the guess.
;Design a squre-root procedure that uses this kind of end test.
;Does this work better for small and large numbers?

;***********Answer************
;For small numbers:
;>(sqrt 0.0001)
;0.03230844833048122

;For large numbers: my 64-bit machine can handle 10e45 but not 10e46

;Alternative:
;;Just change the good-enough? 
(define (good-enough? guess x)
  (< (/ (abs (- guess (improve guess x))) guess) 0.001))
  
;;Change the sqrt-iter: by passing the old guess at the same time to avoid
;;repeating calculation.
(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))
(define (good-enough? guess old-guess)
  (< (/ (abs (- guess old-guess)) old-guess) 0.001))
;improve remains the same
(define (improve guess x)
  (average guess (/ x guess)))
(define (average a b)
  (/ (+ a b) 2))
;sqrt function
(define (sqrt x)
  sqrt-iter(1.0 0.5 x))

;Now it can handle small numbers and large numbers.