

#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval ming/scribble)

@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
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

@section+elemref{同?、􏾗?、􏾃?、侗?}
@margin-note{
@bold{@litchar{􏾗}为新造字} @linebreak{}
@bold{@litchar{􏾃}为新造字} @linebreak{}
@bold{@litchar{侗}为活用字} @linebreak{}
@itemlist[
@item{偏旁@litchar{古}：表示“稳固的、不变的”（见@racket[固?]）；}
@item{偏旁@litchar{舌}：中@litchar{丿}表示“复合数据”（list/struct等）；}
@item{偏旁@litchar{亻}：表示“实体上一样”。}
]
}
@examples[#:eval (the-eval)
(􏾗? (make-string 3 #\z) (make-string 3 #\z))
(􏾗? (list 1 2) (list 1 2))
(􏾗? (expt 2 100) (expt 2 100))
]
@examples[#:eval (the-eval)
(􏾃? (make-string 3 #\z) (make-string 3 #\z))
(􏾃? (list 1 2) (list 1 2))
(􏾃? (expt 2 100) (expt 2 100))
]
@examples[#:eval (the-eval)
(侗? (make-string 3 #\z) (make-string 3 #\z))
(侗? (list 1 2) (list 1 2))
(侗? (expt 2 100) (expt 2 100))
]
@examples[#:eval (the-eval)
(同? (make-string 3 #\z) (make-string 3 #\z))
(同? (list 1 2) (list 1 2))
(同? (expt 2 100) (expt 2 100))
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
