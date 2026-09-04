#lang scribble/manual


@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts


@title[#:style '(toc)]{Ming Language}
@author[(author+email (hyperlink "https://yanying.wang" "Yanying Wang") "yanyingwang1@gmail.com")]

@defmodule[ming #:lang]
Ming — a programming language where ideographic composition becomes semantic composition.
@hspace[1]
@smaller{@hyperlink["https://www.yanying.wang/ming-doc-zh-cn/" "(中文版)"]}


Ming is a programming language inspired by the semantic and compositional nature of Chinese ideographs, in which the structure of an ideograph serves not merely as a name, but as a compact representation of the constraints and relationships inherent in an operation.

@(table-of-contents)

@include-section["rationale.scrbl"]
@include-section["concepts.scrbl"]
@include-section["startup.scrbl"]
@; @include-section["naming-rules.scrbl"]
@include-section["general-ideographs.scrbl"]
@include-section["ming-lib.scrbl"]
@include-section["racket-lib.scrbl"]
@include-section["appendix.scrbl"]

@index-section[]
