#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
          )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*


@title[#:tag "syntactic-forms"]{语法形式}
@declare-exporting[ming]



@defthing[lambda 道]
@defthing[名 define]

@defthing[且 and]
@defthing[或 or]
@defthing[若 if]
@defthing[倘 case]
@defthing[当 cond]
@defthing[否则 else]




@defthing[陈 display]
@defthing[行陈 displayln]
@defthing[化 format]
