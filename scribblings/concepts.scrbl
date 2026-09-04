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

@verbatim{
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
}


e.g.
@verbatim{
@zi[􏴫]
├── semantic concept: sectionalization
└── naming rule: output consists of two sections
}


@section{Terminology}
@itemlist[
@mtem["Ideograph"]{A character used in Ming as an semantic or structural unit of programming-language notation.
@verbatim{
Ideograph
│
┌──────────────────┼──────────────────┐
│                  │                  │
↓                  ↓                  ↓
Semantic          Naming Rule       Structural /
Ideograph           Ideograph         Morphology
│                  │                  │
│                  │                  ├── Position
│                  │                  ├── Extent
│                  │                  ├── Word position
│                  │                  └── Rotation
│                  │
│                  ├── Type relation
│                  ├── Input constraint
│                  ├── Output constraint
│                  └── Cardinality constraint
│
├── Data concept
├── Operation concept
├── Representation concept
└── Structural concept
}
}
@mtem["Semantic Ideograph"]{
An ideograph that represents a programming concept or semantic operation.
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
@mtem["Naming Rule"]{
A rule represented by an ideograph that @emph{explicitly constrains} or determines the input, output, or structural relationship of a procedure according to its position or composition within a procedure name, e.g. @zis[亻 阝].

@verbatim{
@zi[亻]
Role:
  naming-rule

Rule:
  output data has the same type as input data;
  output elements are derived from / belong to the input data.

Default type:
  list

Type override:
  determined by a type-prefix ideograph


For example, @zi[伄] = @zi[亻] + @zi[弔]. Among them:

亻 → explicit constraint
弔 → semantic concept
}
}
@mtem["Type Prefix"]{
An ideograph placed before a procedure name as a word-level prefix to determine or override the data type referred to by a naming rule.

e.g. where @zi[􏿴](list) is put first in @racket[􏿴伄], and @zi[􏿲](vector) in @racket[􏿲伄], are both type prefix.(Since @zi[伄] specifies @tt{T → T}, @zi[􏿴] and @zi[􏿲] as the type prefixes here have made the @tt{T} be @tt{list} and @tt{vector}.)
}

@mtem["default type context"]{
The implicit data type supplied when a naming rule is used without an explicit type prefix.

e.g. since @zi[亻]'s default type is @zi[􏿴](list), @litchar{伄} can be seen as the abbreviated form of @litchar{􏿴伄}.
}
@mtem["Semantic Implication"]{
A type, structural, or behavioral property that can be inferred from the semantic meaning of an ideograph, rather than being explicitly declared as a naming rule.

e.g. @zi[弔] only means @emph{indexed reference}, but when it is used in procedure @racket[弔], we have:
@verbatim{
input 1 = list
input 2 = number
output = element
}
those input and output types are derived from its semantic concept. The way how we derived those types are called @tech{semantic implication}.

@verbatim{
@zi[伄]:
亻→ explicit rule
弔 → semantic implication
}
}
]
