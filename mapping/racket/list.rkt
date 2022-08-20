#lang racket/base

(provide mapping)
(require "../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f]) ;; TODO: should be (load file ...)
  (gen-mapping-data data #:scribble? scribble?))

(define data
  '( ;;; (empty 空) not need as one defined same in base (null 空)
    (first 甲 "第一个的意思，源自中国古代文字记序符号十天干。")
    (second 乙 "第二个的意思，源自中国古代文字记序符号十天干。")
    (third 丙)
    (fourth 丁)
    (fifth 戊)
    (sixth 己)
    (seventh 庚)
    (eighth 辛)
    (ninth 壬)
    (tenth 癸)
    (last 末)
    (last-pair 末/双)
    (rest 去甲 "链除去甲以外剩下的链。") ;; 甲外 剩余 去甲 舍甲
    (make-list 复链 "链内各个元素相同的链即为复链，类比昆虫的“复眼”一词取名。")
    (list-update 引改/入 "把某链的某索引处值作为一例程的参数更新之。") ;; 引以改
    (list-set 引改 "把某链的某索引处值更改为一个新的值。")

    (index-of 索引 (elem "从链中查出某个值的" (racket 引))) ;; 引 导
    (index-where 索引/入 (elem "从链中查出某个值（传入例程比对结果）的" (racket 引))) ;; 引 导  函 =》以例
    (indexes-of 索引/链 (elem "从链中用查出某值的" (racket 引) "，返回一个存着查找到的索引的链。"))
    (indexes-where 索引/入/链 (elem "从链中用查出某值（传入例程比对结果）的" (racket 引) "，返回一个存着查找到的索引的链。"))

    (take 取 "去除前n个元素组成链。")
    (drop 去 (elem "去掉前n个元素之后的链。")) ;; 去头 ; 舍 is taken by list-tail in the racket/base
    (split-at 断 "从第n个元素之后断成两个链。")

    (takef 取/入)
    (dropf 去/入)
    (splitf-at 断/入)

    (take-right 右取)
    (drop-right 右去)
    (split-at-right 右断)

    (takef-right 右取/入)
    (dropf-right 右去/入)
    (splitf-at-right 右断/入)
    (list-prefix? 始链于链? "某链是否是某另一链的起始部分的。")
    ;; (take-common-prefix? 取同始)
    ;; (drop-common-prefix? 弃同始)
    (add-between 间插 "链的每两个元素之间插入另一元素。")

    (append* 连*)
    (flatten 扁)
    (check-duplicates 查重)
    (remove-duplicates 去重)

    (count 计数)

    (filter-map 选则各)
    (partition 选开 "把链中元素选出，并分开成两部分。")

    (range 一段数)
    (inclusive-range 一段数/间隔)

    (append-map 各而连) ;; the original procedure does not works.
    (filter-not 选非)
    (shuffle 洗乱)
    (combinations 互组相合)
    (in-combinations 序列组合)
    (argmin 最小者/函)
    (argmax 最大者/函)
    (group-by 分组)
    (cartesian-product 笛卡尔值)

    (remf 删/入 "传入例程比对删除某一符合条件元素。")
    (remf* 删*/入 "传入例程比对删除所有符合条件元素。")
   )

  )
