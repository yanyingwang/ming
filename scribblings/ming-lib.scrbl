#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )

@(require (file "../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font

@title[#:style '(toc) #:tag "ming libs"]{名语言标准库}

@(table-of-contents)

@include-section["ming-lib/core.scrbl"]
@include-section["ming-lib/list.scrbl"]
