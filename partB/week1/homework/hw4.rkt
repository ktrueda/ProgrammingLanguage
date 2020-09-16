
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (cond [(> low high) null]
        [#t (cons low (sequence (+ low stride) high stride))]))


(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))


(define (list-nth-mod-helper xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: negative number")]
        [(= n 0) (car xs)]
        [#t (cond [(= n 0) (car xs)]
                    [#t (list-nth-mod-helper (cdr xs) (- n 1))])]))
(define (list-nth-mod xs n) (list-nth-mod-helper xs (modulo n (length xs))))

(define (stream-for-n-steps-helper s n acc)
  (cond [(= n 0) acc]
        [#t (stream-for-n-steps-helper (cdr (s)) (- n 1) (cons (car (s)) acc))]))

(define (stream-for-n-steps s n)
  (stream-for-n-steps-helper s n null))
  