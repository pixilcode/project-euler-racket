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

(define prime-factors-20
  (map prime-factors (inclusive-range 2 20)))

(define unique-primes (list->set (flatten prime-factors-20)))

(define primes-count
  (for/list ([prime unique-primes])
    (list
     prime
     (apply max (for/list ([factors prime-factors-20])
                 (count (lambda (x) (= x prime)) factors))))))

(for/fold ([acc 1])
          ([prime primes-count])
  (* acc (expt (first prime) (second prime))))
                 