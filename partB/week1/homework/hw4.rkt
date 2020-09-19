
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

(define ones (lambda () (cons 1 ones)))

;; put your code below

(define (sequence low high stride)
  (cond [(> low high) null]
        [#t (cons low (sequence (+ low stride) high stride))]))


(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))


(define (list-nth-mod-helper xs n)
  (cond 
        [(= n 0) (car xs)]
        [#t (cond [(= n 0) (car xs)]
                    [#t (list-nth-mod-helper (cdr xs) (- n 1))])]))
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: negative number")]
        [#t (list-nth-mod-helper xs (modulo n (length xs)))]))

(define (stream-for-n-steps s n)
  (letrec ([f (lambda (s n acc)
              (cond [(= n 0) (reverse acc)]
                    [#t (f (cdr (s)) (- n 1) (cons (car (s)) acc))]))])
  (f s n null)))

(define funny-number-stream
         (letrec ([f (lambda (x)
                       (cond [(= 0 (modulo x 5)) (cons (* -1 x) (lambda () (f (+ x 1))))]
                             [#t (cons x (lambda () (f (+ x 1))))]))])
  (lambda () (f 1))))


(define dan-then-dog
         (letrec ([f (lambda (x)
                       (cond [(= 1 (modulo x 2)) (cons "dan.jpg" (lambda () (f (+ x 1))))]
                             [#t (cons "dog.jpg" (lambda () (f (+ x 1))))]))])
  (lambda () (f 1))))


(define (stream-add-zero s)
  (lambda () (cons
              (cons 0 (car (s)))
              (lambda () ( (stream-add-zero (cdr (s))))))))



(define (cycle-lists xs ys)
  (letrec ([f (lambda (x)
                (cons
                 (cons (list-ref xs (modulo x (length xs))) (list-ref ys (modulo x (length ys))))
                 (lambda () (f (+ x 1)))))])
    (lambda () (f 0))))

(define (vector-assoc v vec)
  (letrec ([f (lambda (i)
                (cond
                  [(>= i (vector-length vec)) #t]
                  [(and (pair? (vector-ref vec i)) (= v (car (vector-ref vec i)))) (vector-ref vec i)]
                  [#t (f (+ i 1))]))])
    (f 0)))


(define (cached-assoc xs n)
  (letrec ([memo (make-vector n)]
           [next-index 0]
           [f (lambda (v)
                (cond [(pair? (vector-assoc v memo)) (vector-assoc v memo)]
                      [#t
                       (let ([new-ans (assoc v xs)])
                         (begin
                           (vector-set! memo next-index new-ans)
                           (set! next-index (modulo (+ next-index 1) n))
                           new-ans))]))])
                             
    f))