#lang racket/base


(provide dict-ref defmapping)
(provide defminger)
(require racket/dict scribble/manual (for-syntax racket/base racket/syntax racket/dict
                     (rename-in "mapping/racket/base/pairs-and-lists.rkt" [mapping mapping-racket/base/pairs-and-lists])
                     (rename-in "mapping/racket/base/syntactic-forms.rkt" [mapping mapping-racket/base/syntactic-forms])
                     (rename-in "mapping/racket/base/others.rkt" [mapping mapping-racket/base/others])
                     (rename-in "mapping/racket/list.rkt" [mapping mapping-racket/list])))

(begin-for-syntax (define-namespace-anchor anchor)
                  (define ns (namespace-anchor->namespace anchor))
                  (define (ming-mapping path)
                    ((eval (format-id path "mapping-~a" path) ns)))
                  )

(define-syntax (defmapping stx)
  (syntax-case stx ()
    [(_ path explanation-mapping)
     (datum->syntax stx
                    `(begin
                       (let ([expl-mapping ,(syntax-e #'explanation-mapping)])
                         (deftogether
                           ,(for/list ([(k v) (in-dict (ming-mapping #'path))])
                              `(defminger ,(car v) #,(racketoutput (dict-ref expl-mapping ',(car v) " ")) ,k)
                              )))))]))


(define-syntax (defminger stx)
  (syntax-case stx()
    [(_ transed-id reason ori-id)
     (datum->syntax stx `(defthing #:kind "翻译" ,(syntax-e #'transed-id) ,(syntax-e #'reason) #:value ,(syntax-e #'ori-id)))
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



;; (define-syntax (defabc stx)
;;   (syntax-case stx ()
;;     [(_ id values ...)
;;      (begin (println #'id)
;;      (println #'(values ...)))
;;      #'void]))
;; (defabc jjj jjjjjjjjjj kkk)