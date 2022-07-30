#lang racket/base

(provide minglize
         (for-syntax table-racket
                     table-racket/base
                     table-racket/list))


(require (for-syntax racket/base
                     racket/syntax
                     racket/require-transform))

;; (define-syntax (mapping-init stx)
;;   (datum->syntax stx '(require (for-syntax (rename-in ming/mapping/racket [table table-racket])
;;                                            (rename-in ming/mapping/racket/base [table table-racket/base])
;;                                            (rename-in ming/mapping/racket/list [table table-racket/list])))))

(require  (for-syntax (rename-in "mapping/racket.rkt" [table minglizing-mapping--racket])
                      (rename-in "mapping/racket/base.rkt" [table minglizing-mapping--racket/base])
                      (rename-in "mapping/racket/list.rkt" [table minglizing-mapping--racket/list])))


(define-for-syntax (get-table path)
  (eval (format-id path "minglizing-mapping--~a" path)))

(define-syntax minglize
  (make-require-transformer
   (lambda (stx)
     ;; (displayln stx)
     (syntax-case stx ()
       [(_ path)
        (displayln (format-id #'path "ming/mapping/~a" #'path))
        (expand-import
         (datum->syntax stx `(combine-in (for-syntax ,(format-id #'path "ming/mapping/~a" #'path))
                                         (rename-in ,#'path ,@(get-table #'path)))))
        ]))))

;; usage
;; (require (minglize racket/list))  ;; minglize 名化，汉化 chineselize
;; (甲 (链 1 2 3))
;; (乙 (list 1 2 3))

#|
(require ming/core)
(mapping-init)
(begin-for-syntax (println table-racket))
(require (minglize racket))

(require  (for-syntax (rename-in "mapping/racket.rkt" [table table-racket])
                      (rename-in "mapping/racket/base.rkt" [table table-racket/base])
                      (rename-in "mapping/racket/list.rkt" [table table-racket/list])))


|#
