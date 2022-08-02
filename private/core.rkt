#lang racket/base

;; (provide minglize)

#;(require (for-syntax racket/base
                     racket/syntax
                     racket/provide-transform))

;; TODO: make bwlow as a sub-require, e.g. (require (mingmaplize "mapping/racket.rkt" "mapping/racket/base.rkt" ...))
;; (require (for-syntax (rename-in "../mapping/racket.rkt" [mapping minglize-mapping/racket])
;;                      (rename-in "../mapping/racket/base.rkt" [mapping minglize-mapping/racket/base])
;;                      (rename-in "../mapping/racket/list.rkt" [mapping minglize-mapping/racket/list])))

#;(define-for-syntax (ming-mapping path)
  #;((eval (format-id path "~a" path)))
  (eval '(,path))
  ) ;; TODO: try (eval (format-id path "(minglize-mapping/~a) path"))

;; (define-syntax minglize
;;   (make-provide-transformer
;;    (lambda (stx modes)
;;      (syntax-case stx ()
;;        [(_ (lit-all-from-out path))
;;         ;; (println (ming-mapping #'path))
;;         (println #'path)
;;         (expand-export
;;          (datum->syntax stx `(rename-in (,#'lit-all-from-out ,#'path) ,@(ming-mapping #'path))) modes)
;;         ]))))


#|
;; (define-for-syntax (mapping) '((test1 test11) (test2 test22)))
(module tstmdle racket/base
  (require (for-syntax racket/base "mapping/racket/base.rkt")
           "private/core.rkt")
  (begin-for-syntax (printf "=====print out |mapping| value:======\n~a\n" (mapping)))
  (provide (minglize (all-from-out racket/base)))
  )
|#

;; (define map '((first ffff) (second ssss)))
;; (define (setup-mapping map)
;;   (define-syntax mapping map)
;;   '())

;; (begin-for-syntax (println (syntax-local-value #'mapping)))

;; (define-syntax mapping '((first ffff) (second ssss)))


(provide provide-with-mingizily-require)
(require
 (for-syntax racket/base racket/syntax
             (rename-in "../mapping/racket.rkt" [mapping minglize-mapping/racket])
             (rename-in "../mapping/racket/base.rkt" [mapping minglize-mapping/racket/base])
             (rename-in "../mapping/racket/list.rkt" [mapping minglize-mapping/racket/list])))

(begin-for-syntax (define-namespace-anchor anchor)
                  (define ns (namespace-anchor->namespace anchor))
                  (define (ming-mapping path)
                    ((eval (format-id path "minglize-mapping/~a" path) ns))))

(define-syntax (provide-with-mingizily-require stx)
  (syntax-case stx ()
    [(_ path)
     (datum->syntax stx
                    `(begin (require ,(syntax-e #'path))
                            (provide (rename-out ,@(ming-mapping #'path)))))]))


#|
(require "private/core.rkt")
(provide-with-mingizily-require racket/list)
(require racket/list)
(require mapping/racket/list)
(provide rename-out ((first fff) (second sss))) #'mapping
|#
