#lang racket/base


(provide defmapping defchinesize)
(require "private/match-files-in.rkt"
         (for-syntax racket/base racket/syntax
                     (match-files-in mapping (#rx"^/racket/.*\\.rkt$"))))


(begin-for-syntax
  (define-namespace-anchor anchor)
  (define ns (namespace-anchor->namespace anchor))
  (define (gen-defthings path mapping-data1)
    (define mapping-data (eval `(,(format-symbol "mapping/~a" path) #:scribble? #t) ns))
    `(deftogether
         ,(for/list ([l (in-list mapping-data)]
                     #:do ((define en (car l))
                           (define cn (cadr l))
                           (define resn (caddr l))
                           (define elem-list (assoc cn mapping-data1))))
            `(defchinesize ,cn ,(if elem-list (cadr elem-list) resn) ,en)
            ))
    ))

(define-syntax (defmapping stx)
  (syntax-case stx ()
    [(_ path mapping-data)
     (datum->syntax stx (gen-defthings #'path (syntax->datum #'mapping-data)))]
    [(_ path)
     (datum->syntax stx (gen-defthings #'path '()))]))

(define-syntax (defchinesize stx)
  (syntax-case stx()
    [(_ cn-id reason en-id)
     (datum->syntax stx `(defthing #:kind "汉化" ,(syntax-e #'cn-id) (unsyntax (racketoutput ,(syntax-e #'reason))) #:value ,(syntax-e #'en-id)))
     ]
    ))
