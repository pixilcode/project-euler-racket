#lang racket

(define (divides n)
  (lambda (x) (zero? (modulo n x))))

(define (prime? n p-list)
  (not (ormap (divides n) p-list)))

(define (primes n [curr 2] [p-list '()])
  (cond
    [(zero? n) (car p-list)]
    [(prime? curr p-list) (primes (sub1 n) (add1 curr) (cons curr p-list))]
    [else (primes n (add1 curr) p-list)]))

(primes 10001)