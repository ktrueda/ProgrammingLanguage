;; Programming Languages, Homework 5

#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

;; definition of structures for MUPL programs - Do NOT change
(struct var  (string) #:transparent)  ;; a variable, e.g., (var "foo")
(struct int  (num)    #:transparent)  ;; a constant number, e.g., (int 17)
(struct add  (e1 e2)  #:transparent)  ;; add two expressions
(struct ifgreater (e1 e2 e3 e4)    #:transparent) ;; if e1 > e2 then e3 else e4
(struct fun  (nameopt formal body) #:transparent) ;; a recursive(?) 1-argument function
(struct call (funexp actual)       #:transparent) ;; function call
(struct mlet (var e body) #:transparent) ;; a local binding (let var = e in body) 
(struct apair (e1 e2)     #:transparent) ;; make a new pair
(struct fst  (e)    #:transparent) ;; get first part of a pair
(struct snd  (e)    #:transparent) ;; get second part of a pair
(struct aunit ()    #:transparent) ;; unit value -- good for ending a list
(struct isaunit (e) #:transparent) ;; evaluate to 1 if e is unit else 0

;; a closure is not in "source" programs but /is/ a MUPL value; it is what functions evaluate to
(struct closure (env fun) #:transparent) 

;; Problem 1

;; CHANGE (put your solutions here)
(define (racketlist->mupllist racketlist)
  (letrec ([f (lambda (x)
               (cond [(null? x) (aunit)]
                     [#t (apair (car x) (f (cdr x)))]))])
    (f racketlist)))


(define (mupllist->racketlist mupllist)
  (letrec ([f (lambda (x)
              (cond [(aunit? x) null]
                    [(aunit? (apair-e2 x)) (list (apair-e1 x))]
                    [#t (cons (apair-e1 x) (f (apair-e2 x)))]))])
    (f mupllist)))


;; Problem 2

;; lookup a variable in an environment
;; Do NOT change this function
(define (envlookup env str)
  (begin
    (println env)
    (cond [(null? env) (error "unbound variable during evaluation" str)]
        [(equal? (car (car env)) str) (cdr (car env))]
        [#t (envlookup (cdr env) str)])))

;; Do NOT change the two cases given to you.  
;; DO add more cases for other kinds of MUPL expressions.
;; We will test eval-under-env by calling it directly even though
;; "in real life" it would be a helper function of eval-exp.
(define (eval-under-env e env)
  (cond [(var? e) (envlookup env (var-string e))]
        [(add? e) 
         (let ([v1 (eval-under-env (add-e1 e) env)]
               [v2 (eval-under-env (add-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (int (+ (int-num v1) 
                       (int-num v2)))
               (begin
                 (println v1)
                 (println v2)
                 (error "MUPL addition applied to non-number "))))]
        ;; CHANGE add more cases here
        [(int? e) e]
        [(ifgreater? e) (if (> (int-num (eval-under-env (ifgreater-e1 e) env))
                               (int-num (eval-under-env (ifgreater-e2 e) env)))
                            (eval-under-env (ifgreater-e3 e) env)
                            (eval-under-env (ifgreater-e4 e) env))]
        [(mlet? e) (let ([mlet--var (mlet-var e)]
                         [mlet--e (eval-under-env (mlet-e e) env)]
                         [mlet--body (mlet-body e)])
                     (eval-under-env mlet--body (cons (cons mlet--var mlet--e) env)))]
        [(call? e) (let* ([call--funexp (eval-under-env (call-funexp e) env)]
                         [call--actual (eval-under-env (call-actual e) env)]
                         [fun--body (fun-body (eval-under-env (closure-fun call--funexp) env))])
                     (eval-under-env fun--body
                                   (cons (cons (fun-formal (closure-fun call--funexp)) call--actual) (closure-env call--funexp))))]
        [(snd? e) (apair-e2 (eval-under-env (snd-e e) env))]
        [(isaunit? e) (if (aunit? (eval-under-env (isaunit-e e) env)) (int 1) (int 0))]
        [(closure? e) (closure (append (closure-env e) env) (eval-under-env (closure-fun e) env))]
        [(aunit? e) e]
        [(fun? e) e]
        [(mlet? e) e]
        [(apair? e) (apair (eval-under-env (apair-e1 e) env) (eval-under-env (apair-e2 e) env))]
        [(fst? e) (apair-e1 (eval-under-env (fst-e e) env))]
        [#t (error (format "bad MUPL expression: ~v" e))]))

;; Do NOT change
(define (eval-exp e)
  (eval-under-env e null))
        
;; Problem 3

(define (ifaunit e1 e2 e3)
  (ifgreater (isaunit e1) (int 0) e2 e3))

(define (mlet* lstlst e2) (ifgreater (isaunit lstlst) (int 0)
                                     e2
                                     (mlet* (snd lstlst) e2)))

(define (ifeq e1 e2 e3 e4)
  (cond [(and (int? e1) (int? e2) (= (int-num e1) (int-num e2)) e3)]
        [#t e4]))

;; Problem 4

;(define mupl-map (closure '() (fun #f "fn" (closure '()
;                                                    (fun #f "lst"
;                                                         (let [f (lambda (lst) (call (closure '() (var "fn"))) 
                                                         ;(apair 
                                                         ; (call (closure '() (var "fn")) (fst (var "lst")))
                                                         ;(aunit))

;                                           )))))

;(define mupl-mapAddN 
;  (mlet "map" mupl-map
;        "CHANGE (notice map is now in MUPL scope)"))

;; Challenge Problem

(struct fun-challenge (nameopt formal body freevars) #:transparent) ;; a recursive(?) 1-argument function

;; We will test this function directly, so it must do
;; as described in the assignment
(define (compute-free-vars e) "CHANGE")

;; Do NOT share code with eval-under-env because that will make
;; auto-grading and peer assessment more difficult, so
;; copy most of your interpreter here and make minor changes
(define (eval-under-env-c e env) "CHANGE")

;; Do NOT change this
(define (eval-exp-c e)
  (eval-under-env-c (compute-free-vars e) null))
