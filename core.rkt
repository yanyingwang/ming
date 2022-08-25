#lang racket/base

(provide mingize)
(require "private/match-in-files.rkt"
         (for-syntax racket/base
                     racket/syntax
                     racket/require-transform
                     (match-in-files mapping (#rx"^/([a-z]+)\\.rkt$"
                                              #rx"^/racket/([a-z]+)\\.rkt$"))))

(begin-for-syntax
  (define-namespace-anchor anchor)
  (define ns (namespace-anchor->namespace anchor))
  (define (get-mapping-data path)
    (eval `(,(format-symbol "mapping/~a" path)) ns)))

(define-syntax mingize
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ path)
        (expand-import
         (datum->syntax stx `(rename-in ,(syntax-e #'path) ,@(get-mapping-data #'path))))
        ]))))


#|
usage:
(require ming/core)
(require (mingize racket/list))

;; usage
;; (require (mingize racket/list))  ;; mingize 名化，汉化 chineselize
;; (乙 (list 1 2 3))
;; (甲 (链 1 2 3))
|#
