#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           (for-syntax racket/base
                       syntax/parse)
           )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*



@title[#:tag "at-first-glance"]{一览}
@declare-exporting[ming]



以中国古代春秋战国时期，名家提出的辩题@hyperlink["https://zh.wikipedia.org/wiki/%E7%99%BD%E9%A9%AC%E9%9D%9E%E9%A9%AC" "《白马非马》"]，代码可以演示为：
@examples[#:eval (the-eval)
(require ming/base)

(名 马 (链 "白马" "黑马" "黄马"))
(名 白马 "白马")
(若 (相等? 马 白马)
    (陈 (化 "~v是~v" 白马 马))
    (陈 (化 "~v非~v" 白马 马)))
]

