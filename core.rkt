#lang racket/base

(provide mingize
         (for-syntax mingize-mapping/racket ;; TODO match out
                     mingize-mapping/racket/base
                     mingize-mapping/racket/list)
         )

(require (for-syntax racket/base
                     racket/syntax
                     racket/require-transform))

;; TODO: make bwlow as a sub-require, e.g. (require (mingmaplize "mapping/racket.rkt" "mapping/racket/base.rkt" ...))
(require (for-syntax (rename-in "mapping/racket.rkt" [mapping mingize-mapping/racket])
                     (rename-in "mapping/racket/base.rkt" [mapping mingize-mapping/racket/base])
                     (rename-in "mapping/racket/list.rkt" [mapping mingize-mapping/racket/list])))


(define-for-syntax (ming-mapping path)
  ((eval (format-id path "mingize-mapping/~a" path)))) ;; TODO: try (eval (format-id path "(mingize-mapping/~a) path"))

(define-syntax mingize
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ path)
        ;; (println (ming-mapping #'path))
        ;; (println mingize-mapping-racket/list)
        (expand-import
         (datum->syntax stx `(rename-in ,#'path ,@(ming-mapping #'path))))
        ]))))


#| usage:
(require ming/core)
(mapping-init)
(begin-for-syntax (println table-racket))
(require (mingize racket))

;; usage
;; (require (mingize racket/list))  ;; mingize 名化，汉化 chineselize
;; (甲 (链 1 2 3))
;; (乙 (list 1 2 3))

(require  (for-syntax (rename-in "mapping/racket.rkt" [table table-racket])
                      (rename-in "mapping/racket/base.rkt" [table table-racket/base])
                      (rename-in "mapping/racket/list.rkt" [table table-racket/list])))
|#
