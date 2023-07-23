#lang racket/base

(provide (except-out (all-from-out racket/base) #%module-begin)
         (rename-out (module-begin #%module-begin)))

(require (for-syntax racket/base))


(define (abc)
  (printf "ns: ~a~n" (current-namespace)))


(define-syntax (module-begin stx)
  (syntax-case  stx ()
    [(_ expr ...)
     #`(#%module-begin
        ;; (provide data)
        ;; (require "../mapping/racket/base.rkt")
        (abc)

        (begin-for-syntax


          (define data
            (apply hash (syntax->datum #'(expr ...))))

          (define mapping-path (hash-ref data 'mapping:)))


        (define-syntax (provide-with-required stx)
          (syntax-case stx ()
            [(_)
             (datum->syntax stx
                            `(begin (require ,mapping-path)
                                    ;; (displayln (mapping))


                                    ;; (provide (rename-out ,@(mapping)))
                                    ))]))

        (provide-with-required)



        ;; (require (for-meta #,mapping-path))
        ;; #,(displayln (hash #'(expr ...)))

        ;; (require (for-syntax racket/base racket/provide-transform))
        ;; (provide (rename-out-mapping))
        )])

  )
