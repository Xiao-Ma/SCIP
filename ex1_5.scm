;What will be the observations for the following two procedures
;using applicative-order evaluation and normal-order evaluation.
(define (p) (p))
(define (test x y)
        (if (= x 0) 0 y))
;Evaluate expression:
(test 0 (p))

;applicative-order evaluation:
;(p) will be execute first following (define (p) (p)),
;it will repeat and repeat...

;normal-order evaluation:
;if execute (if (= 0 0) 0 (p)) directly, and return 0.