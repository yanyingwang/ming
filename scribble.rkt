#lang racket/base

(provide defmapping)
(require racket/dict)

(define (defmapping mapping-data namespace-anchor)
  (define ns (namespace-anchor->namespace namespace-anchor))
  (for/list ([(k v) (in-dict (mapping-data))])
    (eval `(defthing ,(car v) ,k) ns)
))
