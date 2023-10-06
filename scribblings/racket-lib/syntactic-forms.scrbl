#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list ming/racket/vector ming/list)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "syntactic-forms"]{syntactic forms}
@defmapping[racket/base/syntactic-forms]
