#lang racket/base

(provide exclude-text)

(define (exclude-text mapping)
  (map (lambda (e)
         (list (car e) (cadr e)))
       mapping)
  )
