#lang s-exp "../../../private/mapping-lang.rkt"


; + - * /
>>> + + "加"
>>> - - "减"
>>> * * "乘"
>>> / / "除"
>>> quotient 商
>>> remainder 余数
>>> quotient/remainder 商和余数
>>> modulo 模
>>> add1 加一 ;; 米曾 增
>>> sub1 减一 ; 米员 损
>>> abs 绝对值
>>> max 最大数
>>> min 最小数
>>> gcd 最大公约数
>>> lcm 最小公倍数
>>> round 趋偶整数
>>> floor 下取整数
>>> ceiling 上取整数
>>> truncate 去小整数
>>> numerator 分子
>>> denominator 分母
>>> rationalize 有理化

;; = > < >= <=
>>> = = "等于"
>>> > > "大于"
>>> < < "小于"
>>> >= >= "大于或等于"
>>> <= <= "小于或等于"
>>> sqrt 平方根
>>> integer-sqrt 整数平方根
>>> integer-sqrt/remainder 整数平方根余数

>>> expt 次方 ;; 幂
>>> exp 欧拉次方 ;; ???
>>> log 对数

>>> sin 正弦
>>> cons 余弦
>>> tan 正切
>>> asin 反正弦 ;; ???
>>> acos 反余弦
>>> atan 反正切

>>> make-rectangular 复数 ;; ???
>>> make-polar 极式复数
>>> real-part 实部
>>> imag-part 虚部
>>> magnitude 极式复数量
>>> angle 极式复数度

;; (number->string )
