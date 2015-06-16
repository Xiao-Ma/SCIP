;Observe that our model of evaluation allows for combinations
;whose operators are compound expressions.
;Use this observation to describe the behavior of the following procedure.
(define (a-plus-abs-b a b)
        ((if (> b 0) + -) a b))
;This procedure calculate a plus the absolute value of b:
;when b is negative, calculate a - b
;when b is positive, calculate a + b.
;An operator is passed here in (if (> b 0) + -).