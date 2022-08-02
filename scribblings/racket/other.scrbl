#lang scribble/manual


@title[#:tag "racket/base"]{racket/base库}
@declare-exporting[ming]


@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters)

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*


@defthing[相等? equal?]
