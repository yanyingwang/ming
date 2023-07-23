#lang racket/base


(provide mingifingly-require mingify)
(require (for-syntax racket/base racket/format racket/syntax racket/require-transform syntax/stx racket/require
                     ))


(require (for-syntax racket/format syntax/stx))
(define-syntax (mingifingly-require stx)
  (syntax-case stx ()
    [(_ paths ...)
     (displayln (~a #`(require #,@(map (lambda (e) (format "mapping/~a.rkt" e)) (stx-map syntax-e #'(paths ...))))))
     ;; (displayln (~a #`(require (multi-in "mapping" #,(map symbol->string (stx-map syntax-e #'(module-paths ...)))))))
     #`(require #,@(map (lambda (e) (format "mapping/~a.rkt" e)) (stx-map syntax-e #'(paths ...))))
     ]
    )
  )


(define-syntax mingify
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ paths ...)
        (displayln (~v #`(combine-in #,@(map (lambda (e) (format "mapping/~a.rkt" e)) (stx-map syntax-e #'(paths ...))))))
        (expand-import
         #`(combine-in #,@(map (lambda (e) (format "mapping/~a.rkt" e)) (stx-map syntax-e #'(paths ...))))
)
        ]))))

;; usage:
;; (mingifingly-require racket/list racket/string)
;; (require (mingify racket/list racket/string))



(require (for-syntax racket/base racket/format racket/syntax racket/require-transform
                     "private/mapping-files.rkt"))


(define-syntax ming-mappings
  (make-require-transformer
   (lambda (stx)
     (expand-import
         (datum->syntax stx
                        `(combine-in ,@(map (lambda (e)
                                              `(rename-in ,(format "mapping~a"  e) [mapping ,(format-symbol "mapping~a" (path->string (path-replace-extension e #"")))]))
                                            mapping-files)))
         )
     )))

(define-syntax ming-mappings/racket
  (make-require-transformer
   (lambda (stx)
     (expand-import
         (datum->syntax stx
                        `(combine-in ,@(map (lambda (e)
                                              `(rename-in ,(format "mapping~a"  e) [mapping ,(format-symbol "mapping~a" (path->string (path-replace-extension e #"")))]))
                                            mapping-files-racket)))
         )
     )))
;;;; for expanding to:
;; (require  (combine-in (rename-in "mapping/racket/list.rkt" (mapping mapping/racket/list))
;;                       (rename-in "mapping/racket/base.rkt" (mapping mapping/racket/base))
;;                       ...))

;; (require (ming-mappings/racket))

;; (require (mingify (racket/base racket/list)) list hash)

(require (ming (racket/base racket/list list hash)))

(require (ming/racket (base list))
         (ming (list hash)))

(require (ming (racket/base
                racket/list
                list
                hash)))

(require ming/racket/base ming/racket/list ming/list ming/hash)
