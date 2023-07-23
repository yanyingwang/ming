;; #lang at-exp s-exp "../private/provide-lang.rkt"
;; mapping: "../mapping/racket/base.rkt"

#lang racket/base

(require racket/stxparam
         ;; "../private/rename-out-mapping.rkt"
         (for-syntax racket/base racket/provide-transform
                     "../mapping/racket/base.rkt")
         )

(define-syntax rename-out-mapping
  (make-provide-pre-transformer
   (lambda (stx modes)
     (syntax-case stx ()
       [(_)
        (pre-expand-export
         (datum->syntax stx `(rename-out  ,@(mapping) ))  modes)
        ])))
  )

(begin-for-syntax (displayln  (mapping)))

(provide (rename-out-mapping))
