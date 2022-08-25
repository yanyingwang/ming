#lang racket/base


(provide defmapping defchinesize)
(require (for-syntax racket/base racket/syntax)
         "private/match-in-files.rkt"
         (match-in-files mapping (#rx"^/racket/.*\\.rkt$")))


(begin-for-syntax
  (define-namespace-anchor anchor)
  (define ns (namespace-anchor->namespace anchor))
  (define (gen-defthings path mapping-data1)
    ;; (println (syntax-e path))
    (define mapping-data (eval `(,(format-symbol "mapping/~a" path) #:scribble? #t) ns))
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
  (syntax-case stx ()
    [(_ path mapping-data)
     ;; (println #'path)
     ;; (println (syntax->datum #'dict))
     ;; (println (gen-defthings #'path))
     (datum->syntax stx (gen-defthings #'path (syntax->datum #'mapping-data)))]
    [(_ path)
     ;; (println #'path)
     ;; (println (syntax->datum #'dict))
     ;; (println (gen-defthings #'path))
     (datum->syntax stx (gen-defthings #'path '()))]))

(define-syntax (defchinesize stx)
  (syntax-case stx()
    [(_ cn-id reason en-id)
     ;; (println #'reason)
     (datum->syntax stx `(defthing #:kind "汉化" ,(syntax-e #'cn-id) (unsyntax (racketoutput ,(syntax-e #'reason))) #:value ,(syntax-e #'en-id)))
     ]
    ))
#;(define (defchinesize transed-id reason ori-id)
   `(defthing #:kind "汉化" ,transed-id ,reason #:value ,ori-id))
