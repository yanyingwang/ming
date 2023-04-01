#lang info
(define collection "ming")
(define deps '("base" "scribble-lib" "at-exp-lib"))
(define build-deps '("sandbox-lib" "scribble-doc" "scribble-lib" "racket-doc" "rackunit-lib" "scribble-rainbow-delimiters"))
(define scribblings '(("scribblings/ming.scrbl" (multi-page))))
(define pkg-desc "名语言，中文化的LISP编程语言。")
(define version "0.1")
(define pkg-authors '("Yanying Wang"))
(define license '("Apache-2.0"))
