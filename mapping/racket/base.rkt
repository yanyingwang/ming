#lang racket/base

(provide  mapping)
(require "../../private/mapping.rkt"
         (rename-in "base/others.rkt" [mapping mapping0])
         (rename-in "base/pairs-and-lists.rkt" [mapping mapping1])
         (rename-in "base/syntactic-forms.rkt" [mapping mapping2])
         (rename-in "base/syntactic-forms.rkt" [mapping mapping2])
         (rename-in "base/generic-numerics.rkt" [mapping mapping3])
         (rename-in "base/number-types.rkt" [mapping mapping4])
        )


(define (mapping #:scribble? [scribble? #f])
  (append (mapping0 #:scribble? scribble?)
          (mapping1 #:scribble? scribble?)
          (mapping2 #:scribble? scribble?)
          (mapping3 #:scribble? scribble?)
          (mapping4 #:scribble? scribble?)))

#| usage:
(require "mapping/racket/base.rkt")
(define-syntax (checkit stx) #`(println #,(mapping #:scribble? #t)))
(checkit)

check below link for the phases and bindings.
"A syntax object has a lexical context from the moment it first exists. A syntax object that is provided from a module retains its lexical context, and so it references bindings in the context of its source module, not the context of its use.
"
https://docs.racket-lang.org/guide/phases.html#%28part._.Phases_and_.Bindings%29
|#

