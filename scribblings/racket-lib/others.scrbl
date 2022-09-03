

#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval ming/scribble
           scribble-rainbow-delimiters)

@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))

@script/rainbow-delimiters*


@examples[#:eval (the-eval)
(遍 ([i (一段数 1 5)])
      (行陈 i))
]


@title[#:tag "racket/base/others"]{未分类}
@defmapping[racket/base/others
([陈 "在屏幕上输出...的内容。"]
[行陈 "在屏幕上输出一行...的内容。"]
)]
