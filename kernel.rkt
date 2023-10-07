#lang racket/base

(provide 􏸧 􏸬 􏸫 􏸪
         (all-from-out "conditionals.rkt")
         (all-from-out "values.rkt")
         )

(require "racket/base.rkt"
         "conditionals.rkt"
         "values.rkt")

(define-syntax 􏸧
  (syntax-rules ()
    [(_ exprs ...)
     (λ () exprs ...)]))

(define-syntax 􏸬
  (syntax-rules ()
    [(_ arg1 exprs ...)
     (λ (arg1) exprs ...)]))

(define-syntax 􏸫
  (syntax-rules ()
    [(_ arg1 arg2 exprs ...)
     (λ (arg1 arg2) exprs ...)]))

(define-syntax 􏸪
  (syntax-rules ()
    [(_ arg1 arg2 arg3 exprs ...)
     (λ (arg1 arg2 arg3) exprs ...)]))


