#lang scribble/manual


@title[#:tag "datatypes"]{数据结构}
@declare-exporting[ming]


@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters)

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*


@include-section["pairs-and-lists.scrbl"]


@defthing[相等? equal?]