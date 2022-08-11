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
    (last-pair 末对)
    (rest 余) ;; 甲外 剩余 去甲 舍甲
    (make-list 复链 "链内各个元素相同的链即为复链，类比昆虫的“复眼”一词取名。")
    (list-update 更新 "把某链的某索引处值作为一例程的参数更新之。")
    (list-set 更改 "把某链的某索引处值更改为一个新的值。")

    (index-of 之引) ;; 引 导
    (index-where 之引/函) ;; 引 导  函 =》以例
    (indexes-of 之引链 "返回某个值在链中的序，如有多个返回多个序。")

    (take 取)
    (drop 弃(elem "与" (racket 舍) "同")) ;; 去头 ; 舍 is taken by list-tail in the racket/base
    (split-at 断)

    (takef 取/函)
    (dropf 弃/函)
    (splitf-at 断/函)

    (take-right 右取)
    (drop-right 右弃)
    (split-at-right 右断)

    (takef-right 右取/函)
    (dropf-right 右弃/函)
    (splitf-at-right 右断/函)
    (list-prefix? 始链于链? "某链是否是某另一链的起始部分的。")
    ;; (take-common-prefix? 取同始)
    ;; (drop-common-prefix? 弃同始)
    (add-between 间插 "链的每两个元素之间插入另一元素。")

    (append* 连*)
    (flatten 扁)
    (check-duplicates 查重)
    (check-duplicates 去重)

    (count 计数)

    (filter-map 选而映)
    (partition 选开 "把链中元素选出，并分开成两部分。")

    (range 一段数)
    (inclusive-range 一段数/间隔)

    (append-map 连映)
    (filter-not 不选)
    (shuffle 洗乱)
    (combinations 组合)
    (in-combinations 序列组合)
    (argmin 最小者/函)
    (argmax 最大者/函)
    (group-by 分组)
    (cartesian-product 笛卡尔值)

    (remf 移除/函)
    (remf* 移除*/函)

   )

  )
