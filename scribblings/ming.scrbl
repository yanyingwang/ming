#lang scribble/manual


@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts


@title[#:style '(toc)]{Ming Language}
@author[(author+email (hyperlink "https://yanying.wang" "Yanying Wang") "yanyingwang1@gmail.com")]

@defmodule[ming #:lang]
Ideographic LISP dialect, Lisp spirit embodied in chineseoid characters. @hspace[1] @smaller{@hyperlink["https://www.yanying.wang/ming-doc-zh-cn/" "(中文版)"]}

@(table-of-contents)

@include-section["rationale.scrbl"]
@include-section["startup.scrbl"]
@; @include-section["naming-rules.scrbl"]
@include-section["general-ideographs.scrbl"]
@include-section["ming-lib.scrbl"]
@include-section["racket-lib.scrbl"]
@include-section["appendix.scrbl"]

@index-section[]
