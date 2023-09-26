#lang racket/base

(provide (except-out (all-from-out racket/base) #%module-begin)
         (rename-out (module-begin #%module-begin)))

(require (for-syntax racket/base racket/string))

(define-syntax (module-begin stx)
  (syntax-case  stx ()
    [(_ expr ...)
     (begin
       (define data
         (apply hash (syntax->datum #'(expr ...))))
       (define mapping-path (hash-ref data 'mapping:))
       (define racket-path (string-trim mapping-path #px"(.rkt|../mapping/)"))
       ;; todo: find out the reason why below df
       ;; (define racket-path-id (datum->syntax stx (string->symbol (string-trim mapping-path #px"(.rkt|../mapping/)"))))
       ;; (printf "stx-source: ~a" #`(abc (require #,racket-path-id)))

       #`(#%module-begin
          (require
           ;; todo:
           ;; (define racket-path-id (datum->syntax stx (string->symbol (string-trim mapping-path #px"(.rkt|../mapping/)")))) ;;=> racket/list
           ;; #,racket-path-id
           (lib #,racket-path)
                   (for-syntax racket/base
                               racket/provide-transform
                               #,mapping-path
                               "../private/mapping-helper.rkt")
                   )

          (define-syntax rename-out-mapping
            (make-provide-pre-transformer
             (lambda (stx modes)
               (syntax-case stx ()
                 [(_)
                  (pre-expand-export
                   (datum->syntax stx `(rename-out  ,@(exclude-text mapping)))  modes)
                  ])))
            )

          (provide (rename-out-mapping))
          )
       )
     ])
  )
