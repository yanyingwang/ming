#lang at-exp racket/base


(provide defmapping defhzify section+elemref section+autotag
         eleph-note elucidate
         stands-for whstands-for
         same-as-cnchar same-as-cnchar-but same-as-cnchar-and
         simplified-from-cnchar simplified-from-cnchar-but simplified-from-cnchar-and
         modernly-simplifies anciently-simplifies
         simplf-from
         modernly-means mingly-resembles
         ori-esp-means
         ;; defradical defcomponent defcharacter defhybrid
         defradical defcomponent defsuffix defprefix definsert defhas
         defzi defzis defzi/puauni defzi/sub defcompost
         defideogr ideoexamples
         zi zis zi-ref zi-tool
         ziexamples rackets
         short-for-code short-for-racket
         )
(require scribble/manual racket/string scribble/core
         scribble/html-properties
         (for-syntax racket/base racket/string racket/list
                     scribble/core
                     "private/zitable.rkt"))


(define-syntax-rule (defhzify cnid rsn enid)
  (defthing #:kind "transformer" cnid (unsyntax (racketidfont rsn)) #:value enid)
  )

(define-syntax (defradical stx)
  (syntax-case stx ()
    [(_ zi)
     (with-syntax ([str-zi (symbol->string (syntax-e #'zi))])
       #'(elem (elemtag str-zi (bold (litchar str-zi))) (hspace 1) "as radical"))
     ])
  )

(define-syntax (defcomponent stx)
  (syntax-case stx ()
    [(_ zi)
     (with-syntax ([str-zi (symbol->string (syntax-e #'zi))])
       #'(elem (elemtag str-zi (bold (litchar str-zi))) (hspace 1) "as component" ))
     ])
  )
(define-syntax (defsuffix stx)
  (syntax-case stx ()
    [(_ zi)
     (with-syntax ([str-zi (if (number? (syntax-e #'zi))
                               (number->string (syntax-e #'zi))
                               (symbol->string (syntax-e #'zi)))])
       #'(elem "suffixed with" (hspace 1) (elemtag str-zi (bold (litchar str-zi)))))
     ])
  )
(define-syntax (defprefix stx)
  (syntax-case stx ()
    [(_ zi)
     (with-syntax ([str-zi (if (number? (syntax-e #'zi))
                               (number->string (syntax-e #'zi))
                               (symbol->string (syntax-e #'zi)))])
       #'(elem "prefixed with" (hspace 1) (elemtag str-zi (bold (litchar str-zi)))))
     ])
  )
(define-syntax (definsert stx)
  (syntax-case stx ()
    [(_ zi)
     (with-syntax ([str-zi (symbol->string (syntax-e #'zi))])
       #'(elem "inserted with" (hspace 1) (elemtag str-zi (bold (litchar str-zi)))))
     ])
  )
(define-syntax (defhas stx)
  (syntax-case stx ()
    [(_ zi)
     (with-syntax ([str-zi (symbol->string (syntax-e #'zi))])
       #'(elem "has" (hspace 1) (elemtag str-zi (bold (litchar str-zi)))))
     ])
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
    (define raw-exploded
      (cond [(and (> (length ecr) 2)
                  (list? (caddr ecr)))
             (map (lambda (e) `(zi ,(cond
                                 [(symbol? e) e]
                                 [(string? e) (string->symbol e)]
                                 [(list? e) 'needtofix]
                                 [else 'needtofix])))
                  (caddr ecr))]
            [(and (= (length ecr) 2)
                  (string-contains? (symbol->string cnid) "/"))
             (add-between (map (lambda (e) `(racket ,(string->symbol e)))
                               (string-split (symbol->string cnid) "/"))
                          `(zi /IFX))]
            [(= (length ecr) 2)
             (map (lambda (e)
                    (case e
                      (["*" "?" "~" "^"] `(zi ,(string->symbol (string-append e "SFX"))))
                      (else `(zi ,(string->symbol e)))))
                  (filter non-empty-string? (string-split (symbol->string cnid) "")))]
            [else '()]))
    (define exploded `(elem ,@(add-between raw-exploded " + ")))
    (datum->syntax stx `(defhzify ,cnid ,exploded ,enid)))
  (syntax-case stx ()
    [(_ path)
     (with-syntax ([(defth ...)
                    (map gen-defhzify
                         (get-zis (syntax-e #'path)))])
       #'(deftogether
             (defth ...)))]
    )
  )

(define (zi-tool zi [zi1 zi])
  (if zi
      (hyperlink (string-append "https://zi.tools/zi/" zi) zi1 #:style (style #f (list (attributes '([target . "_blank"] [style . "background: #ebf5fb; "])))))
      #f))


(define-syntax (ziexamples stx)
  (syntax-case stx ()
    [(_ examples ...)
     (with-syntax ([(racket-refs ...)
                    (map (lambda (e) #`(elem (hspace 1) (racket #,e)))
                         (syntax->list #'(examples ...)))])
       #`(elem #:style (style #f (list (alt-tag "p") [style . "margin-top: 2em;"]))
          "Examples: " racket-refs ... "."))
     ])
  )

(define-syntax (ideoexamples stx)
  (syntax-case stx ()
    [(_ examples ...)
     #`(elem #:style (style #f (list (alt-tag "div") (attributes '([style . "margin-top: 1em;"]))))
             "Examples: " examples ...)
     ])
  )

(define-syntax (rackets stx)
  (syntax-case stx ()
    [(_ ids ...)
     (with-syntax ([(racket-refs ...)
                    (map (lambda (e) #`(elem (hspace 1) (racket #,e)))
                         (syntax->list #'(ids ...)))])
       #`(elem  racket-refs ...))
     ])
  )

(define-syntax (zis stx)
  (syntax-case stx ()
    [(_ ids ...)
     (with-syntax ([(refs ...)
                    (map (lambda (e) #`(elem (hspace 1) (zi-ref #,(symbol->string (syntax->datum e)))))
                         (syntax->list #'(ids ...)))])
       #`(elem refs ...))
     ])
  )

(define (defzi0/puauni tag) ;; unicode from pivate use areas
  (elemtag tag (elem (bold (litchar tag)) ":" (hspace 1) "PUA unicode, especially designs for ming-lang.")))

(define (defzi0 tag . content)
  (elemtag tag (elem (bold (litchar tag)) ":" (hspace 1) content)))

(define-syntax (defzi/puauni stx)
  (syntax-case stx ()
    [(_ zi content ...)
     (with-syntax ([str-zi (symbol->string (syntax-e #'zi))])
       #'(elemtag str-zi (elem (bold (racket (code:hilite zi))) ":" (hspace 1) "PUA unicode, especially designs for ming-lang.")))
     ])
  )

(define-syntax (defzi/sub stx)
  (syntax-case stx ()
    [(_ zi content ...)
     (with-syntax ([str-zi (symbol->string (syntax-e #'zi))])
       #'(elem #:style (style #f (list (attributes '([style . "margin-bottom: 0; "]))))
               (elemtag str-zi (elem (bold (racket (code:hilite zi))) ":" (hspace 1) content ...))))
     ])
  )

(define-for-syntax (r-background-label label)
  `(elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabelInner"]))))
         ,label)
  )
(define-syntax (defzis stx)
  (define (zis-of-str stx-zis)
    (string-split (symbol->string (syntax-e stx-zis)) "/"))
  (define (gen-elemtag z)
    `(elemtag ,z (bold (racket (code:hilite ,(string->symbol z))))))
  (define (gen-elemtags zis)
    (datum->syntax  stx (cons 'elem (add-between (map gen-elemtag zis) "/"))))
  (syntax-case stx ()
    [(_ zis content ...)
     #`(elem #:style (style #f (list (alt-tag "p") (attributes '([class . "boxed"]))))
             #,(gen-elemtags (zis-of-str #'zis)) ":" (hspace 1) content ... #,(r-background-label "ideograph"))
     ])
  )

;; @(define (ttt)
;; (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "SIntrapara"]))))
;; (elem #:style (style #f (list (alt-tag "blockquote") (attributes '([class . "SVInsetFlow"]))))

;;          (elem #:style (style #f (list (alt-tag "table") (attributes '([class . "boxed RBoxed"]))))
;;                (elem #:style (style #f (list (alt-tag "tbody")))
;;                      (elem #:style (style #f (list (alt-tag "tr")))
;;                            (elem #:style (style #f (list (alt-tag "td")))
;;                                  (elem #:style (style #f (list (alt-tag "blockquote") (attributes '([class . "SubFlow"]))))
;;                                        (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabel SIEHidden"]))))
;;                                              (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabelInner"]))))
;;                                                    (elem #:style (style #f (list (alt-tag "p"))) "ideographsdfsdf")))
;;                                        (elem #:style (style #f (list (alt-tag "p") (attributes '([class . "RForeground"])))) "a" " : " "b"))))
;;                       (elem #:style (style #f (list (alt-tag "tr")))
;;                            (elem #:style (style #f (list (alt-tag "td")))
;;                                  "ssssss:   jjjjjj"))
;;          )
;;          )
;; ))
;; )
(define-syntax (defideogr stx)
  (syntax-case stx ()
    ;;;;;;;;;;;;;;;;;;;;;;;;
    [(_ (zis ...) (parts ...) meaning cnchar cnchar-meaning elaboration ...)
     (with-syntax ([(gen-elemtags ...)
                    (map (lambda (e)
                           #`(elemtag #,(symbol->string (syntax-e e))
                                      (elem (bold (racket (code:hilite #,e))) (hspace 1)
                                            (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabel SIEHidden"]))))
                                                  #,(r-background-label "ideographs"))))
                           )
                         (syntax->list #'(zis ...)))]
                   [p+p+p #`#,(cons 'elem (add-between (map (lambda (e) (if (list? e)
                                                                       (cons 'elem (add-between (map (lambda (ee) `(zi-ref ,(symbol->string ee)))e) " / "))
                                                                       `(zi-ref ,(symbol->string e)))) (syntax->datum #'(parts ...))) " + "))]
                   [(header ...) #'("connotation" "originates from" "originally means")]
                   [(content ...) #'(meaning (zi-tool cnchar) cnchar-meaning)])
       #`(elem
          (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "boxed"] [style . "margin-top: 2em; margin-bottom: 1em; "]))))
                gen-elemtags ...  " : " p+p+p
                (~@ (if content (elem (linebreak) (hspace 2) header " : " content) "")) ...)
          (elem elaboration ...)))]
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    [(_ z (parts ...) meaning cnchar cnchar-meaning elaboration ...)
     (with-syntax ([str-z (symbol->string (syntax-e #'z))]
                   [ppp #`#,(cons 'elem (add-between (map (lambda (e) `(zi-ref ,(symbol->string (syntax->datum e)))) (syntax->list #'(parts ...))) " + "))]
                   [(header ...) #'("connotation" "originates from" "originally means")]
                   [(content ...) #'(meaning (zi-tool cnchar) cnchar-meaning)])
       #`(elem
          (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "boxed"] [style . "margin-top: 2em; margin-bottom: 1em; "]))))
                (elemtag str-z (elem (bold (racket (code:hilite z))) " : " ppp))
                (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabel SIEHidden"])))) #,(r-background-label "ideograph"))
                (~@ (if content (elem (linebreak) (hspace 2) header " : " content) "")) ...)
          (elem elaboration ...)))]
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;
    [(_ (zis ...) meaning cnchar cnchar-meaning elaboration ...)
     (with-syntax ([(gen-elemtags ...)
                    (map (lambda (e)
                           #`(elemtag #,(symbol->string (syntax-e e))
                                      (elem (bold (racket (code:hilite #,e))) (hspace 1)
                                            ))
                           )
                         (syntax->list #'(zis ...)))]
                   [(header ...) #'("connotation" "originates from" "originally means")]
                   [(content ...) #'(meaning (zi-tool cnchar) cnchar-meaning)])
       #`(elem
          (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "boxed"] [style . "margin-top: 2em; margin-bottom: 1em; "]))))
                gen-elemtags ...
                (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabel SIEHidden"])))) #,(r-background-label "ideographs"))
                (~@ (if content (elem (linebreak) (hspace 2) header " : " content) "")) ...)
          (elem elaboration ...)))]
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    [(_ z meaning cnchar cnchar-meaning elaboration ...)
     (with-syntax ([str-z (symbol->string (syntax-e #'z))]
                   [(header ...) #'("connotation" "originates from" "originally means")]
                   [(content ...) #'(meaning (zi-tool cnchar) cnchar-meaning)])
       #`(elem
          (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "boxed"] [style . "margin-top: 2em; margin-bottom: 1em; "]))))
                (elemtag str-z (elem (bold (racket (code:hilite z)))))
                (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabel SIEHidden"])))) #,(r-background-label "ideograph"))
                (~@ (if content (elem (linebreak) (hspace 2) header " : " content) "")) ...)
          (elem elaboration ...)))]
    )
  )

(define-syntax (defzi stx)
  (syntax-case stx ()
    [(_ zi content ...)
     (with-syntax ([str-zi (symbol->string (syntax-e #'zi))])
       #`(elem  #:style (style #f (list (alt-tag "div") (attributes '([class . "boxed"] [style . "margin-top: 2em; margin-bottom: 1em; "]))))
                (elemtag str-zi (elem (bold (racket (code:hilite zi))) ":" (hspace 1) content ...
                                      (elem #:style (style #f (list (alt-tag "div") (attributes '([class . "RBackgroundLabel SIEHidden"]))))
                                            #,(r-background-label "ideograph"))
                                      ))))
     ])
  )

(define-syntax (defcompost stx) ;; define compostion
  (define (gen-parts ps)
    (datum->syntax stx (cons 'elem (add-between (map (lambda (p) `(zi ,p)) ps) " + "))))
  (syntax-case stx ()
    [(_ zi (parts ...) content ...)
     #`(defzi zi #,(gen-parts (syntax->datum #'(parts ...))) "." (hspace 1) content ...)
     ])
  )

(define-syntax (zi stx) ;; zi shorts for hanzi, means chinese char.
  (syntax-case stx ()
    [(_ z)
     (with-syntax ([str-z (symbol->string (syntax-e #'z))])
       #'(zi-ref str-z))
     ])
  )
(define (zi-ref c [c1 c]) ;; zi shorts for hanzi, means chinese char.
  (elem #:style (style #f (list (attributes '([style . "background:  #f5eef8; "])))) ; [class . "highlighted"]
        (elemref c (racketplainfont c1)))
  )

(define (section+autotag . content)
  (define tag (string-join content ""))
  (section #:tag tag content))

(define (stands-for . content)
  (elem "stands for" (hspace 1) @(elucidate content)))
(define (whstands-for . content)
  (elem "which stands for" (hspace 1) @(elucidate content)))

(define (same-as-cnchar-and cnchar ori-meaning standing)
  (elem "same as cnchar " @zi-tool[cnchar] ", which means " @elucidate{@ori-meaning} ", and especially "  @stands-for[@standing] " in Ming"))
(define (same-as-cnchar-but cnchar ori-meaning standing)
  (elem "same as cnchar " @zi-tool[cnchar] ", which means " @elucidate{@ori-meaning} ", but borrowed to "  @stands-for[@standing] " in Ming"))
(define (same-as-cnchar cnchar meaning)
  (elem "same as cnchar " (hspace 1) @zi-tool[cnchar] ", " @stands-for[@meaning] " in Ming"))

(define (simplified-from-cnchar-and cnchar ori-meaning meaning)
  (elem "simplified from cnchar " (hspace 1) @zi-tool[cnchar] ", which means " @elucidate{@ori-meaning} ", and especially " @stands-for[@meaning] " in Ming"))
(define (simplified-from-cnchar-but cnchar ori-meaning meaning)
  (elem "simplified from cnchar " (hspace 1) @zi-tool[cnchar] ", which means " @elucidate{@ori-meaning} ", but borrowed to " @stands-for[@meaning] " in Ming"))
(define (simplified-from-cnchar cnchar meaning)
  (elem "simplified from cnchar " (hspace 1) @zi-tool[cnchar] ", " @stands-for[@meaning] " in Ming"))


(define (eleph-note . content) ;; 像注, elephant in chinese is wrote as 象, and 像 means like
  (margin-note (elem "🐘" (hspace 1) content))) ;; 💡

(define (elucidate . content) ;; 释义
  (elem (italic content)))

(define (modernly-means elucidation . content)
  @elem{means @elucidate{@elucidation} in modern chinese. @content}
  )

(define (mingly-resembles zi elucidation . content)
  @elem{resembles @zi-ref[@zi], stands for @elucidate{@elucidation} in Ming. @content}
  )

(define (modernly-simplifies zi elucidation . content)
  @elem{simplified from @(litchar zi), which means @(elucidate elucidation) in modern chinese. @content}
  )

(define (anciently-simplifies zi elucidation ming-elu . content)
  @elem{simplified from @litchar{@zi} in ancient chinese, means @elucidate{@elucidation}, stands for @elucidate{@ming-elu} in Ming. @content}
  )

(define (ori-esp-means ori-elu esp-elu . content)
  @elem{originally means @elucidate{@ori-elu}, stands for @elucidate{@esp-elu} in Ming. @content}
  )

(define (simplf-from zi)
  @elem{simplified from @litchar{@zi}}
  )

(define-syntax (short-for-code stx)
  (syntax-case stx ()
    [(_ c ...)
     #'(elem "Shorts for " (code c ...))
     ])
  )
(define-syntax (short-for-racket stx)
  (syntax-case stx ()
    [(_ c ...)
     #'(elem "Shorts for " (racket c ...))
     ])
)
  ;; @elem{Shorts for @code{@rawcode}.})