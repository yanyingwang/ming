#lang racket/base

(provide mapping)
(require  "../../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f])
  (gen-mapping-data data #:scribble? scribble?))
(define data
  '((cons 双) ;; 组合， 对:把两个东西双在一块,配对在一块.     接 合 连 构 结 创 造
    (pair? 双?) ;; 对子? 双

    (car 阳)
    (cdr 阴)
    (null? 空?)
    (null 空)

    (list 链 "将数据依次排列组成链。") ;; 链子
    (list* 链*)
    (list? 链?)
    (build-list 序链 "链内元素是按照一定次序排列的链即为序链。")
    (length 长)
    (list-ref 引 "索引的意思，即每个元素在链中的序号。") ;; 链之 链及 予 序
    ;; (list-tail 舍 "原链舍弃掉前面n个后的链。") ;; 去
    (append 连 "把很多链连成一个链") ;; 串 接
    (reverse 逆 "反向排序。") ;; 颠 倒

    (map 各 "把某一例程依次映用到各个元素上，各个元素作为其参数。") ;; 各 依次应 映
    (andmap 各且 "链中各个元素且都是（全都是）...的吗？") ;; 各有应 各都 映且
    (ormap 各或 "链中各个元素或有是（有一个是）...的吗？") ;; 各无应 各有 映或
    (for-each 轮 "链内元素依次执行某一个例程。") ; 轮着 每 轮 依次 遍自 遍执 行
    (foldl 各左拢)
    (foldr 各右拢)
    (filter 选) ;;  滤 筛选 挑选

    (remove 删 (elem "见" (secref "list-searching"))) ;; 移除
    (remq 删/等)
    (remv 删/齐)
    ;; (remw 移除/总同)
    (remove* 删链* (elem "见" (secref "list-searching")))
    (remq* 删链*/等)
    (remv* 删链*/齐)
    ;; (remw* 移除*/总同)

    (sort 排序)

    (member 索 (elem "链中值v之后的数据组成的链，另见：" (secref "list-searching") )) ;; 后链
    ;; (memw 后员/总同)
    (memv 索/齐) ;; 索
    (memq 索/等) ;;
    (memf 索/入) ;;
    (findf 选一 (elem "查找出第一个符合条件的元素，见：" (secref "list-searching") )) ;; 查 找  选  查 寻 找 查 索

    (assoc 寻 (elem "查找出链中第一个符合条件的子链，见：" (secref "list-searching") ))
    ;; (assw 找联/总同)
    (assq 寻/等)
    (assv 寻/齐)
    (assf 寻/入)

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
