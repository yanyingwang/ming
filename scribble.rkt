#lang racket/base

(provide defmapping)
(require racket/dict)
(require (for-syntax racket/base racket/syntax))

(define-for-syntax racket/list '((first fff) (second sec) ))

(define-syntax (defmapping stx)
  (syntax-case stx ()
    [(_ mapping)
     (println (for/fold ([acc '(begin)])
                       ([l (eval #'mapping)])
                   (append acc `(,(list* 'defthing l)))))])

  #;(datum->syntax stx
                 (for/fold ([acc '(begin)])
                           ([l mapping])
                   (append acc `(,(list* 'defthing l)))))
  #'void
  )
