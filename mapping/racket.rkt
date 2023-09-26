#lang racket/base

(provide mapping)
(require (rename-in "racket/base.rkt" [mapping mapping1])
         (rename-in "racket/hash.rkt" [mapping mapping2])
         (rename-in "racket/keyword.rkt" [mapping mapping3])
         (rename-in "racket/list.rkt" [mapping mapping4])
         (rename-in "racket/math.rkt" [mapping mapping5])
         (rename-in "racket/string.rkt" [mapping mapping6])
         (rename-in "racket/symbol.rkt" [mapping mapping7])
         (rename-in "racket/bool.rkt" [mapping mapping8])
         (rename-in "racket/function.rkt" [mapping mapping9])
         (rename-in "racket/vector.rkt" [mapping mapping10])
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
          ))


;; TODO: fix racket and racket/base combines of ming mapping
;; racket/base
;; racket/bool
;; racket/bytes
;; racket/class
;; racket/cmdline
;; racket/contract
;; racket/dict
;; racket/file
;; racket/format
;; racket/function
;; racket/future
;; racket/include
;; racket/list
;; racket/local
;; racket/match
;; racket/math
;; racket/path
;; racket/place
;; racket/port
;; racket/pretty
;; racket/promise
;; racket/sequence
;; racket/set
;; racket/shared
;; racket/stream
;; racket/string
;; racket/system
;; racket/tcp
;; racket/udp
;; racket/unit
;; racket/vector
;;;;;;;;
;; racket/base
;; racket/base
;; racket/bool
;; racket/bytes
;; racket/class
;; racket/cmdline
;; racket/contract
;; racket/dict
;; racket/file
;; racket/format
;; racket/function
;; racket/future
;; racket/include
;; racket/list
;; racket/local
;; racket/match
;; racket/math
;; racket/path
;; racket/place
;; racket/port
;; racket/pretty
;; racket/promise
;; racket/sequence
;; racket/set
;; racket/shared
;; racket/stream
;; racket/string
;; racket/system
;; racket/tcp
;; racket/udp
;; racket/unit
;; racket/vector
