#lang racket/base

(require (for-syntax racket/require-transform
                     racket/base
                     "../mapping/racket.rkt"))
(provide minglize)

;; (define-for-syntax table '(first fff))

(define-syntax minglize
    (make-require-transformer
     (lambda (stx)
       (syntax-case stx ()
         [(_ path)
          (expand-import
           (datum->syntax stx `(rename-in ,#'path ,@table)))
          ]))))

;; usage
;; (require (minglize racket/list))  ;; minglize 名化，汉化 chineselize
;; (甲 (list 1 2 3))
