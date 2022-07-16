#lang racket/base


(provide
 (rename-out
  [cons 对] ;; 对:把两个东西双在一块,配对在一块.     接 合 连 构 结 创 造
  [pair? 对?]

  [car 阳]
  [cdr 阴]
  [null? 空?]
  [null 空]

  [list 链]
  [list* 链*]
  [list* 链?]
  [build-list 造链] ;; 创链
  [length 长]
  [list-ref 序] ;; 链之 链及 予 序
  [list-tail 舍]
  [append 连] ;; 串 接
  [reverse 倒] ;; 颠倒

  [map 映]






  [caar 阳之阳]
  [caaar 阳之阳阳]
  [cadr 阴之阳]
  [caddr 阴之阴阳]
  [cadar 阳之阴阳]
  [cadr 阴之阳]
  [caadr 阴之阳阳]
  [cddr 阴之阴]
  [caddr 阴之阴阳]

  [format 化]
  [write 写]
  [writeln  行写]
  [print 示]
  [println 行示]
  [display 陈] ;; 陈 显 现 呈 示
  [displayln 行陈]
  ))
