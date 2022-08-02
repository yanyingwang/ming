#lang racket/base


(provide defmapping)
(require (for-syntax racket/base racket/syntax racket/dict
                     (rename-in "mapping/racket/base/pairs-and-lists.rkt" [mapping mapping-pairs-and-lists])
                     (rename-in "mapping/racket/base/syntactic-forms.rkt" [mapping mapping-syntactic-forms])
                     (rename-in "mapping/racket/list.rkt" [mapping mapping-racket/list])))

(begin-for-syntax (define-namespace-anchor anchor)
                  (define ns (namespace-anchor->namespace anchor))
                  (define (ming-mapping path)
                    ((eval (format-id path "mapping-~a" path) ns))))

(define-syntax (defmapping stx)
  (syntax-case stx ()
    [(_ path)
     (datum->syntax stx
                    `(begin
                       (deftogether
                           ,(for/list ([(k v) (in-dict (ming-mapping #'path))])
                              `(defthing #:kind "翻译" ,(car v) "解释为什么" #:value ,k)
                              ))))]))
