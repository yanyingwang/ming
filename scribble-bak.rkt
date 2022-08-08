#lang racket/base


(provide dict-ref defmapping defchinesize)
(require racket/dict
         ;; (rename-in "mapping/racket/base/pairs-and-lists.rkt" [mapping mapping-racket/base/pairs-and-lists])
         ;; (rename-in "mapping/racket/base/syntactic-forms.rkt" [mapping mapping-racket/base/syntactic-forms])
         ;; (rename-in "mapping/racket/base/others.rkt" [mapping mapping-racket/base/others])
         ;; (rename-in "mapping/racket/list.rkt" [mapping mapping-racket/list])
         "mapping/racket/list.rkt"
         (for-syntax racket/base racket/syntax racket/dict))


(define-syntax (defmapping stx)
  (syntax-case stx ()
    [(_ path explanation-mapping)
     (datum->syntax stx
                    `(begin
                       (let ([expl-mapping ,(syntax-e #'explanation-mapping)])
                         (deftogether
                             ,(for/list ([l (in-list (mapping #:scribble #t))]
                                         #:do ((define a (car l))
                                               (define b (cadr l))
                                               (define c (caddr l))))
                                `(defchinesize ,b #,(racketoutput (dict-ref expl-mapping 'b ,c)) ,a)
                              )))))]))


(define-syntax (defchinesize stx)
  (syntax-case stx()
    [(_ transed-id reason ori-id)
     (datum->syntax stx `(defthing #:kind "汉化" ,(syntax-e #'transed-id) ,(syntax-e #'reason) #:value ,(syntax-e #'ori-id)))
     ]
    ))


;; (define-syntax (explanation-mapping<<- stx)
;;   (syntax-case stx ()
;;     [(_ name explanation)
;;      (datum->syntax stx
;;                     `(set! explanation-mapping
;;                            (append explanation-mapping '((,#'name . ,#'explanation)))))]
;;     )
;;   )


