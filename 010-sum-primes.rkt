#lang racket

(define (not-divides n)
  (lambda (x) (not (zero? (modulo n x)))))

(define (prime? n p-list)
  (andmap (not-divides n) p-list))

(define (primes max [curr 3] [p-list '()])
  (printf "~a ~n" curr)
  (cond
    [(>= curr max) (cons 2 p-list)]
    [(prime? curr p-list) (primes max (+ curr 2) (append p-list (list curr)))]
    [else (primes max (+ curr 2) p-list)]))

(define result (primes 2000000))
(apply + result)