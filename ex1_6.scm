;ex1.6 What happens if a new version of if is defined as:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;What happens if this new-if is used to rewrite the square-root program as:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
;having the rest of the program:
(define (good-enough? guess x)
  (< (abs (- square guess) x)) 0.001)
(define (square x)
  (* x x))
(define (improve guess x)
  (average guess x))
(define (average a b)
  (/ (+ a b) 2))
(define (sqrt x)
  (sqrt-iter 1.0 x))
  
;Scheme compiler uses applicative-order evaluation.
;The new-if is a function here, so sqrt-iter will always be evaluated before
;new-if no matter what the result of good-enough is, thus there will be 
;infinite recursion here.
;However, if is a special form so the condition evaluation will happens first.