;The following pattern of numbers is called Pascal's triangle.
;      1
;     1 1
;    1 2 1
;   1 3 3 1
; 1 4 6 4 1
;......
;The numbers at the edge of the triangle are all 1, and each number inside the
;triangle is the sum of the two numbers above it. Write a procedure that
;computes elements of Pascal's triangle by means of a recursive process.

;*****************Solution*******************
(define (pascal-triangle n m)
  (cond ((< m 0) 0)
        ((> m n) 0)
        ((= m 1) 1)
        (else (+ (pascal-triangle (- n 1) (- m 1))
                 (pascal-triangle (- n 1) m)))))