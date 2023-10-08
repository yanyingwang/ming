#lang at-exp racket/base


(provide defmapping defhzify section+elemref section+autotag
         eleph-note elucidate
         defzi zi defzi/unicode-pua
         modernly-simplifies anciently-simplifies modernly-means
         )
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

(define (defzi/unicode-pua tag)
  (elemtag tag (elem (bold (litchar tag)) ":" (hspace 1) "character from Unicode Privae Use Areas especially designed by ming-lang.")))

(define (defzi tag . content)
  (elemtag tag (elem (bold (litchar tag)) ":" (hspace 1) content)))

(define (zi c) ;; zi shorts for hanzi, means chinese chars.
  (elemref c (racketplainfont c))
  )

(define (section+autotag . content)
  (define tag (string-join content ""))
  (section #:tag tag content))

(define (eleph-note . content) ;; 像注, elephant in chinese is wrote as 象, and 像 means like, resemble
  (margin-note (elem "🐘" (hspace 1) content))) ;; 💡

(define (elucidate . content) ;; 释义
  (elem (italic content)))

(define (modernly-means elucidation . content)
  @elem{means @elucidate{@elucidation} in modern chinese. @content}
  )

(define (modernly-simplifies zi elucidation . content)
  @elem{simplifies from @(litchar zi), which means @(elucidate elucidation) in modern chinese. @content}
  )

(define (anciently-simplifies zi elucidation ming-elu . content)
  @elem{simplifies from @litchar{@zi} in ancient chinese, means @elucidate{@elucidation}, especially means @elucidate{@ming-elu} in ming-lang. @content}
  )
