#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval ming/scribble
           scribble-rainbow-delimiters)

@(define the-eval
         (make-eval-factory '(ming/racket/base)))

@script/rainbow-delimiters*

@title[#:tag "racket/base/others"]{其它}
@defmapping[racket/base/others
([陈 "在屏幕上输出...的内容。"]
[行陈 "在屏幕上输出一行...的内容。"]
)]
