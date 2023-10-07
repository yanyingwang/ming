#lang racket/base

(provide mapping)
(require (rename-in "base/box.rkt" [mapping mapping1])
         (rename-in "base/characters.rkt" [mapping mapping2])
         (rename-in "base/generic-numerics.rkt" [mapping mapping3])
         (rename-in "base/hash.rkt" [mapping mapping4])
         (rename-in "base/keywords.rkt" [mapping mapping5])
         (rename-in "base/number-types.rkt" [mapping mapping6])
         (rename-in "base/others.rkt" [mapping mapping7])
         (rename-in "base/pairs-and-lists.rkt" [mapping mapping8])
         (rename-in "base/procedures.rkt" [mapping mapping9])
         (rename-in "base/string.rkt" [mapping mapping10])
         (rename-in "base/symbols.rkt" [mapping mapping11])
         (rename-in "base/syntactic-forms.rkt" [mapping mapping12])
         (rename-in "base/syntax.rkt" [mapping mapping13])
         (rename-in "base/vector.rkt" [mapping mapping14])
         (rename-in "base/conditionals.rkt" [mapping mapping15])
         (rename-in "base/values.rkt" [mapping mapping16])
         ;; (rename-in "base/function.rkt" [mapping mapping17])
         ;; (rename-in "base/function.rkt" [mapping mapping18])
         ;; (rename-in "base/function.rkt" [mapping mapping19])
         ;; (rename-in "base/function.rkt" [mapping mapping20])
         ;; (rename-in "base/function.rkt" [mapping mapping21])
         ;; (rename-in "base/function.rkt" [mapping mapping22])
         )


(define mapping
  (append mapping1
          mapping2
          mapping3
          mapping4
          mapping5
          mapping6
          mapping7
          mapping8
          mapping9
          mapping10
          mapping11
          mapping12
          mapping13
          mapping14
          mapping15
          mapping16
          ;; mapping17
          ;; mapping18
          ;; mapping19
          ;; mapping20
          ;; mapping21
          ;; mapping22
          ))
