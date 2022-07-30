#lang racket/base

(provide minglize
         (for-syntax minglizing-mapping/racket
                     minglizing-mapping/racket/base
                     minglizing-mapping/racket/list))

(require (for-syntax racket/base
                     racket/syntax
                     racket/require-transform))

(require (for-syntax (rename-in "mapping/racket.rkt" [mapping minglizing-mapping/racket])
                     (rename-in "mapping/racket/base.rkt" [mapping minglizing-mapping/racket/base])
                     (rename-in "mapping/racket/list.rkt" [mapping minglizing-mapping/racket/list])))


(define-for-syntax (ming-mapping path)
  ((eval (format-id path "minglizing-mapping/~a" path))))

(define-syntax minglize
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ path)
        ;; (println (ming-mapping #'path))
        ;; (println minglizing-mapping-racket/list)
        (expand-import
         (datum->syntax stx `(rename-in ,#'path ,@(ming-mapping #'path))))
        ]))))


#|
(require ming/core)
(mapping-init)
(begin-for-syntax (println table-racket))
(require (minglize racket))

;; usage
;; (require (minglize racket/list))  ;; minglize 名化，汉化 chineselize
;; (甲 (链 1 2 3))
;; (乙 (list 1 2 3))

(require  (for-syntax (rename-in "mapping/racket.rkt" [table table-racket])
                      (rename-in "mapping/racket/base.rkt" [table table-racket/base])
                      (rename-in "mapping/racket/list.rkt" [table table-racket/list])))
|#
