#lang scribble/manual

@(require (file "../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font

@title[#:style '(toc)]{名语言/Ming-Language}
@author[(author+email (hyperlink "https://yanying.wang" "Yanying Wang") "yanyingwang1@gmail.com")]

@defmodule[ming #:lang]
名语言，LISP的中文化方言，Racket的中文化编程语言。

@(table-of-contents)

@include-section["preface.scrbl"]
@include-section["first-contact.scrbl"]
@include-section["prepare.scrbl"]
@include-section["naming-rules.scrbl"]
@include-section["ming-lib.scrbl"]
@include-section["racket-lib.scrbl"]
@include-section["appendix.scrbl"]

@index-section[]
