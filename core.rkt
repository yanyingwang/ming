#lang racket/base

(provide mingize)


(require (for-syntax (rename-in "mapping/racket/list.rkt" [mapping mapping/racket/list])
                     (rename-in "mapping/racket.rkt" [mapping mapping/racket])
                     (rename-in "mapping/racket/base.rkt" [mapping mapping/racket/base])
                     (rename-in "mapping/racket/list.rkt" [mapping mapping/racket/list])
                     racket/base
                     racket/syntax
                     racket/require-transform))

(begin-for-syntax
  (define-namespace-anchor anchor)
  (define ns (namespace-anchor->namespace anchor))
  (define (get-mapping-data path)
    ;; (println path)
    (eval `(,(format-symbol "mapping/~a" path)) ns)))

(define-syntax mingize
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ path)
        ;; (println (syntax-e #'path))
        ;; (println (get-mapping-data #'path))
        ;; (println (datum->syntax stx `(rename-in ,(syntax-e #'path) ,(get-mapping-data #'path))))
        (expand-import
         (datum->syntax stx `(rename-in ,(syntax-e #'path) ,@(get-mapping-data #'path))))
        ]))))


#|
usage:
(require ming/core)
(require (mingize racket/list))

;; usage
;; (require (mingize racket/list))  ;; mingize 名化，汉化 chineselize
;; (乙 (list 1 2 3))
;; (甲 (链 1 2 3))
|#
