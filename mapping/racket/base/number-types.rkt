#lang s-exp "../../../private/mapping-lang.rkt"

>>> number? 数? "数?（取偏旁得造）"
>>> complex? 􏻬? "复数?（复数是把实数和虚数合起来构成的，各取偏旁得造）" ; 夈 粭? 夈
>>> real? 􏻫? "实数?（各取偏旁得造）" ;宩 冞 􏽐 宩
>>> rational? 􏻮? "有理数?（因有理数是两个整数之比，进而各取偏旁得造（无理数为􏽍，北是背的原形））" ;粃? 􏻳 􏻮 粊 䉾 |  􏽍
>>> integer? 􏻴? "整数?（各取偏旁得造：米+束）"
>>> exact-integer? 􏻲? "精确整数? （各取偏旁得造：石+米+束）"
>>> exact-nonnegative-integer?  􏻰􏻲? "非负精确整数?"
>>> exact-positive-integer? 正􏻲? "正精确整数?"
>>> inexact-real? 非确􏻫? "非精确实数?"
;;; >>> fixnum?
>>> flonum? 􏻪? "浮点数（各取偏旁得造）" ;粰 釆
>>> double-flonum? 双􏻪?
>>> single-flonum? 单􏻪?
>>> single-flonum-available? 支持单􏻪?
>>> zero? 〇? ;零
>>> positive? 􏻨? "正数（各取偏旁得造）" ;􏽌
>>> negative? 􏻩? "负数（各取偏旁得造）" ;􏽋
>>> even? 𥻑? "偶数（各取偏旁得造）"
>>> odd? 𥺿? "奇数（各取偏旁得造）"
>>> exact? 𮇢? "精确数（各取偏旁得造）"
>>> inexact? 非𮇢? "非精确数"
>>> inexact->exact 𮇢化 "非精确数转化为精确数"
>>> exact->inexact 非𮇢化 "精确数转化为非精确数"
>>> real->single-flonum 单粰化 "实数转化为单浮点数"
>>> real->double-flonum 双粰化 "实数转化为单双浮点数"
