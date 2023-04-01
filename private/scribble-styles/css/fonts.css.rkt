#lang racket/base

(require scribble/core
         scribble/base
         scribble/html-properties
         racket/runtime-path)
(provide css/wenquan-extend-font)

(define-runtime-path source-han-sans-cnx.css "source-han-sans-cnx.css")
(define-runtime-path fonts.css "fonts.css")

(define css/wenquan-extend-font
  (elem #:style (make-style #f
                            (list (make-css-addition source-han-sans-cnx.css)
                                  (make-css-addition fonts.css)))))
