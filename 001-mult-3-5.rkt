#lang racket

(define nat100 (range 1 1000))

(define (valid? n)
  (or
   (zero? (modulo n 3))
   (zero? (modulo n 5))))

(define multiples (filter valid? nat100))

(define summation (apply + multiples))

(display summation)