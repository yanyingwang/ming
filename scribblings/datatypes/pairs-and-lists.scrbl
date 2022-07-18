#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*


@title[#:tag "pairs-and-lists"]{对和链}
@declare-exporting[ming]

@defthing[对 cons]
@defthing[对? pair?]

@defthing[链 list]

@defthing[阳 car]
@defthing[阴 cdr]
@defthing[阴之阳 cadr]

@defthing[甲 first]
@defthing[乙 second]


