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
  [andmap 映且]
  [ormap 映或]

  [caar 阳之阳]
  [cdar 阳之阴]
  [cadr 阴之阳]
  [cddr 阴之阴]
  [caaar 阳之阳阳]
  [cdaar 阳之阳阴]
  [cadar 阳之阴阳]
  [caadr 阳之阴阴]
  [caddr 阴之阴阴]
  [caddr 阴之阴阳]
  [cdadr 阴之阳阴]
  [caadr 阴之阳阳]
  [caaaar 阳之阳阳阳]
  [caaadr 阴之阳阳阳]
  [caadar 阳之阴阳阳]
  [caaddr 阴之阴阳阳]
  [cadaar 阳之阳阴阳]
  [cadadr 阴之阳阴阳]
  [caddar 阳之阴阴阳]
  [cadddr 阴之阴阴阳]
  [cdaaar 阳之阳阳阴]
  [cdaadr 阴之阳阳阴]
  [cdadar 阳之阴阳阴]
  [cdaddr 阴之阴阳阴]
  [cddaar 阳之阳阴阴]
  [cddadr 阴之阳阴阴]
  [cdddar 阳之阴阴阴]
  [cddddr 阴之阴阴阴]




  [format 化]
  [write 写]
  [writeln  行写]
  [print 示]
  [println 行示]
  [display 陈] ;; 陈 显 现 呈 示
  [displayln 行陈]
  ))
