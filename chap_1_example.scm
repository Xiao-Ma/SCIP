;Newton's method of successive approximation to compute square roots
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (avg guess (/ x guess)))

(define (avg a b) (/ (+ a b) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square a) (* a a))

;******************************************************************************
;Recursively computing factorial
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
      
;Iteratively computing factorial
(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
                 
;******************************************************************************
;Fibonacci numbers (1) tree recursive
(define (fib n)
  (cond ((= n 0) 0)
        (= n 1) 1
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;Fibonacci numbers (2) iterative
(define (fib n)
  (fib-iter 1 0 n))
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

;******************************************************************************
;Counting change
;How many different ways can we make change of any given amout of money, given
;half-dollars, quarters, dimes, nickels, and pennies?
;(1) recursive
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
              (cc (- amount (first-denomination kinds-of-coins))
                  kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;******************************************************************************
;Exponentiation
;(1) recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

;(2) iterative
(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product))))
      
;(3) a faster way by square the product: time O(log(n))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;******************************************************************************
;Greatest Common Divisors
;Using Euclid's algorithm as a procedure (it's iterative with O(log(n)) time)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;******************************************************************************
;Searching for divisors
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))




