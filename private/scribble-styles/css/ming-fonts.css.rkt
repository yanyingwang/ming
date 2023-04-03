#lang racket/base

(require scribble/core
         scribble/base
         scribble/html-properties
         racket/runtime-path)
(provide css/ming-fonts)

;; (define-runtime-path source-han-sans-cnx.css "source-han-sans-cnx.css")
;; (define-runtime-path source-han-sans-cnx.css "source-han-sans-cn.css")
;; (define-runtime-path source-han-sans-cnx.css "source-han-sans-sc.css")
(define-runtime-path cangjie.css "cangjie.css")
(define-runtime-path ming-fonts.css "ming-fonts.css")



(define css/ming-fonts
  (elem #:style (make-style #f
                            (list (make-css-addition cangjie.css)
                                  (make-css-addition ming-fonts.css)
                                  ))))
