#lang racket/base

(provide mapping)
(require  "../../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f])
  (gen-mapping-data data #:scribble? scribble?))
(define data
  '((cons 对) ;; 对:把两个东西双在一块,配对在一块.     接 合 连 构 结 创 造
    (pair? 对?) ;; 对子?

    (car 阳)
    (cdr 阴)
    (null? 空?)
    (null 空)

    (list 链 "将数据依次排列组成链。") ;; 链子
    (list* 链*)
    (list? 链?)
    (build-list 序链 "链内元素是按照一定次序排列的链即为序链。")
    (length 长)
    (list-ref 引 "索引的意思。") ;; 链之 链及 予 序
    (list-tail 舍 "原链舍弃掉前面n个后的链。") ;; 去
    (append 连 "把很多链连成一个链") ;; 串 接
    (reverse 逆 "反向排序。") ;; 颠 倒

    (map 各应 "链内的各个元素作为参数应用到某一例程。") ;; 各
    (andmap 各且应 "链内元素更替的作为参数应用某一个例程，直到有元素应用后返回的值是假。") ;; 各有应
    (ormap 各或应 "链内元素更替的作为参数应用某一个例程，直到有元素应用后返回的值是真。") ;; 各无应
    (for-each 每)
    (foldl 左应合)
    (foldr 右应合)
    (filter 滤)

    (remove 移除)
    (remq 移除/等)
    (remv 移除/齐)
    ;; (remw 移除/总同)
    (remove* 移除*)
    (remq* 移除*/等)
    (remv* 移除*/齐)
    ;; (remw* 移除*/总同)

    (sort 排序)

    (member 后员)
    ;; (memw 后员/总同)
    (memv 后员/齐)
    (memq 后员/等)
    (memf 后员/函)
    (findf 找/函)

    (assoc 找联)
    ;; (assw 找联/总同)
    (assq 找联/等)
    (assv 找联/齐)
    (assf 找联/函)

    (caar 阳之阳)
    (cdar 阳之阴)
    (cadr 阴之阳)
    (cddr 阴之阴)
    (caaar 阳之阳阳)
    (cdaar 阳之阳阴)
    (cadar 阳之阴阳)
    (caadr 阳之阴阴)
    (caddr 阴之阴阴)
    (caddr 阴之阴阳)
    (cdadr 阴之阳阴)
    (caadr 阴之阳阳)
    (caaaar 阳之阳阳阳)
    (caaadr 阴之阳阳阳)
    (caadar 阳之阴阳阳)
    (caaddr 阴之阴阳阳)
    (cadaar 阳之阳阴阳)
    (cadadr 阴之阳阴阳)
    (caddar 阳之阴阴阳)
    (cadddr 阴之阴阴阳)
    (cdaaar 阳之阳阳阴)
    (cdaadr 阴之阳阳阴)
    (cdadar 阳之阴阳阴)
    (cdaddr 阴之阴阳阴)
    (cddaar 阳之阳阴阴)
    (cddadr 阴之阳阴阴)
    (cdddar 阳之阴阴阴)
    (cddddr 阴之阴阴阴)
    ))
