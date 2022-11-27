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

>>> list-set 攸 (elem "修改􏿴" (racket 第) "N处的值为一个新的值。") ;; 修 更 改 新 肖 攸 􏿛
>>> list-update 攸/入 (elem "修改􏿴" (racket 第) "N处的值为一个例程输出的新值。") ;; 攸

>>> index-of 笈 (elem "从􏿴中查出某个值的" (racket 第)) ;; 引 导
>>> indexes-of 􏿊 (elem "从􏿴中查出某值的全部" (racket 第) "，返回一个存着查找到的所有索引的􏿴。") ;; 􏿉
>>> index-where 笈/入 (elem "从􏿴中查出某个值（传入例程比对结果）的" (racket 第)) ;; 引 导  函 =》以例
>>> indexes-where 􏿊/入 (elem "从􏿴中用查出某值（传入例程比对结果）的全部" (racket 第) "，返回一个存着查找到的所有索引的􏿴。")

>>> take 􏾺 "从􏿴中左起依次取出来N个元素并组成新􏿴返回。"
>>> take-right 𨚞 "与上类似，不过是从右边开始操作的。"

>>> drop 􏾹 "从􏿴中的左边依次的去掉N个元素，剩余元素组成􏿴。"
>>> drop-right 􏾸 "与上类似，不过是从右边开始操作的。"

>>> takef 􏾺/入 (elem "同" (racket 􏾺) "类似，不过参数是" (racket 入))
>>> takef-right 𨚞/入 "与上类似，不过是从右边开始操作的。"

>>> dropf 􏾹/入 (elem "同" (racket 􏾹) "类似，不过参数是" (racket 入))
>>> dropf-right 􏾸/入 "与上类似，不过是从右边开始操作的。"

>>> split-at 􏾺/分 (elem "与" (racket 􏾺) "类似，不过输出结果另包含余下的部分组成的􏿴（输出结果是一个复值）")
>>> split-at-right 𨚞/分 "与上类似，不过是从右边开始操作的。"

>>> splitf-at 􏾺/入/分 (elem "同" (racket 􏾺/分) "类似，不过参数是" (racket 入))
>>> splitf-at-right 𨚞/入/分 "与上类似，不过是从右边开始操作的。"

>>> list-prefix? 􏾺于? (elem "某􏿴是否是某另一􏿴的" (racket 􏾺))
>>> take-common-prefix 左䢼 "返回两个􏿴左起的相同元素组成的􏿴" ;;􏾺共项 􏾺共相 共同/􏾺
>>> split-common-prefix 左䢼/分 "返回徝：移除两个􏿴左起的相同元素后剩余的两个􏿴"
>>> drop-common-prefix 左􏾶/分 "返回徝：两个􏿴左起的相同元素组成的􏿴，原两个􏿴中剩余部分组成的􏿴" ;; ;;􏾺异项 􏾺异相 共异/􏾺


>>> append* 􏿜 (elem "把多􏿴贯穿相连组成一个" (racket 􏿫) "并返回之")

>>> add-between 侠 "􏿴的每两个元素之间插入另一元素。" ;; 侠 夹 间 插 搀 掺 􏿃
>>> flatten 伻 ;; 平
>>> shuffle 􏾷 ;;洗 混 淆 纷 紊
>>> check-duplicates 重 "从􏿴中查找出第一个重复的元素并返回之"
>>> remove-duplicates 􏿄 "去除􏿴中重复的元素并返回去除后的􏿴" ; 去偅

>>> filter-not 􏾼 ;; 筛除 ; 淘 汰 剔 􏾽余
>>> partition 􏾽/分 (elem "符合条件的元素选出为􏿴，和剩下的􏿴，共计返回两个值。另见：" (racket 筛选)) ;; 筛开 筛分 筛离 筛分
>>> count 计 ;;度/入

>>> filter-map 􏾽则各
>>> append-map 𮞑而连~

>>> range 􏿴/数段 "A到B之间的一段数组成的􏿴（包括A不包括B）"
>>> inclusive-range 􏿴/数段* "A到B之间的一段数组成的􏿴（包括A也包括B）"

>>> combinations 互组相合
>>> in-combinations 序列组合
>>> argmin 最小者/入
>>> argmax 最大者/入
>>> group-by 分组
>>> cartesian-product 笛卡尔值

>>> remf 消 (elem "以例程做对比来消除某一符合条件元素。" )
>>> remf* 消* (elem "以例程做对比来消除所有符合条件元素。" )
