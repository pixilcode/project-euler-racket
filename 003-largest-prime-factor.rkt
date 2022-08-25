#lang racket
(define (divides n)
  (lambda (x) (zero? (modulo n x))))

(define (lowest-divisor n)
  (define mid (sqrt n))
  (define possible-vals (inclusive-range 2 mid))
  (define divisors (filter (divides n) possible-vals))
  (if (not (empty? divisors))
      (first divisors)
      #f))

(define (prime-factors n)
  (define lowest (lowest-divisor n))
  (if (not lowest)
      (list n)
      (cons lowest (prime-factors (/ n lowest)))))

(map prime-factors (range 100))
(apply max (prime-factors 600851475143))