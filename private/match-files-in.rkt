#lang racket/base
(provide match-files-in)
(require (for-syntax racket/base racket/syntax racket/require-transform
                     "mapping-files.rkt"))

(define-for-syntax (matched-files matchings)
  (filter (lambda (f)
            (ormap (lambda (m)
                     (regexp-match m f))
                   matchings))
          mapping-files))
(define-syntax match-files-in
  (make-require-transformer
   (lambda (stx)
     (syntax-case stx ()
       [(_ path matchings)
        (expand-import
         (datum->syntax stx `(combine-in ,@(for/list ([f (matched-files (syntax->datum #'matchings))])
                                             `(rename-in ,(format "~a~a" (syntax-e #'path) f) [mapping ,(format-symbol "mapping~a" (path->string (path-replace-extension f #"")))])))))
        ]))))