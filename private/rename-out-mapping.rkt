#lang racket/base

(provide rename-out-mapping)
(require (for-syntax racket/base racket/provide-transform))



(begin-for-syntax (define mapping-data (make-parameter '(a b c))))


(define-syntax rename-out-mapping
  (make-provide-pre-transformer
   (lambda (stx modes)
     (syntax-case stx ()
       [(_)
        (begin (displayln (datum->syntax stx `(rename-out  ,(current-namespace) )))
               (pre-expand-export
                (datum->syntax stx `(rename-out  ,(mapping-data) ))  modes))
        ])))
  )


;; (define-syntax (rename-out-mapping stx)
;;   (syntax-case stx ()
;;     [(_)
;;      (datum->syntax stx `(displayln  ,(syntax-parameter-value #'mapping-data) ))])


;;   )


