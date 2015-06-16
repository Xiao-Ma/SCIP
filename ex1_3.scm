;Define a procedure that takes three numbers as argument
;and returns the sum of the squres of the two larger numbers.
(define (squre x)
        (* x x))
(define (sum-of-squres a b)
        (+ (squre a) (squre b)))
(define (sum-of-squres-of-larger-numbers a b c)
        (if (not (> a b))
            (if (not (> a c)) (sum-of-squres b c) (sum-of-squres a b))
            (if (not (> b c)) (sum-of-squres a c) (sum-of-squres a b))))