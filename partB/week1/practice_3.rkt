#lang racket

(define (my-if-bad x y z) (if x y z))


(define (my-if x y z) (if x (y) (z)))

(define (my-delay f)
  (mcons #f f))

(define (my-force th)
  (if (mcar th)
      (mcdr th)
      (begin (set-mcar! th #t)
             (set-mcdr! th ((mcdr th)))
             (mcdr th))))