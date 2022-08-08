#lang racket/base

(provide mingize
         #;(for-syntax mingize-mapping/racket ;; TODO match out
                     mingize-mapping/racket/base
                     mingize-mapping/racket/list)
         )

(require (for-syntax racket/base
                     racket/syntax
                     racket/require-transform))

;;;; TODO: make bwlow as a sub-require, e.g. (require (mingmaplize "mapping/racket.rkt" "mapping/racket/base.rkt" ...))
#;(require (for-meta 2 racket/base racket/syntax)
         (for-meta 3 racket/base racket/syntax)
         ;; below ids would be required to meta 3, because they are already provided with for-syntax in their defined module.
         (for-syntax (rename-in "mapping/racket.rkt" [mapping mapping/racket])
                     (rename-in "mapping/racket/base.rkt" [mapping mapping/racket/base])
                     (rename-in "mapping/racket/list.rkt" [mapping mapping/racket/list])))


;; test check:
;; (begin-for-syntax (begin-for-syntax (println (mapping/racket/list))))
#;(begin-for-syntax
  (begin-for-syntax
    (define-syntax (get-mapping-data/scribble stx) ;; in meta 3
      (syntax-case stx ()
        [(_ path)
         (printf "path in <get-mapping-data/scribble>: ~a\n" #'path)
         ;; (println #`(#,(format-symbol "mapping/~a" #'path) #:scribble? #t))
         ;; (format-id stx "mapping/~a" #'path)
         #`(#,(format-symbol "mapping/~a" #'path) #:scribble? #t)
         ]))))
;; test check:
;; (begin-for-syntax (begin-for-syntax (println (get-mapping-data/scribble racket/list))))

#;(begin-for-syntax
  (begin-for-syntax
    (define (get-mapping-data/scribble p1)
      ;; (println p1)
      (mapping/racket/list))
    ))


#;(begin-for-syntax
  (define-syntax (get-mapping-data stx)
    (syntax-case stx ()
      [(_ path)
       (printf "path in <get-mapping-data>: ~a\n" #'path)
       (get-mapping-data/scribble (syntax->datum #'path))
       ])))
;; test check:
;; (begin-for-syntax (println (get-mapping-data racket/list)))
(begin-for-syntax
  (define (get-mapping-data path)
    (println path)
    ;; (println (mapping/racket/list))
    ;; (eval (mapping/racket/path) )
    (mapping/racket/list)
    )
  )

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
(require (rename-in "mapping/racket/list.rkt" [mapping mapping/racket/list]))

#|test to check:
(begin-for-syntax (begin-for-syntax (println (mapping/racket/list))))
(begin-for-syntax (begin-for-syntax (println (get-mapping-data/scribble racket/list))))
(begin-for-syntax (println (get-mapping-data racket/list)))




usage:
(require ming/core)
(require (mingize racket/list))

;; usage
;; (require (mingize racket/list))  ;; mingize 名化，汉化 chineselize
;; (甲 (链 1 2 3))
;; (乙 (list 1 2 3))

(require  (for-syntax (rename-in "mapping/racket.rkt" [table table-racket])
                      (rename-in "mapping/racket/base.rkt" [table table-racket/base])
                      (rename-in "mapping/racket/list.rkt" [table table-racket/list])))
|#


;; (require (for-syntax "mapping/racket/list.rkt")
;;          (for-meta 2 racket/base))

;; (begin-for-syntax (begin-for-syntax (println (mapping #:scribble? #t))))

;; (begin-for-syntax
;;   (define-syntax (fetch-mapping-data stx)
;;     (mapping #:scribble? #t)))

;; (begin-for-syntax (println (fetch-mapping-data)))

;; (begin-for-syntax (begin-for-syntax (println (mapping #:scribble? #t))))
