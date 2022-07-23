#lang racket/base

;; (provide (all-from-out racket/base))

(require (file "base.rkt")
         (file "list.rkt"))
(provide (all-from-out (file "base.rkt")
                       (file "list.rkt"))
         )



(module reader racket/base
  (require racket/string
           syntax/strip-context
           racket/port)

  (provide (rename-out [ming-read read]
                       [ming-read-syntax read-syntax]))


  (define (ming-read in)
    (syntax->datum
     (ming-read-syntax #f in)))

  (define (ming-read-syntax src in)
    (define codes (let loop ([lst (read in)]
                             [result '()])
                    (if (eof-object? lst)
                        result
                        (loop (read in)
                              (append result (list lst))))))
    #`(module anything racket
        (require ming/base)
        #,@codes
        )
    )
  )
