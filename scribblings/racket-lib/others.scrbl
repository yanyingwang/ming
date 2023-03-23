

#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval ming/scribble)

@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))


@(require (file "../../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "racket/base/others"]{未分类}

@; @section+elemref{同?、􏾱?、􏾰?、􏾯?}
@; @margin-note{
@; @bold{@litchar{􏾱}、@litchar{􏾰}、@litchar{􏾯}为新造字}
@; @linebreak{}
@; 增加的偏旁分别表示：
@; @itemlist[
@; @item{@litchar{勿}偏旁是“@litchar{易}”偏旁的简写；}
@; @item{@litchar{易}偏旁意思是“可变的，易变的”的意思，即是@racket[坚?]的反意；}
@; @item{@litchar{𠂉}偏旁取自“@litchar{复}”的起首偏旁，是“复合”的意思，即表示“所有复合结构的数据”；}
@; @item{@litchar{米}偏旁取自“@litchar{数}字的起首偏旁，有@racket[数?]的意思；}
@; ]
@; }

@section+elemref{且、或}
@examples[#:eval (the-eval)
(且 3 2)
(或 3 2)
(且 (< 2 5) (> 2 0))
(或 (< 2 5) (> 2 0))
]

@section+elemref{同?、􏾬?、粡?、侗?}
@margin-note{
@bold{@litchar{􏾬}为新造字}
@itemlist[
@item{偏旁@litchar{彡}，是为“易”的意思，即“坚”（@racket[坚?]）的反义；}
@item{整体上是对@litchar{同}字增加了偏旁@litchar{彡}，即表示本例程在效果上是和@racket[同?]类似的，另外更有@racket[坚?]的作用。}
]

@bold{@litchar{侗}为活用字}
@itemlist[
@item{@litchar{侗}在@litchar{同}的基础上增加了偏旁@litchar{亻}，意思是“实体上一样”。}
]
@; @bold{@litchar{􏾪}为新造字}
@; @itemlist[
@; @item{其字的偏旁@litchar{米}是“数”（@racket[数?]）的意思；}
@; @item{其字整体上是对@litchar{侗}字增加了偏旁@litchar{米}，即表示本例程在效果上是和@racket[侗?]类似的，另在@racket[数?]的地方表现不同。}
@; ]
@bold{@litchar{粡}为活古字}
@itemlist[
@item{偏旁@litchar{米}是“数”（@racket[数?]）的意思；}
@item{整体上是对@litchar{侗}字修改了偏旁@litchar{米}，即表示本例程在效果上是和@racket[侗?]类似的，另在@racket[数?]的地方表现不同。}
]
@; @bold{““@litchar{狪}”为活用字}
@; @itemlist[
@; @item{@litchar{狪}在@litchar{同}的基础上增加了偏旁@litchar{犭}，意思是“@racket[狪?]在使用效果上相当于退化了的@racket[同?]”。}
@; ]
}

@examples[#:eval (the-eval)
(同? (expt 2 100) (expt 2 100))
(同? (list 1 2) (list 1 2))
(同? (make-string 3 #\z) (make-string 3 #\z))

(􏾬? (expt 2 100) (expt 2 100))
(􏾬? (list 1 2) (list 1 2))
(􏾬? (make-string 3 #\z) (make-string 3 #\z))

(粡? (expt 2 100) (expt 2 100))
(粡? (list 1 2) (list 1 2))
(粡? (make-string 3 #\z) (make-string 3 #\z))

(侗? (expt 2 100) (expt 2 100))
(侗? (list 1 2) (list 1 2))
(侗? (make-string 3 #\z) (make-string 3 #\z))
]

@section+elemref{遍?}
@examples[#:eval (the-eval)
(遍 ([i (􏿴/数段* 1 5)])
      (行陈 i))
]

@defmapping[racket/base/others
([陈 "在屏幕上输出...的内容。"]
[行陈 "在屏幕上输出一行...的内容。"]
)]
