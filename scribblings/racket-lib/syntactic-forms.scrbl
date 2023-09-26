#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           scribble-rainbow-delimiters
          )

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@script/rainbow-delimiters*

@(define the-eval
         (make-eval-factory '(ming)))


@title[#:tag "syntactic-forms"]{语法形式}
@defmapping[racket/base/syntactic-forms]
