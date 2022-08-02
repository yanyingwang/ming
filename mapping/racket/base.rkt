#lang racket/base

(provide mapping)
(require (rename-in "base/others.rkt" [mapping mapping0])
         (rename-in "base/pairs-and-lists.rkt" [mapping mapping1])
         (rename-in "base/syntactic-forms.rkt" [mapping mapping2]))

(define (mapping)
  (append (mapping0) (mapping1) (mapping2)))
