#lang racket/base


(provide defmapping defhzify section+elemref)
(require scribble/manual
         (for-syntax racket/base racket/string racket/list
                     "private/zitable.rkt"))


(define-syntax-rule (defhzify cnid rsn enid)
  (defthing #:kind "汉字化" cnid (unsyntax (racketvalfont rsn)) #:value enid)
  )

(define-syntax (section+elemref stx)
  (syntax-case stx ()
    [(_ pars ...)
     (datum->syntax stx `(begin
                           ,(cons 'section #'(pars ...))
                           ,@(for/list ([e (string-split (syntax-e (last (syntax-e #'(pars ...)))) #rx"(、|，|：)")]) (list 'elemtag (string-trim e))) ; fix last, when source code includes newlines
                           (linebreak)))]
    )
  )


(define-syntax (defmapping stx)
  (define (gen-defhzify ecr)
    (define enid (car ecr))
    (define cnid (cadr ecr))
    (define rsn (if (> (length ecr) 2) (caddr ecr) ""))
    (define rsn+secref `(elem ,rsn (elemref #:underline? #f  ,(symbol->string cnid) "【MORE】") ))
    (datum->syntax stx `(defhzify ,cnid ,rsn+secref ,enid)))
  (syntax-case stx ()
    [(_ path)
     (with-syntax ([(defth ...)
                    (map gen-defhzify
                         (get-zis (syntax-e #'path)))])
       #'(deftogether
             (defth ...)))]
    )
  )
