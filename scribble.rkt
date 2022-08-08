#lang racket/base


(provide defmapping defchinesize)
(require scribble/manual
         (for-syntax (rename-in "mapping/racket/base/pairs-and-lists.rkt" [mapping mapping-racket/base/pairs-and-lists])
                     (rename-in "mapping/racket/base/syntactic-forms.rkt" [mapping mapping-racket/base/syntactic-forms])
                     (rename-in "mapping/racket/base/others.rkt" [mapping mapping-racket/base/others])
                     (rename-in "mapping/racket/list.rkt" [mapping mapping-racket/list]))
         (for-syntax racket/base racket/syntax))


(begin-for-syntax
  (define-namespace-anchor anchor)
  (define ns (namespace-anchor->namespace anchor))
  (define (gen-defthings path syntax-mapping-data)
    ;; (println (syntax-e path))
    (define mapping-data1 (syntax->datum syntax-mapping-data))
    (define mapping-data (eval `(,(format-symbol "mapping-~a" path) #:scribble? #t) ns))
    `(deftogether
         ,(for/list ([l (in-list mapping-data)]
                     #:do ((define en (car l))
                           (define cn (cadr l))
                           (define resn (caddr l))
                           (define elem-list (assoc cn mapping-data1))))
            ;; (println `(defthing #:kind "汉化" ,b ,c #:value ,a))
            ;; `(defthing #:kind "汉化" ,cn ,(if elem-list (cadr elem-list) resn) #:value ,en)
            `(defchinesize ,cn ,(if elem-list (cadr elem-list) resn) ,en)
            ))
    ))

(define-syntax (defmapping stx)
  (syntax-case stx()
    [(_ path mapping-data)
     ;; (println #'path)
     ;; (println (syntax->datum #'dict))
     ;; (println (gen-defthings #'path))
     (datum->syntax stx (gen-defthings #'path #'mapping-data))]))

(define-syntax (defchinesize stx)
  (syntax-case stx()
    [(_ cn-id reason en-id)
     ;; (println #'reason)
     (datum->syntax stx `(defthing #:kind "汉化" ,(syntax-e #'cn-id) (unsyntax (racketoutput ,(syntax-e #'reason))) #:value ,(syntax-e #'en-id)))
     ]
    ))
#;(define (defchinesize transed-id reason ori-id)
   `(defthing #:kind "汉化" ,transed-id ,reason #:value ,ori-id))
