#lang racket

(define nat-nums (inclusive-range 1 100))
(define sum-squares (apply + (map (lambda (x) (expt x 2)) nat-nums)))
(define square-sum  (expt (apply + nat-nums) 2))

(- square-sum sum-squares)