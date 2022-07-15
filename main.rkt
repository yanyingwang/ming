
#lang racket/base

;; (provide (all-from-out racket/base))



(module reader racket/base

  (require racket/trace
           syntax/strip-context
           racket/port)

  (provide (rename-out [ming-read read]
                       [ming-read-syntax read-syntax]))


  (define (ming-read in)
    (syntax->datum
     (ming-read-syntax #f in)))

  (define (ming-read-syntax src in)
    (with-syntax ([ori-codes (read in)])
      #`(module anything racket/base
          ;; (define a "aaaa")
          ;; (require "private/base.rkt")
          ori-codes
          ))

    #;(with-syntax ([ori-codes (port->string in)])
      #`(module anything racket/base
          (provide data)
          (define data 'str)
          (displayln data)
          ))
    )
  )
