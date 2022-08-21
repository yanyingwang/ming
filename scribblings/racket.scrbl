#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )

@title[#:style '(toc) #:tag "racket library in chinese"]{Racket汉化库}


@defmodule[ming/racket/base]
Racket库的名语言汉化，汉化了的Racket内部库程序应都置于此。


@(table-of-contents)

@include-section["racket/numbers.scrbl"]
@include-section["racket/pairs-and-lists.scrbl"]
@include-section["racket/string.scrbl"]
@include-section["racket/syntax.scrbl"]
@include-section["racket/syntactic-forms.scrbl"]
@include-section["racket/others.scrbl"]
