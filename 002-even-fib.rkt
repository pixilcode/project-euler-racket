#lang racket

(define (make-fibs max)
  (define (fib-rec fib-list)
    (let ([next (+ (first fib-list) (second fib-list))])
      (if (> next max)
          fib-list
          (fib-rec (cons next fib-list)))))
  (fib-rec '(2 1)))
 
(apply + (filter even? (make-fibs 4000000)))
