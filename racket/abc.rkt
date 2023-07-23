#lang racket

(provide abc)
(require racket/stxparam)
;(require racket/stxparam-exptime)

(define-syntax-parameter abc "abccccccccc1")
;(begin-for-syntax (displayln (syntax-parameter-value #'abc)))

