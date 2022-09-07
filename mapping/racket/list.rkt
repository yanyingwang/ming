#lang s-exp "../../private/mapping-lang.rkt"


;;; (empty 空) not need as one defined same in base (null 空)
>>> first 甲 "第一个的意思，源自中国古代文字记序符号十天干。"
>>> second 乙 "第二个的意思，源自中国古代文字记序符号十天干。"
>>> third 丙
>>> fourth 丁
>>> fifth 戊
>>> sixth 己
>>> seventh 庚
>>> eighth 辛
>>> ninth 壬
>>> tenth 癸
>>> last 末
>>> last-pair 末* "取出最后一双元素。"
>>> rest 去甲 "链除去甲以外剩下的链。" ;; 甲外 剩余 去甲 舍甲

>>> make-list 复链 "链内各个元素相同的链即为复链，类比昆虫的“复眼”一词取名。"
>>> list-set 修 (elem "修改链" (racket 第) "N处的值为一个新的值。") ;; 修 更 改 新 肖
>>> list-update 修/入 (elem "修改链" (racket 第) "N处的值为一个例程输出的新值。") ;; 引以改

>>> index-of 提 (elem "从链中查出某个值的" (racket 第)) ;; 引 导
>>> index-where 提/入 (elem "从链中查出某个值（传入例程比对结果）的" (racket 第)) ;; 引 导  函 =》以例
>>> indexes-of 提* (elem "从链中查出某值的全部" (racket 第) "，返回一个存着查找到的所有索引的链。")
>>> indexes-where 提*/入 (elem "从链中用查出某值（传入例程比对结果）的全部" (racket 第) "，返回一个存着查找到的所有索引的链。")

>>> take 出 "从链中取出来的N个元素所组成的链。" ;; 取 数取
;; >>> drop 去 (elem "去掉前N个元素之后的链。") ;; 去 去头 ; 舍 is taken by list-tail in the racket/base
>>> split-at 出去 (elem "生成两个链：" (racket 出) "N个元素，" (racket 去) "N个元素。") ;; 断
>>> takef 出/入 (elem "同" (racket 出) "类似，除了参数是" (racket 入))
>>> dropf 去/入 (elem "同" (racket 去) "类似，除了参数是" (racket 入))
>>> splitf-at 出去/入 (elem "同" (racket 出去) "类似，除了参数是" (racket 入))

>>> take-right 右出 (elem "同" (racket 出) "类似，除了是从右边开始操作的。")
>>> drop-right 右去 (elem "同" (racket 去) "类似，除了是从右边开始操作的。")
>>> split-at-right 右出去 (elem "同" (racket 出去) "类似，除了是从右边开始操作的。")
>>> takef-right 右出/入 (elem "同" (racket 出/入) "类似，除了是从右边开始操作的。")
>>> dropf-right 右去/入 (elem "同" (racket 去/入) "类似，除了是从右边开始操作的。")
>>> splitf-at-right 右出去/入 (elem "同" (racket 出去/入) "类似，除了是从右边开始操作的。")

>>> list-prefix? 始链于链? "某链是否是某另一链的起始部分的。"
;; (take-common-prefix? 取同始)
;; (drop-common-prefix? 弃同始)
>>> append* 连~ (elem "与" (racket 链) "类似，除了结尾无空")

>>> add-between 间插 "链的每两个元素之间插入另一元素。" ;; 隔
>>> flatten 扁平
>>> check-duplicates 查重
>>> remove-duplicates 去重
>>> count 计数
>>> shuffle 洗乱

>>> partition 筛分 (elem "符合条件的元素选出为链，和剩下的链，共计返回两个值。另见：" (racket 筛选)) ;; 筛开 筛分 筛离
>>> filter-not 筛除

>>> filter-map 筛而各
>>> append-map 各而连~

>>> range 一段数 "A到B之间的一段数组成的链（包括A不包括B）"
>>> inclusive-range 一段数/间隔 "A到B之间的一段数组成的链（包括A不包括B），每两个数间隔N"

>>> combinations 互组相合
>>> in-combinations 序列组合
>>> argmin 最小者/入
>>> argmax 最大者/入
>>> group-by 分组
>>> cartesian-product 笛卡尔值

>>> remf 消/入 (elem "以例程做对比来消除某一符合条件元素。另见：" (racket 消))
>>> remf* 消*/入 (elem "以例程做对比来消除所有符合条件元素。另见：" (racket 消))



