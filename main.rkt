
#lang racket/base

;; (provide (all-from-out racket/base))

(require (file "base.rkt")
         (file "list.rkt")
         syntax/parse)
(provide (all-from-out (file "base.rkt")
                       (file "list.rkt"))
         )






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
          (require "private/base.rkt")
          (名 马 "马")
          (名 白马 "白马")

          (若 (相同? 马 白马)
              (行陈 "白马是马")
              (行陈 "白马非马"))
          ))

    #;(with-syntax ([ori-codes (port->string in)])
      #`(module anything racket/base
          (provide data)
          (define data 'str)
          (displayln data)
          ))
    )
  )
