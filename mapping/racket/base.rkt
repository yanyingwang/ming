#lang racket/base

(provide table)
(require (rename-in "base/pairs-and-lists.rkt" [table table1])
         (rename-in "base/syntactic-forms.rkt" [table table2]))


(define table0
  '((equal? 等同?)
    (eqv? 相等?) ;; ???? ;; #f <= (eqv? (make-string 3 #\z) (make-string 3 #\z))
    (eq? 相同?) ;; #f <= (eq? (make-string 3 #\z) (make-string 3 #\z)) (eq? (expt 2 100) (expt 2 100))
    ;; 相当 (两方面差不多；配得上或能够相抵。)
    ;; 等同 (看作相同；当做同样的事物看待)
    ;; 相等 ([数目、数、量或尺寸的] 相同)
    ;; 相同 (指彼此无差异)

    (format 化)
    (write 写)
    (writeln  行写)
    (print 示)
    (println 行示)
    (display 陈) ;; 陈 显 现 呈 示
    (displayln 行陈))
  )

(define table
  (append table0 table1 table2))

