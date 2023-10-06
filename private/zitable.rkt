#lang racket/base

(provide zitable get-zis)
(require (rename-in "../mapping/racket/hash.rkt" [mapping mapping/racket/hash])
         (rename-in "../mapping/racket/keyword.rkt" [mapping mapping/racket/keyword])
         (rename-in "../mapping/racket/list.rkt" [mapping mapping/racket/list])
         (rename-in "../mapping/racket/math.rkt" [mapping mapping/racket/math])
         (rename-in "../mapping/racket/string.rkt" [mapping mapping/racket/string])
         (rename-in "../mapping/racket/symbol.rkt" [mapping mapping/racket/symbol])
         (rename-in "../mapping/racket/bool.rkt" [mapping mapping/racket/bool])
         (rename-in "../mapping/racket/function.rkt" [mapping mapping/racket/function])
         (rename-in "../mapping/racket/vector.rkt" [mapping mapping/racket/vector])

         (rename-in "../mapping/racket/base.rkt" [mapping mapping/racket/base])
         (rename-in "../mapping/racket/base/box.rkt" [mapping mapping/racket/base/box])
         (rename-in "../mapping/racket/base/characters.rkt" [mapping mapping/racket/base/characters])
         (rename-in "../mapping/racket/base/generic-numerics.rkt" [mapping mapping/racket/base/generic-numerics])
         (rename-in "../mapping/racket/base/hash.rkt" [mapping mapping/racket/base/hash])
         (rename-in "../mapping/racket/base/keywords.rkt" [mapping mapping/racket/base/keywords])
         (rename-in "../mapping/racket/base/number-types.rkt" [mapping mapping/racket/base/number-types])
         (rename-in "../mapping/racket/base/others.rkt" [mapping mapping/racket/base/others])
         (rename-in "../mapping/racket/base/pairs-and-lists.rkt" [mapping mapping/racket/base/pairs-and-lists])
         (rename-in "../mapping/racket/base/procedures.rkt" [mapping mapping/racket/base/procedures])
         (rename-in "../mapping/racket/base/string.rkt" [mapping mapping/racket/base/string])
         (rename-in "../mapping/racket/base/symbols.rkt" [mapping mapping/racket/base/symbols])
         (rename-in "../mapping/racket/base/syntactic-forms.rkt" [mapping mapping/racket/base/syntactic-forms])
         (rename-in "../mapping/racket/base/conditionals.rkt" [mapping mapping/racket/base/conditionals])
         (rename-in "../mapping/racket/base/values.rkt" [mapping mapping/racket/base/values])
         (rename-in "../mapping/racket/base/syntax.rkt" [mapping mapping/racket/base/syntax])
         (rename-in "../mapping/racket/base/vector.rkt" [mapping mapping/racket/base/vector])
         )

(define zitable
    (hash 'racket/hash mapping/racket/hash
          'racket/keyword mapping/racket/keyword
          'racket/list mapping/racket/list
          'racket/math mapping/racket/math
          'racket/string mapping/racket/string
          'racket/symbol mapping/racket/symbol
          'racket/bool mapping/racket/bool
          'racket/function mapping/racket/function
          'racket/vector mapping/racket/vector
          'racket/base mapping/racket/base
          'racket/base/box mapping/racket/base/box
          'racket/base/characters mapping/racket/base/characters
          'racket/base/generic-numerics mapping/racket/base/generic-numerics
          'racket/base/hash mapping/racket/base/hash
          'racket/base/keywords mapping/racket/base/keywords
          'racket/base/number-types mapping/racket/base/number-types
          'racket/base/others mapping/racket/base/others
          'racket/base/pairs-and-lists mapping/racket/base/pairs-and-lists
          'racket/base/procedures mapping/racket/base/procedures
          'racket/base/string mapping/racket/base/string
          'racket/base/symbols mapping/racket/base/symbols
          'racket/base/syntactic-forms mapping/racket/base/syntactic-forms
          'racket/base/conditionals mapping/racket/base/conditionals
          'racket/base/values mapping/racket/base/values
          'racket/base/syntax mapping/racket/base/syntax
          'racket/base/vector mapping/racket/base/vector
          ))

(define (get-zis path)
  (hash-ref zitable path))
