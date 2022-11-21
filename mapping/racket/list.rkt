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
>>> last-pair 􏿦 "取出最后一双元素。" ;; 末链（链一定为双）
;; >>> rest 末** "􏿴除去甲以外剩下的􏿴。" ;; 甲外 剩余 去甲 舍甲

>>> make-list 复 "构造复􏿴（􏿴内各个元素相同的􏿴即为复􏿴，类比昆虫的“复眼”一词取名）"
>>> list-set 􏿛 (elem "修改􏿴" (racket 第) "N处的值为一个新的值。") ;; 修 更 改 新 肖 攸
>>> list-update 􏿛/入 (elem "修改􏿴" (racket 第) "N处的值为一个例程输出的新值。") ;; 攸

>>> index-of 笈 (elem "从􏿴中查出某个值的" (racket 第)) ;; 引 导
>>> index-where 笈/入 (elem "从􏿴中查出某个值（传入例程比对结果）的" (racket 第)) ;; 引 导  函 =》以例
>>> indexes-of 􏿙 (elem "从􏿴中查出某值的全部" (racket 第) "，返回一个存着查找到的所有索引的􏿴。")
>>> indexes-where 􏿙/入 (elem "从􏿴中用查出某值（传入例程比对结果）的全部" (racket 第) "，返回一个存着查找到的所有索引的􏿴。")

>>> take 佐 "从􏿴中左起依次取出来N个元素并组成新􏿴返回。"
>>> takef 佐/入 (elem "同" (racket 佐) "类似，不过参数是" (racket 入))

>>> drop 􏿣 "从􏿴中的左边依次的去掉N个元素，剩余元素组成􏿴。"
>>> dropf 􏿣/入 (elem "同" (racket 􏿣) "类似，不过参数是" (racket 入))

>>> split-at 􏿡 (elem "与" (racket 佐) "类似，不过输出结果另包含余下的部分组成的􏿴（输出结果是一个复值）")
>>> splitf-at 􏿡/入 (elem "同" (racket 􏿡) "类似，不过参数是" (racket 入))

>>> take-right 佑 (elem "同" (racket 佐) "类似，不过是从右边开始操作的。")
>>> takef-right 佑/入 (elem "同" (racket 佑) "类似，不过参数是" (racket 入))

>>> drop-right 􏿢 (elem "同" (racket 􏿣) "类似，不过是从右边开始操作的。")
>>> dropf-right 􏿢/入 (elem "同" (racket 􏿢) "类似，不过参数是" (racket 入))

>>> split-at-right 􏿠 (elem "同" (racket 􏿡) "类似，除了是从右边开始操作的。")
>>> splitf-at-right 􏿠/入 (elem "同" (racket 􏿠) "类似，不过参数是" (racket 入))


>>> list-prefix? 佐? (elem "某􏿴是否是某另一􏿴的" (racket 佐))
>>> take-common-prefix 􏿖 "返回两个􏿴左起的相同元素组成的􏿴"
>>> drop-common-prefix 􏿕 "返回𡖻：两个􏿴左起的相同元素组成的􏿴，原两个􏿴中剩余部分组成的􏿴"
>>> split-common-prefix 􏿔 "返回𡖻：移除两个􏿴左起的相同元素后剩余的两个􏿴"

>>> append* 􏿜 (elem "把多􏿴贯穿相连组成一个" (racket 􏿫) "并返回之")

>>> add-between 间 "􏿴的每两个元素之间插入另一元素。" ;; 隔
>>> flatten 平
>>> check-duplicates 查重
>>> remove-duplicates 去重
>>> count 计数
>>> shuffle 洗

>>> partition 筛分 (elem "符合条件的元素选出为􏿴，和剩下的􏿴，共计返回两个值。另见：" (racket 筛选)) ;; 筛开 筛分 筛离
>>> filter-not 筛除

>>> filter-map 筛而各
>>> append-map 各而连~

>>> range 一段数 "A到B之间的一段数组成的􏿴（包括A不包括B）"
>>> inclusive-range 一段数/间隔 "A到B之间的一段数组成的􏿴（包括A不包括B），每两个数间隔N"

>>> combinations 互组相合
>>> in-combinations 序列组合
>>> argmin 最小者/入
>>> argmax 最大者/入
>>> group-by 分组
>>> cartesian-product 笛卡尔值

>>> remf 消减/入 (elem "以例程做对比来消除某一符合条件元素。" )
>>> remf* 消尽/入 (elem "以例程做对比来消除所有符合条件元素。" )
