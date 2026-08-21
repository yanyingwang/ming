#lang at-exp s-exp "../../private/mapping-lang.rkt"



>>> empty 穴 ;空 ; not need as one defined same in base (null 空)
>>> empty? 穴?
>>> first 􏷜
>>> second 􏷛
>>> third 􏷚
>>> fourth 􏷙
>>> fifth 􏷘
>>> sixth 􏷗
>>> seventh 􏷖
>>> eighth 􏷕
>>> ninth 􏷔
>>> tenth 􏷓
>>> last 末
>>> last-pair 􏹧 ;; 末链（链一定为双） 􏿦 􏷽 􏹧
;; >>> rest 末** "􏿴除去甲以外剩下的􏿴" ;; 甲外 剩余 去甲 舍甲

>>> make-list 􏼓 ;; 复 㙏 复􏿴 构造复@racket[􏿴]（数据内各个元素是相同的，类比（昆虫）“复眼”一词取名 􏼓0

>>> list-set 攸  ;; 修 更 改 新 肖 攸 􏿛
>>> list-update 􏳭 (攸 入) ;; 攸

>>> index-of 弓  ;; 引 导 笈 扱 𫼛 弔
>>> index-where 􏹂 ;; 引 导  函 =》以例 􏿊 􏷻 弔 弓/入
>>> indexes-of 弓* ;; 􏿉 􏿊 伋 􏷺 伄 𠇁 弓v
>>> indexes-where 􏹂*  ;; 􏿊 伄 引 𠇁 弓v 𰁣/入

>>> take 􏾺 (𠂇 阝) ;; 􏾺 􏴍 􏴝
>>> take-right 􏴌 (􏴊 阝);;  𨚞 􏴉

>>> drop 􏳹 (𠂇 􏴗);􏾹 􏷵
>>> drop-right 􏳸 (􏴊 􏴗);􏾸 􏷴

>>> takef 􏴁 (􏾺 入);;􏾺/入
>>> takef-right 􏳿 (􏴌 入) ;;𨚞/入

>>> dropf 􏴀 (􏳹 入) ;;􏷵/入  ;􏾹
>>> dropf-right 􏳾 (􏳸 入) ;;􏷴/入  ;􏾸

>>> split-at 􏳳 (𠂇 􏳥)
>>> split-at-right 􏳲 (􏴊 􏳥)

>>> splitf-at 􏳱 (􏳳 入)
>>> splitf-at-right 􏳰 (􏳲)

>>> list-prefix? 􏳫? (􏳬 􏾺 ?SFX)
>>> take-common-prefix 􏳨 (􏳬 同 阝) ;;􏾺共项 􏾺共相 共同/􏾺 左䢼
>>> drop-common-prefix 􏳧 (􏳬 同 􏳤)  ;; ;;􏾺异项 􏾺异相 共异/􏾺 左􏾶分 左􏸑, 左􏸒, 左􏸓
>>> split-common-prefix 􏳦 (􏳬 同 􏳥)

>>> append* 􏿜  ;; 􏿜 􏾞

>>> add-between 𰂋  ;; 侠 夹 间 插 搀 掺 􏿃 侠
>>> flatten 偏  ;; 平 伻
>>> shuffle 􏾜 ;;洗 混 淆 纷 紊 􏾷
>>> check-duplicates 重
>>> remove-duplicates 𠝤 ; 去偅 􏿄

>>> filter-not 􏹇  ;; 筛除 ; 淘 汰 剔 􏾽余 􏾼 􏷸
>>> partition 􏹈分  ;; 筛开 筛分 筛离 筛分 􏾽分
>>> count 􏹈巨  ;;度/入 计 λ 度/入

>>> filter-map 􏹈􏷑 ;; 佫之􏷹 􏷹佫 􏷯 {等同于@code{(􏹈 (入 (x) x) (佫 proc lst))}}
>>> append-map 􏷑􏿝 ;;@elem{等同于@code{(􏿝 (佫 proc lst))}} ;佫之􏿝

>>> range 􏼏  ;􏿴/数段 𥸬􏿴
>>> inclusive-range 􏼏* ;𥸬􏿴

>>> combinations 侕
>>> permutations 􏳓
>>> in-combinations in侕
>>> in-permutations in􏳓

>>> argmax 􏷑􏺗 ; @elem{@racket[佫]之@racket[􏺗]}
>>> argmin 􏷑􏺘 ; @elem{@racket[佫]之@racket[􏺘]}

>>> group-by 􏳊
>>> cartesian-product 􏳖

 >>> remf 􏹇~ ;; 删/入 (elem "以例程做对比来消除某一符合条件元素" ) ;消 迭
;; >>> remf* 删*/入 (elem "以例程做对比来消除所有符合条件元素" ) ; 消* 迭， 见：fitler-not
