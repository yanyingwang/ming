#lang racket/base

(require (for-syntax racket/require-transform
                     racket/base)
         racket/stxparam)
(provide minglize)



(define-syntax minglize
    (make-require-transformer
     (lambda (stx)
       (syntax-case stx ()
         [(_ path)
          (expand-import
           (datum->syntax stx (list 'rename-in #'path mingtable)))
          ]))))

;; (define-syntax (check-a stx) (with-syntax ([the-a #'(mingtable)]) #'(displayln the-a)))

(define-for-syntax mingtable '(first fff))
;; (define mingtable
;;   (make-parameter '(first fst)))

;; (require (minglize racket/list))  ;; minglize 名化，汉化 chineselize
;; (甲 (list 1 2 3))
