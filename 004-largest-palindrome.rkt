#lang racket

(define (palindrome? n)
  (define n-str (number->string n))
  (define n-list (string->list n-str))
  (equal? n-list (reverse n-list)))

(define mults (for*/list ([i (range 100 1000)]
                          [j (range 100 1000)]
                          #:when (palindrome? (* i j)))
                (* i j)))

(apply max mults)