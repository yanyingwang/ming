#lang racket/base


(provide mingifingly-require)
(require (for-syntax racket/base racket/format racket/syntax racket/require-transform syntax/stx racket/require
                     ))








(define-syntax (mingifingly-require stx)
  (syntax-case stx ()
    [(_ paths ...)
     (displayln (~a #`(require #,@(map (lambda (e) (format "mapping/~a.rkt" e)) (stx-map syntax-e #'(paths ...))))))
     ;; (displayln (~a #`(require (multi-in "mapping" #,(map symbol->string (stx-map syntax-e #'(module-paths ...)))))))
     #`(require #,@(map (lambda (e) (format "mapping/~a.rkt" e)) (stx-map syntax-e #'(paths ...))))
     ]
    )
  )
(mingifingly-require racket/list racket/string)



(define-syntax (mingifingly-require stx)
  (syntax-case stx ()
    [(_ paths)
     (displayln (~a #`(require #,(format "mapping/~a.rkt"  (syntax-e #'paths)))))
     #`(require #,(format "mapping/~a.rkt"  (syntax-e #'paths)))

     ]
    )
  )
(mingifingly-require racket/list)


(define-syntax mingify
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ path)
        (expand-import
         (datum->syntax stx `(rename-in ,(syntax-e #'path) ,@(get-mapping-data #'path))))
        ]))))







(define-for-syntax (matched-files matchings)
  (filter (lambda (f)
            (ormap (lambda (m)
                     (regexp-match m f))
                   matchings))
          mapping-files))

(define-syntax match-files-in
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ path matchings)
        (expand-import
         (datum->syntax stx `(combine-in ,@(for/list ([f (matched-files (syntax->datum #'matchings))])
                                             `(rename-in ,(format "~a~a" (syntax-e #'path) f) [mapping ,(format-symbol "mapping~a" (path->string (path-replace-extension f #"")))])))))
        ]))))
