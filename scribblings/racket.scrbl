#lang scribble/manual


@title[#:tag "racket"]{Racket汉化库}
@declare-exporting[ming]
Racket库的名语言汉化，汉化了的Racket内部库程序应都置于此。

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters)

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*


@include-section["racket/base.scrbl"]
@; @include-section["racket/list.scrbl"]

