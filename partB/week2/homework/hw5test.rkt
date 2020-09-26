#lang racket
;; Programming Languages Homework 5 Simple Test
;; Save this file to the same directory as your homework file
;; These are basic tests. Passing these tests does not guarantee that your code will pass the actual homework grader

;; Be sure to put your homework file in the same folder as this test file.
;; Uncomment the line below and, if necessary, change the filename
(require "hw5.rkt")

(require rackunit)

(define tests
  (test-suite
   "Sample tests for Assignment 5"
   
   ;; check racketlist to mupllist with normal list
   (check-equal? (racketlist->mupllist (list (int 3) (int 4))) (apair (int 3) (apair (int 4) (aunit))) "racketlist->mupllist test")
   (check-equal? (racketlist->mupllist null) (aunit) "racketlist->mupllist test")
   
   ;; check mupllist to racketlist with normal list
   (check-equal? (mupllist->racketlist (apair (int 3) (apair (int 4) (aunit)))) (list (int 3) (int 4)) "mupllist->racketlist test")
   (check-equal? (mupllist->racketlist (aunit)) null "mupllist->racketlist test")


   (check-equal? (eval-exp (int 17)) (int 17) "test")
   ;; tests if ifgreater returns (int 2)
   (check-equal? (eval-exp (ifgreater (int 3) (int 4) (int 3) (int 2))) (int 2) "ifgreater test")
   (check-equal? (eval-exp (ifgreater (int 5) (int 4) (int 3) (int 2))) (int 3) "ifgreater test")
   
   ;; mlet test
   (check-equal? (eval-exp (mlet "x" (int 1) (add (int 5) (var "x")))) (int 6) "mlet test")
   (check-equal? (eval-exp (mlet "y" (int 2) (mlet "x" (int 1) (add (var "y") (var "x"))))) (int 3) "mlet test")
   
   ;; call test
   (check-equal? (eval-exp (call (closure '() (fun #f "x" (add (var "x") (int 7)))) (int 1))) (int 8) "call test1")
   (check-equal? (eval-exp (call (closure '() (fun #f "x" (var "x"))) (int 1))) (int 1) "call test2")
   (check-equal? (eval-exp (call (closure '() (fun #f "x" (fun #f "y" (int 2)))) (int 1))) (fun #f "y" (int 2)) "call test3")
   (check-equal? (eval-exp (call (closure '()
                                          (fun #f "x" (closure '() (fun #f "y" (add (var "x") (var "y")))))
                                 )
                                (int 1) ;x
                           ))                        
                 (closure (list (cons "x" (int 1)) (cons #f (closure '() (fun #f "x" (closure '() (fun #f "y" (add (var "x") (var "y")))))))) (fun #f "y" (add (var "x") (var "y")))) "call test4") ; return closure
   (check-equal? (eval-exp (call (call (closure '() (fun #f "x"
                                                   (closure '()
                                                            (fun #f "y" (add (var "x") (var "y")))
                                                   )
                                               ))
                                (int 1) ;x
                           )
                           (int 2); y
                 ))                        
                 (int 3) "call test4")

   ;(check-equal? (eval-exp (call (closure '() (fun "length" "lst"
   ;                                                (ifgreater (isaunit (var "lst")) (int 0)
   ;                                                           (int 0)
   ;                                                           (add (int 1) (call (var "length") (snd (var "lst"))))
   ;                                             )))
   ;                        (apair (int 1) (aunit))))
   ;              (int 1) "call test4")
   ;(check-equal? (eval-exp (call (closure '() (fun "length" "lst"
   ;                                                (ifgreater (isaunit (var "lst")) (int 0)
   ;                                                           (int 0)
   ;                                                           (add (int 1) (call (var "length") (snd (var "lst"))))
   ;                                             )))
   ;                        (apair (int 1) (apair (int 2) (aunit)))))
   ;              (int 2) "call test4")



   
 
   ;;snd test
   ;(check-equal? (eval-exp (snd (apair (int 1) (int 2)))) (int 2) "snd test")
   ;(check-equal? (eval-exp (snd (apair (int 1) (aunit)))) (aunit) "snd test")
   
   ;; isaunit test
   ;(check-equal? (eval-exp (isaunit (aunit))) (int 1) "isaunit test")
   ;(check-equal? (eval-exp (isaunit (closure '() (fun #f "x" (aunit))))) (int 0) "isaunit test")
   ;(check-equal? (eval-exp (isaunit (call (closure '() (fun #f "x" (var "x"))) (int 1)))) (int 0) "isaunit test")
   ;(check-equal? (eval-exp (isaunit (eval-exp (call (closure '() (fun #f "x" (var "x")))(aunit))))) (int 1) "isaunit test")
   
   ;; ifaunit test
   ;(check-equal? (eval-exp (ifaunit (int 1) (int 2) (int 3))) (int 3) "ifaunit test")
   ;(check-equal? (eval-exp (mlet* (list (cons "v" (aunit))) (ifaunit (var "v") (int 2) (int 3)))) (int 2) "ifaunit test")
  
   
   ;; mlet* test
   ;(check-equal? (eval-exp (mlet* (list (cons "x" (int 10))) (var "x"))) (int 10) "mlet* test")
   ;(check-equal? (eval-exp (mlet* (list
   ;                                (cons "x" (int 10))
   ;                                (cons "y" (int 31))
   ;                                ) (add (var "x") (var "y")))) (int 41) "mlet* test")
   ;(check-equal? (eval-exp (mlet* (list
   ;                                (cons "x" (int 10))
   ;                                )
   ;                               (mlet* (list
   ;                                (cons "y" (int 31))
   ;                                ) (add (var "x") (var "y"))))) (int 41) "mlet* test")
   
   ;; ifeq test
   ;(check-equal? (eval-exp (ifeq (int 1) (int 2) (int 3) (int 4))) (int 4) "ifeq test")
   ;(check-equal? (eval-exp (ifeq (int 1) (int 1) (int 3) (int 4))) (int 3) "ifeq test")
   ;(check-equal? (eval-exp (ifeq (int 1) (int 0) (int 3) (int 4))) (int 4) "ifeq test")
   ;(check-equal? (eval-exp (mlet* (list (cons "x" (int 10))) (ifeq (var "x") (int 10) (int 3) (int 4)))) (int 3) "ifeq test")
   ;(check-equal? (eval-exp (mlet* (list (cons "x" (int 10)) (cons "y" (int 10))) (ifeq (var "x") (var "y") (int 3) (int 4)))) (int 3) "ifeq test")
   
   ;; mupl-map test
   ; how to write code to process list in MUPL
   ;(eval-exp (mlet* (list
   ;                  (cons "lst" (apair (int 10) (apair (int 20) (aunit))))
   ;                  (cons "f" (fun #f "x" (add (var "x") (int 1))))
   ;                  (cons "frec" (fun #f "lst" (ifaunit (var "lst")
   ;                                                      (aunit)
   ;                                                      (apair (call (closure '() (var "f")) (fst (var "lst"))) (call (closure '() (var "frec")) (snd (var "lst"))))))))
   ;                  (call (closure '() (var "frec")) (var "lst"))))

   
   ;(check-equal? (eval-exp (call (call mupl-map (fun #f "x" (add (var "x") (int 7)))) (apair (int 1) (aunit)))) 
   ;              (apair (int 8) (aunit)) "mupl-map test")
   ;(check-equal? (eval-exp (call (call mupl-map (fun #f "x" (add (var "x") (int 7)))) (apair (int 1) (apair (int 2) (aunit))))) 
   ;              (apair (int 8) (apair (int 9) (aunit))) "mupl-map test")
   
   ;; problems 1, 2, and 4 combined test
   ;(check-equal? (mupllist->racketlist
   ;  (eval-exp (call (call mupl-mapAddN (int 7))
   ;                (racketlist->mupllist 
   ;                 (list (int 3) (int 4) (int 9)))))) (list (int 10) (int 11) (int 16)) "combined test")
   
   ))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)
