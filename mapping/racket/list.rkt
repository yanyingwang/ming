#lang at-exp s-exp "../../private/mapping-lang.rkt"


;;; (empty 空) not need as one defined same in base (null 空)
>>> first 甲 "第一个的意思，源自中国古代文字记序符号十天干"
>>> second 乙 "第二个的意思，源自中国古代文字记序符号十天干"
>>> third 丙 "与上类似"
>>> fourth 丁 "与上类似"
>>> fifth 戊 "与上类似"
>>> sixth 己 "与上类似"
>>> seventh 庚 "与上类似"
>>> eighth 辛 "与上类似"
>>> ninth 壬 "与上类似"
>>> tenth 癸 "与上类似"
>>> last 末 "与上类似"
>>> last-pair 􏷽 "取出最后一双元素" ;; 末链（链一定为双） 􏿦
;; >>> rest 末** "􏿴除去甲以外剩下的􏿴" ;; 甲外 剩余 去甲 舍甲

>>> make-list 􏼓 @elem{构造生成内容是若干而相同元素的@racket[􏿴]} ;; 复 㙏 复􏿴 构造复@racket[􏿴]（数据内各个元素是相同的，类比（昆虫）“复眼”一词取名

>>> list-set 攸 @elem{修改数据中的某个元素为新值并返回新数据} ;; 修 更 改 新 肖 攸 􏿛
>>> list-update 攸/入 @elem{类上，另外进参是@racket[入]} ;; 攸

>>> index-of 引 @elem{返回@racket[􏿴]中某个元素的索引} ;; 引 导 笈 扱 𫼛 弔
>>> index-where 引/入 @elem{类上，另外进参是@racket[入]} ;; 引 导  函 =》以例 􏿊 􏷻 弔
>>> indexes-of 引v @elem{类上，另外，返回的是所有符合条件的元素组成的@racket[􏿴]} ;; 􏿉 􏿊 伋 􏷺 伄 𠇁
>>> indexes-where 引v/入 @elem{类上，另外进参是@racket[入]} ;; 􏿊 伄 引 𠇁

>>> take 􏾺 "从􏿴中左起依次取出来N个元素并组成新􏿴返回"
>>> take-right 𨚞 "类上，另外是从右边开始操作的"

>>> drop 􏷵 "从􏿴中的左边依次的去掉N个元素，剩余元素组成􏿴" ;􏾹
>>> drop-right 􏷴 "类上，另外是从右边开始操作的" ;􏾸

>>> takef 􏾺/入 @elem{与@racket[􏾺]类似，另外进参是@racket[入]}
>>> takef-right 𨚞/入 "类上，另外是从右边开始操作的"

>>> dropf 􏷵/入 @elem{与@racket[􏷵]类似，另外进参是@racket[入]} ;􏾹
>>> dropf-right 􏷴/入 "类上，另外是从右边开始操作的" ;􏾸

>>> split-at 􏾺分 @elem{将@racket[􏾺]和余下分离开（输出结果是一个复值）}
>>> split-at-right 𨚞分 "类上，另外是从右边开始操作的"

>>> splitf-at 􏾺分/入 @elem{同@racket[分􏾺]类似，另外参数是@racket[入]}
>>> splitf-at-right 𨚞分/入 "类上，另外是从右边开始操作的"

>>> list-prefix? 􏾺于? @elem{某@racket[􏿴]是否是某另一@racket[􏿴]的@racket[􏾺]}
>>> take-common-prefix 䢼 @elem{返回左起相同的元素} ;;􏾺共项 􏾺共相 共同/􏾺 左䢼
>>> drop-common-prefix 􏷳分 @elem{删除左起相同的元素（输出结果是一个复值）} ;; ;;􏾺异项 􏾺异相 共异/􏾺 左􏾶分
>>> split-common-prefix 䢼分 @elem{将@racket[䢼]和余下分离开（输出结果是一个复值）}


>>> append* 􏿜 @elem{把多个@racket[􏿴]贯穿相连组成一个 @racket[􏿫]并返回之} ;; 􏿜 􏾞

>>> add-between 𰂋 @elem{@racket[􏿴]中每两个元素之间都插入另一元素} ;; 侠 夹 间 插 搀 掺 􏿃 侠
>>> flatten 偏 @elem{把@racket[􏿴]中数据做扁平化处理} ;; 平 伻
>>> shuffle 􏾜 @elem{打乱@racket[􏿴]中元素顺序};;洗 混 淆 纷 紊 􏾷
>>> check-duplicates 重 "从􏿴中查找出第一个重复的元素并返回之"
>>> remove-duplicates 𠝤 "去除掉所有重复的元素并返回新数据" ; 去偅 􏿄

>>> filter-not 􏷶 "去除掉所有符合条件的元素并返回新数据" ;; 筛除 ; 淘 汰 剔 􏾽余 􏾼 􏷸
>>> partition 􏷹分 @elem{将@racket[􏷹]和余下的分离开（输出结果是一个复值）} ;; 筛开 筛分 筛离 筛分 􏾽分
>>> count 􏷹度 @elem{返回@racket[􏷹]的@racket[度]，等同于@code{(度 (􏷹 lst))}} ;;度/入 计 λ 度/入

>>> filter-map 佫􏷹 @elem{等同于@code{(􏷹 (入 (x) x) (佫 proc lst))}} ;佫之􏷹 􏷹佫 􏷯
>>> append-map 佫􏿝 @elem{等同于@code{(􏿝 (佫 proc lst))}} ;佫之􏿝

>>> range 𥸬􏿴 "构造从A到B之间的一段连续数字组成的􏿴（包括A不包括B）" ;􏿴/数段
>>> inclusive-range 𥸬􏿴* "构造从A到B之间的一段连续数字组成的􏿴（包括A也包括B）"

>>> combinations 􏿴/组合
>>> permutations 􏿴/排列组合
>>> in-combinations 􏿴序列/组合
>>> in-permutations 􏿴序列/排列组合

>>> argmax 佫之􏽇 @elem{@racket[佫]之@racket[􏽇]}
>>> argmin 佫之􏽈 @elem{@racket[佫]之@racket[􏽈]}

>>> group-by 􏿴/分组
>>> cartesian-product 􏿴/笛卡尔积

 >>> remf 􏷶~ ;; 删/入 (elem "以例程做对比来消除某一符合条件元素" ) ;消 迭
;; >>> remf* 删*/入 (elem "以例程做对比来消除所有符合条件元素" ) ; 消* 迭， 见：fitler-not
