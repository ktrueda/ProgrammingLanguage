#lang racket

(define a 3)

(define b (+ a 2))

(define cube1
  (lambda (x) (* x (* x x))))

(define cube2
  (lambda (x) (* x x x)))

(define pow
  (lambda (x y)
    (if (= y 0)
        1
        (* x (pow x (- y  1))))))

(define (cube3 x) (* x x x))

(define pow2
  (lambda (x)
    (lambda (y)
       (if (= y 0)
           1
           (* x ((pow2 x) (- y 1)))))))

(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs) (sum (cdr xs)))))
