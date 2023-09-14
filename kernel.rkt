#lang racket/base

(provide 􏸧 􏸬 􏸫 􏸪)
(require "racket/base.rkt")

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
