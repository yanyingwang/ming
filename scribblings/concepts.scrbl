#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector)
           scribble/example
           scribble-rainbow-delimiters
           ming/scribble)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/list ming/racket/base ming/racket/list)))


@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "concepts"]{Concepts}

@section{Morphology}
The most prominent feature of Ming is the terminology we called morphology.

@codeblock|{
Ming lexical morphology
│
├── Ideograph
│   │
│   ├── Semantic Ideograph
│   │
│   ├── Naming-rule Ideograph
│   │
│   ├── Type Ideograph
│   │
│   └── Modifier / Structural Ideograph
│
├── Composition
│
└── Positional / morphological operators
}|


@codeblock|{
@zi[􏴫]
├── semantic concept: sectionalization
└── naming rule: output consists of two sections
}|


@section{Terminology}
@itemlist[
@item{@deftech{Ideograph}: A character used in Ming as a semantic or structural unit of programming-language notation.}
@item{@deftech{Semantic Ideograph}: An ideograph that represents a programming concept or semantic operation.

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
(list
(list @bold{Semantic Ideograph in Ming} @bold{Corresponding English concept in Racket})
(list @zi[弓] "index")
(list @zi[弔] "indexed reference")
(list @zi[彐] "find")
(list @zi[毌] "append")
(list @zi[並] "multiple values")
(list @zi[双] "pair")
(list @zi[􏿴] "list")
(list @zi[􏿰] "hash")
(list @zi[㐅] "null")
(list @zi[句] "string")
)]
}
@item{@deftech{Naming Rule}: A rule represented by an ideograph that explicitly constrains or determines the input, output, or structural relationship of a procedure according to its position or composition within a procedure name. e.g., @zis[亻 阝]
}
@item{@deftech{Type Prefix}: An ideograph placed before a procedure name as a word-level prefix to determine or override the data type referred to by a naming rule. e.g., @zi[􏿴] in @racket[􏿴伄], @zi[􏿲] in @racket[􏿲伄].}
@item{@deftech{default type context}:The implicit data type supplied when a naming rule is used without an explicit type prefix. e.g., the default type of @zi[亻] is list, thus @zi[伄] is the abbreviated form of @zi[􏿴伄].
}
@item{@deftech{Semantic Implication}: }
]