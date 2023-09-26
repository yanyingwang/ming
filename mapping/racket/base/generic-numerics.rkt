#lang at-exp s-exp "../../../private/mapping-lang.rkt"

;; Arithmetic
>>> + + "加"
>>> - - "减"
>>> * * "乘"
>>> / / "除"
>>> quotient 􏻓 "商" ;TODO: 新造字：米商 商
>>> remainder 𥺌 "余数" ; TODO: 新造字：𥺌 = 米余
>>> quotient/remainder 􏻓和𥺌 "商和余数"
>>> modulo 糢 "模" ; TODO: 新造字：米莫
>>> add1 􏽊 "加一（由增字得造）" ;; 米曾 增 􏻊  𫦨  􏻀 􏻂 "加一"
>>> sub1 􏽉 "减一（由损/陨字得造）" ; 米员 损 􏻉 𥸷 􏻁 􏻃 "减一"
>>> abs 􏹚 "绝对值" ; 􏽆 ; X􏻛化 􏽌化 􏻏 X (abs 0) is 0 􏹕
>>> max 􏺗 "找出最大数" ;􏽇
>>> min 􏺘 "找出最小数" ; 􏽈
>>> gcd ?最大公约数
>>> lcm ?最小公约数
>>> round 􏹓 "趋偶取整，即四舍六入五留双（奇进偶退）" ; 􏻎 􏺿 􏺚 􏹢化
>>> floor 􏹑 "趋小取整" ; 􏻍 􏺾 􏹠化
>>> ceiling 􏹒 "趋大取整" ; 􏻌 􏺽 􏹡化
>>> truncate 􏹐 "趋〇取整" ; 􏻋 􏺙 􏹟化
>>> numerator ?分子 ;TODO: 新造字：米八子
>>> denominator ?分母 ;TODO: 新造字：米八母
>>> rationalize ?粊化 "有理化"

;; Number Comparison
>>> = = "等于"
>>> > > "大于"
>>> < < "小于"
>>> >= >= "大于或等于"
>>> <= <= "小于或等于"


;; Powers and Roots
>>> sqrt ?平方根
>>> integer-sqrt ?整数平方根
>>> integer-sqrt/remainder ?整数平方根余数
>>> expt ?次方 ;; 幂
>>> exp ?欧拉次方??? ;; ???
>>> log ?对数

;; Trigonometric Functions
>>> sin ?正弦
>>> cons ?余弦
>>> tan ?正切
>>> asin ?反正弦??? ;; ???
>>> acos ?反余弦
>>> atan ?反正切

;; Complex Numbers
>>> make-rectangular ?矩数??? ;; ???
>>> make-polar ?极式复数???
>>> real-part 宩 "实数部（各取偏旁得造）" ; 􏽐
>>> imag-part 􏻟 "虚数部（各取偏旁得造）" ;􏽏
>>> magnitude ?极式复数量???
>>> angle ?极式复数度???

;; Bitwise Operations
;; >>> bitwise-ior ?bitwise-ior
;; >>> bitwise-and ?bitwise-and
;; >>> bitwise-xor ?bitwise-xor
;; >>> bitwise-not ?bitwise-not
;; >>> bitwise-bit-set? ?bitwise-bit-set?
;; >>> bitwise-bit-field ?bitwise-bit-field
;; >>> arithmetic-shift ?arithmetic-shift
;; >>> integer-length ?integer-length

;; 4.3.2.7 Random Numbers
;; >>> random ?random
;; >>> random-seed ?random-seed
;; >>> make-pseudo-random-generator ?make-pseudo-random-generator
;; >>> pseudo-random-generator? ?pseudo-random-generator?
;; >>> current-pseudo-random-generator ?current-pseudo-random-generator
;; >>> pseudo-random-generator->vector ?pseudo-random-generator->vector
;; >>> vector->pseudo-random-generator ?vector->pseudo-random-generator
;; >>> vector->pseudo-random-generator! ?vector->pseudo-random-generator!
;; >>> pseudo-random-generator-vector? ?pseudo-random-generator-vector?

;; 4.3.2.8 Other Randomness Utilities
;; (require racket/random)
;crypto-random-bytes
;random-ref
;random-sample

;; 4.3.2.9 Number–String Conversions
>>> number->string 米化句
>>> string->number 句化米
>>> real->decimal-string 宩化􏹔句 @elem{将@racket[宩]转化成@racket[􏹔]@racket[句]}
;; >>> integer-bytes->integer ->?integer-bytes->integer
;; >>> integer->integer-bytes ->?integer->integer-bytes
;; >>> floating-point-bytes->real ->?floating-point-bytes->real
;; >>> real->floating-point-bytes ->?real->floating-point-bytes
;; >>> system-big-endian? ?system-big-endian?


;; 4.3.2.10 Extra Constants and Functions
;; (require racket/math)
;; >>> pi ?pi ;π
;; >>> pi.f ?pi.f
;; >>> degrees->radians ?degrees->radians
;; >>> radians->degrees ?radians->degrees
;; >>> sqr ?sqr
;; >>> sgn ?sgn
;; >>> conjugate ?conjugate
;; >>> sinh ?sinh
;; >>> cosh ?cosh
;; >>> tanh ?tanh
;; >>> exact-round ?exact-round
;; >>> exact-floor ?exact-floor
;; >>> exact-ceiling ?exact-ceiling
;; >>> exact-truncate ?exact-truncate
;; >>> order-of-magnitude ?order-of-magnitude
;; >>> nan? ?nan?
;; >>> infinite? ?infinite?
;; >>> positive-integer? ?positive-integer?
;; >>> negative-integer? ?negative-integer?
;; >>> nonpositive-integer? ?nonpositive-integer?
;; >>> nonnegative-integer? ?nonnegative-integer?
;; >>> natural? ?natural?