#lang racket/base

(require (file "private/pairs-and-lists.rkt")
         (file "private/conditionals.rkt"))


(provide (all-from-out (file "private/pairs-and-lists.rkt")
                       (file "private/conditionals.rkt"))
         (rename-out [lambda 入]
                     [define 名]
                     [let 令]


                     ;; 相当 (两方面差不多；配得上或能够相抵。)
                     ;; 等同 (看作相同；当做同样的事物看待)
                     ;; 相等 ([数目、数、量或尺寸的] 相同)
                     ;; 相同 (指彼此无差异)
                     [equal? 相等?]
                     [eqv? 等同?] ;; ???? ;; #f <= (eqv? (make-string 3 #\z) (make-string 3 #\z))
                     [eq? 相同?] ;; #f <= (eq? (make-string 3 #\z) (make-string 3 #\z)) (eq? (expt 2 100) (expt 2 100))

                     [format 化]
                     [write 写]
                     [writeln  行写]
                     [print 示]
                     [println 行示]
                     [display 陈] ;; 陈 显 现 呈 示
                     [displayln 行陈]
                     ))
