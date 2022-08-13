#lang racket/base

(provide mapping)

(require "../private/mapping.rkt"
         (rename-in "racket/base.rkt" [mapping mapping1])
         (rename-in "racket/list.rkt" [mapping mapping2])
         (rename-in "racket/math.rkt" [mapping mapping3])) ;; TODO: should be enh to racket/*.rkt

(define (mapping #:scribble? [scribble? #f])
  (append (mapping1 #:scribble? scribble?)
          (mapping2 #:scribble? scribble?)
          (mapping3 #:scribble? scribble?)))


