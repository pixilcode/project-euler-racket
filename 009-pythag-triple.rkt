#lang racket

(define max 1000)

(define possible-a (inclusive-range 3 max 2))

(define (square x) (expt x 2))

(for*/first ([b (inclusive-range 2 max)]
             [a (inclusive-range 1 b)]
             #:do [(define c (sqrt (+ (square a) (square b))))]
             #:when (integer? c)
             #:when (= 1000
                       (+ a b c)))
  (list a b c))