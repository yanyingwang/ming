#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "symbols"]{勺}


@section+elemref{勺}
“勺”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "symbols"]）。

@margin-note{
@bold{@litchar{勺}为古活字}
@itemlist[
@item{@litchar{勹}：工厂、容器、外壳；}
@item{@litchar{一}：数据内容；}
@item{@litchar{勺}：因为外形和@racket[勾]、@racket[句]相近，在此借用为表示@racket[勺]是和它们相近的一种数据结构；}
]
}

@section[#:tag "symbols-base"]{例程}
@defmapping[
racket/base/symbols
]
