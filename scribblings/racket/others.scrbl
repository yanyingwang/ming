#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval ming/scribble
           scribble-rainbow-delimiters)

@(define the-eval
         (make-eval-factory '(ming/racket/base)))

@script/rainbow-delimiters*

@title[#:tag "racket/base/others"]{其它}
@; @declare-exporting[ming/racket/base]
@defmapping[racket/base/others]
