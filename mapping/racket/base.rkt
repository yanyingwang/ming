#lang racket/base

(provide mapping)
(require (for-syntax racket/base racket/syntax racket/sequence racket/runtime-path))

(begin-for-syntax
  (define-runtime-path base "base")
  (define base-files
    (for/list ([f (directory-list base)])
      (format "base/~a" f))))

(define-syntax (require-base/* stx)
  (let ([sub-requires (for/list ([f base-files]
                                 [i (in-range (length base-files))])
                        `(rename-in ,f [mapping ,(format-symbol "mapping~a" i)]))])
    ;; (println (datum->syntax stx (list* 'require sub-requires)))
    (datum->syntax stx (list* 'require sub-requires))))

(define-syntax (define-mapping stx)
  (let ([append-lists (for/list ([i (in-range (sequence-length base-files))])
                        `(,(format-symbol "mapping~a" i) #:scribble? scribble?))])
    (datum->syntax stx
                   `(define (mapping #:scribble? [scribble? #f])
                      ,(list* 'append append-lists)))))


(require-base/*)
(define-mapping)


#| usage:
(require "mapping/racket/base.rkt")
(mapping)
(mapping #:scribble? #t)

check below link for the phases and bindings.
"A syntax object has a lexical context from the moment it first exists. A syntax object that is provided from a module retains its lexical context, and so it references bindings in the context of its source module, not the context of its use.
"
https://docs.racket-lang.org/guide/phases.html#%28part._.Phases_and_.Bindings%29
|#

