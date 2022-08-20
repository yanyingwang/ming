#lang racket/base


(provide defmapping defchinesize)
(require (for-syntax racket/base racket/syntax racket/runtime-path racket/string racket/path))


(begin-for-syntax
  (define-runtime-path the-path "mapping")
  (define the-files
    (for/list ([f (in-directory the-path)]
               #:when (and (string-suffix? (path->string f) ".rkt")
                           (not (string-suffix? (path->string f) "base.rkt"))
                           (not (string-suffix? (path->string f) "racket.rkt")))
               #:do [(define fstring (path->string f))])
      (string-replace fstring #rx".*/mapping" "mapping"))))

(define-syntax (require-mapping/* stx)
  (let ([sub-requires (for/list ([f the-files]
                                 #:do [(define new-mapping/path (path-replace-extension f #""))
                                       (define new-mapping (string->symbol (path->string new-mapping/path)))])
                        `(rename-in ,f [mapping ,new-mapping]))])
    (println sub-requires)
    (datum->syntax stx `(require (for-syntax ,@sub-requires)))))

(require-mapping/*)


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
