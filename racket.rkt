#lang racket/base


(require (for-syntax racket/base racket/provide-transform
                     "mapping/racket.rkt")
         racket/hash racket/keyword racket/symbol
         racket
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
         )

(define-syntax rename-out-mapping
  (make-provide-pre-transformer
   (lambda (stx modes)
     (syntax-case stx ()
       [(_)
        (pre-expand-export
         (begin (datum->syntax stx `(rename-out  ,@(mapping) )))
         modes)
        ])))
  )

(provide (rename-out-mapping))
