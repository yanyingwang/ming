#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           scribble-rainbow-delimiters
          )
@script/rainbow-delimiters*

@(define the-eval
         (make-eval-factory '(ming)))


@title[#:tag "syntactic-forms"]{语法形式}
@declare-exporting[ming]
@defmodule[ming/racket/base]
@defmapping[racket/base/syntactic-forms]
