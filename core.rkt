#lang racket/base

(provide minglize)
(require (for-syntax racket/require-transform
                     racket/base
                     racket/syntax))
(require (for-syntax (rename-in "mapping/racket.rkt" [table table-racket])))
(require (for-syntax (rename-in "mapping/racket/base.rkt" [table table-racket/base])))
(require (for-syntax (rename-in "mapping/racket/list.rkt" [table table-racket/list])))

(define-syntax (minglize1 stx)
  (datum->syntax stx
                 '(require ming/core
                           (for-syntax (rename-in "mapping/racket/list.rkt"
                                                  [table table-racket/list])))))

(define-for-syntax (get-table path)
  (eval (format-id path "table-~a" path))
  )

(define-syntax minglize
  (make-require-transformer
   (lambda (stx)
     (displayln stx)
     (syntax-case stx ()
       [(_ path)
        (displayln #'path)
        (expand-import
         (datum->syntax stx `(rename-in ,#'path ,@(get-table #'path)))) ;; TODO: table should be defined in define syntax block depending on the value of #'path
        ]))))



;; usage
;; (require (minglize racket/list))  ;; minglize 名化，汉化 chineselize
;; (甲 (list 1 2 3))
;; (乙 (list 1 2 3))
