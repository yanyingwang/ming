#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> cons 双 @elem{把两个数据配成对，即成一个双} ;; 组合， 对:把两个东西双在一块,配对在一块.     接 合 连 构 结 创 造
>>> pair? 双? ;; 对子? 双

>>> car 阳 @elem{返回@racket[双]中的第一个数据}
>>> cdr 阴 @elem{返回@racket[双]中的第二个数据}

>>> null? 空?
>>> null 空

>>> list 􏿴  @elem{将一个@racket[双]的@racket[阴]位放置另一个双，数个双如此前后相接组成链状（末尾双的@racket[阴]位留@racket[空]）} ;; 􏿴子
>>> list* 􏿫 @elem{与@racket[􏿴]类似的数据结构，但不同的是结尾无空}
>>> list? 􏿴?
>>> build-list 序 "构造序􏿴（􏿴内的各个个元素是按照一定次序排列的􏿴即为序􏿴）"

>>> list-ref 𢪉 "返回􏿴的第N个元素（从0起），即以􏿴中的序号为参数来索引出相应的元素" ;; 􏿴之 􏿴及 予 序 第 𢭸 挮 𫼛
>>> length 度 "返回􏿴的长度"

;; >>> list-tail 去 "从􏿴中去掉n个元素后余下的􏿴" ;; 去 舍  ;; same as 佐 佑.....

>>> append 􏿝 @elem{把多􏿴贯穿相连组成一个@racket[􏿴]并返回之} ;; 串 接
>>> reverse 仮 "倒序排列" ;; 颠 倒 仮

;; >>> for-each 巡 "酒席上给全座依次斟酒一遍称为巡杯（酒过三巡），这里意思是􏿴内元素依次执行某一个例程" ; 轮着 每 轮 依次 遍自 遍执 行 循序
>>> for-each 各 "􏿴内元素各自依次执行某一个例程"
>>> map 𮞑 "把某一例程依次映用到各个元素上，各个元素作为其参数" ;; 各 依次应 映

>>> andmap 𮞑全 @elem{等同于@code{(且 (𮞑 proc lst))}} ;; 各有应 各都 映且
>>> ormap 𮞑有 @elem{等同于@code{(或 (𮞑 proc lst))}} ;; 各无应 各有 映或

>>> foldl 𮞑参予 "􏿴中各个元素依次作为参数，和初始参数一块作用到某例程上"  ;; 各左参
>>> foldr 𮞑倒参予 "􏿴中各个元素倒序地依次作为参数，和初始参数一块作用到某例程上"

>>> remove 删 @elem{以@racket[同?]作为比较来消去某值在􏿴中的第一个存在} ;; 刈
>>> remw 删/􏾬 @elem{与@racket[删]类似，不过比较例程是@racket[􏾬?]}
>>> remv 删/粡 @elem{与@racket[删]类似，不过比较例程是@racket[粡?]}
>>> remq 删/侗 @elem{与@racket[删]类似，不过比较例程是@racket[侗?]}

>>> remove 删* @elem{以@racket[同]作为比较来消去某值在􏿴中的全部存在}
>>> remw 删*/􏾬 @elem{与@racket[删]类似，不过比较例程是@racket[􏾬?]}
>>> remv 删*/粡 @elem{与@racket[删]类似，不过比较例程是@racket[粡?]}
>>> remq 删*/侗 @elem{与@racket[删]类似，不过比较例程是@racket[侗?]}

>>> sort 􏿀 "整理、排序的意思" ; 亻理 𠍣 􏿀

>>> member 𬩽 @elem{以@racket[同]作为比较来查询某值，返回􏿴中某值和其之后的数据组成的新􏿴}  ;; 后􏿴 索 ;; 索 寻 寻随
>>> memw 𬩽/􏾬 @elem{与@racket[𬩽]类似，不过比较例程是@racket[􏾬?]}
>>> memv 𬩽/粡 @elem{与@racket[𬩽]类似，不过比较例程是@racket[粡?]}
>>> memq 𬩽/侗 @elem{与@racket[𬩽]类似，不过比较例程是@racket[侗?]}
>>> memf 𬩽/入

>>> assoc 􏿁 @elem{以@racket[同]作为比较来查找出联􏿴中阳位是某值的元素􏿴}  ; 探 挖 掘
>>> assw 􏿁/􏾬 @elem{与@racket[􏿁]类似，不过比较例程是@racket[􏾬?]}
>>> assv 􏿁/粡 @elem{与@racket[􏿁]类似，不过比较例程是@racket[粡?]}
>>> assq 􏿁/侗 @elem{与@racket[􏿁]类似，不过比较例程是@racket[侗?]}
>>> assf 􏿁/入

>>> findf 查 "查找出第一个符合条件的􏿴中元素并返回之"  ;; 查 找  选  查 寻 找 查 索 筛甲 @; 寻 找 查 搜 探 觅 检 索 俭
>>> filter 􏷹 @elem{查找出所有符合条件的􏿴中元素并组成新􏿴返回}  ;; 滤 筛 选 挑 挑 选 择 􏾽

>>> caar 阳之阳 @elem{等同于@code{(阳 (阳 lst))}}
>>> cdar 阳之阴 @elem{等同于@code{(阴 (阳 lst))}}
>>> cadr 阴之阳 @elem{等同于@code{(阳 (阴 lst))}}
>>> cddr 阴之阴 @elem{等同于@code{(阴 (阴 lst))}}
>>> caaar 阳之阳阳 @elem{等同于@code{(阳 (阳 (阳 lst)))}}
>>> cdaar 阳之阳阴 @elem{等同于@code{(阴 (阳 (阳 lst)))}}
>>> cadar 阳之阴阳 @elem{等同于@code{(阳 (阴 (阳 lst)))}}
>>> caadr 阳之阴阴 @elem{等同于@code{(阳 (阴 (阳 lst)))}}
>>> caddr 阴之阴阴 @elem{等同于@code{(阴 (阴 (阴 lst)))}}
>>> caddr 阴之阴阳 @elem{等同于@code{(阳 (阴 (阴 lst)))}}
>>> cdadr 阴之阳阴 @elem{等同于@code{(阴 (阳 (阴 lst)))}}
>>> caadr 阴之阳阳 @elem{等同于@code{(阳 (阳 (阴 lst)))}}
>>> caaaar 阳之阳阳阳
>>> caaadr 阴之阳阳阳
>>> caadar 阳之阴阳阳
>>> caaddr 阴之阴阳阳
>>> cadaar 阳之阳阴阳
>>> cadadr 阴之阳阴阳
>>> caddar 阳之阴阴阳
>>> cadddr 阴之阴阴阳
>>> cdaaar 阳之阳阳阴
>>> cdaadr 阴之阳阳阴
>>> cdadar 阳之阴阳阴
>>> cdaddr 阴之阴阳阴
>>> cddaar 阳之阳阴阴
>>> cddadr 阴之阳阴阴
>>> cdddar 阳之阴阴阴
>>> cddddr 阴之阴阴阴
