#lang racket/base

(require (for-syntax racket/require-transform
                     racket/base))
(provide minglize
         mingreq)




(define-syntax minglize
    (make-require-transformer
     (lambda (stx)
       (syntax-case stx ()
         [(_ path)
          (expand-import
           (syntax-local-introduce #'(rename-in path (first fff))))
          ]))))

;; (define-for-syntax mingtable '(first 甲))


;; (require (minglize racket/list))  ;; minglize 名化，汉化 chineselize
;; (甲 (list 1 2 3))

;; (define-syntax (mingreq stx)
;;   (datum->syntax stx '(require gregor)))