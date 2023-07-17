#lang racket/base

(provide mapping-files
         mapping-files-racket/base
         mapping-files-racket
         mapping-files-ming)


(define mapping-files-racket
  '("/racket/base.rkt"
    "/racket/hash.rkt"
    "/racket/keyword.rkt"
    "/racket/list.rkt"
    "/racket/math.rkt"
    "/racket/string.rkt"
    "/racket/symbol.rkt"
    "/racket/vector.rkt"
    "/racket.rkt")
  )

(define mapping-files-racket/base
  '(
    "/racket/base/box.rkt"
    "/racket/base/characters.rkt"
    "/racket/base/generic-numerics.rkt"
    "/racket/base/hash.rkt"
    "/racket/base/keywords.rkt"
    "/racket/base/number-types.rkt"
    "/racket/base/others.rkt"
    "/racket/base/pairs-and-lists.rkt"
    "/racket/base/procedures.rkt"
    "/racket/base/string.rkt"
    "/racket/base/symbols.rkt"
    "/racket/base/syntactic-forms.rkt"
    "/racket/base/syntax.rkt"
    "/racket/base/vector.rkt"
    )
  )


(define mapping-files-ming
  '("/ming/core.rkt")
  )


;; all rkt files in mapping dir
(define mapping-files
  (append mapping-files-ming mapping-files-racket mapping-files-racket/base)
  )

