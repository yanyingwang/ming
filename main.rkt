#lang racket/base


(provide (all-from-out "racket.rkt"))
(require "racket.rkt")


(module reader racket/base ;; TODO: refactor it with syntax/module-reader
  (require racket/list)
  (provide (rename-out [ming-read read]
                       [ming-read-syntax read-syntax]))


  (define (ming-read in)
    (syntax->datum
     (ming-read-syntax #f in)))

  (define (ming-read-syntax src in)
    (define module-name (string->symbol (path->string (path-replace-extension (last (explode-path "/home/yanying/tmp.rkt")) ""))))
    (define module-codes (let loop ([lst (read in)]
                             [result '()])
                    (if (eof-object? lst)
                        result
                        (loop (read in)
                              (append result (list lst))))))
    #`(module #,module-name racket
        (require ming/core ming/racket)
        #,@module-codes
        )
    )
  )
