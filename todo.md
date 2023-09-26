# λ extended
(入口 (displayln "aaa")) => (λ () (displayln "aaa"))
(λ0 (displayln "aaa")) => (λ () (displayln "aaa"))
(λ2 a b (displayln "aaa")) => (λ (a b) (displayln "aaa"))

# 叉㐅
```racket
(叉㐅 4 a b c d e f g h) =>
(叉㐅/4 a b c d e f g h) =>
(􏿴 (􏿴 a b c d) (􏿴 e f g h))
```


# depths works with 􏿰
􏿰*^ => no matter how depths data are:
```racket
(􏿰*^
`([1 . 2]
  [3 . ([4 . 5]
        [6 . ([7  8]
              [9 10])])]))
```


# nwe chars for 坐标
並示 => 坐标的意思
並𢀖 => 坐标之X
並韦 => 坐标之Y
􏸹 =>X值
􏸸 => Y值


# 人称代词的应用/he she it in let
发展出一种编程规范，在let等作用域内，变量用代词



# rename 􏼎
# 􏼎 => 弓􏿴 instead of 弔􏿴


# enh cn char of hash key value pair
日 => 冖日=𠕾 key  / 弔
月 => 冖月=肎 value / 𰅰
明 => 冖明 pair


# enh cn char of if
若 => 兰


# rename cn char of and
且 => 并
􏷮 =>各并

# rename cn char of case (done)
倘 => 尚

# enh funcs names of string
邭 => 句􏾝


# implement
句􏾺 句􏷵 句􏾺分
􏾺/入 => 左λ阝
𨚞/入 => 右λ阝


# new char
丶文 as an alias name of 文:
𫿭 𪯠 𪯢 𣁇 𰕚(生文) 𭤖 斋 𪯠 𣁁 伩 坟 吝 彣 斈 斉 抆
㪰 𣁂 𣁄 𠇥 㐎 㪯 𰆗(厂文) 𪪍 𫾨 𬀫 𫔻 𪦹

# new char for else
𡖄、外(以外、例外、另外)宀外、宀不, 否刂, 不夕犬 俖 𠥀 𨹭



# fix (仔? LST1 LST2)
renaming to: 亻􏿴? and new defining for: 阝􏿴


# implement dict as 礻双


# begin 区

# set! 𢪛 扌名

# (􏾝 (􏾛 LST))  => 屰弔阝



# 􏼥 => 名夂刀


# bool: true, false
阴阳爻


# values
􏸼 => 並
call-with-values => 土並入
call-with-values => 土並
apply => 土又㐅
垎



## symbol*=?
(symbol*=? a b) <== (and (symbol? a) (symbol? b) (symbol=? a b))



## abs
consider renaming 􏹚 to 𫂱 since | | was used in racket for creating symbol:
```racket
'|racket|
```


## implement scribble/ming lang
file:///home/yanying/racket/doc/scribble/doclang.html

