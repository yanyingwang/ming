#lang racket/base


(provide defmapping defhzify defzi section+elemref section+autotag
         像注 elucidate)
(require scribble/manual racket/string scribble/core
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
    (define rsn
      (if (> (length ecr) 2)
          `(elem ,(caddr ecr) (hspace 1))
          ""))
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


(define (defzi tag . content)
  (elemtag tag (elem (bold (litchar tag)) ":" (hspace 1) content)))


(define (section+autotag . content)
  (define tag (string-join content ""))
  (section #:tag tag content))

(define (像注 . content) ;; elephant-note
  (margin-note (elem "🐘" (hspace 1) content)))

(define (elucidate . content) ;; 释义
  (elem (italic content)))
