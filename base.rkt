#lang racket/base


(provide
 (rename-out
  [define 名]
  [let 令]

  ;; 如 若 倘 况
  [if 若]
  [case 倘]
  [cond 当]

  ;; 相当 (两方面差不多；配得上或能够相抵。)
  ;; 等同 (看作相同；当做同样的事物看待)
  ;; 相等 ([数目、数、量或尺寸的] 相同)
  ;; 相同 (指彼此无差异)
  [equal? 相等?]
  [eqv? 等同?] ;; ???? ;; #f <= (eqv? (make-string 3 #\z) (make-string 3 #\z))
  [eq? 相同?] ;; #f <= (eq? (make-string 3 #\z) (make-string 3 #\z)) (eq? (expt 2 100) (expt 2 100))

  [list 链]
  [list* 链*]
  [list* 链?]
  [build-list 创链]
  [length 长]
  [list-ref 链序] ;; 链之 链及 予 序
  [list-tail 链舍]

  [cons 接] ;; 接 合 连 构 结 创 造
  [car 首]
  [caar 首之首]
  [caaar 首之首首]
  [cadr 首之余]
  [caddr 首之余余]
  [cadar 首之余首]
  [cdr 余]
  [cadr 余之首]
  [caadr 余之首首]
  [cddr 余之余]
  [caddr 余之余首]

  [format 化]
  [write 写]
  [writeln  行写]
  [print 示]
  [println 行示]
  [display 陈] ;; 陈 显 现 呈 示
  [displayln 行陈]
  ))
