;Newton's method for cube roots is based on the fact that if y is an 
;approximation to the cube root of x, then a better approximation is
;given by the value (x/y^2 + 2*y)/3.
;Use this formula to implement a procedure analogous to the sqrt.

;************Answer*************
(define (cbrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (cbrt-iter (improve guess x) guess x)))
(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))
(define (good-enough? guess old-guess)
  (< (/ (abs (- guess old-guess)) old-guess) 0.001))

(define (cbrt x)
  (cbrt-iter 1.0 0.5 x))