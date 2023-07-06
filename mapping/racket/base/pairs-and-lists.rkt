#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> cons 双 @elem{把两个数据配成对，即成一个双} ;; 组合， 对:把两个东西双在一块,配对在一块.     接 合 连 构 结 创 造
>>> pair? 双? ;; 对子? 双

>>> car 阳 @elem{返回@racket[双]中的第一个数据}
>>> cdr 阴 @elem{返回@racket[双]中的第二个数据}

>>> null? 空? ;𥤦
>>> null 空

>>> list 􏿴  @elem{将一个@racket[双]的@racket[阴]位放置另一个双，数个双如此前后相接组成链状（末尾双的@racket[阴]位留@racket[空]）} ;; 􏿴子
>>> list* 􏿫 @elem{与@racket[􏿴]类似的数据结构，但不同的是结尾无空}
>>> list? 􏿴?
>>> build-list 􏼎 @elem{构造内容是一系列序数的@racket[􏿴]} ;; 垿 序  􏼒

>>> list-ref 弔 "返回􏿴的第N个元素（从0起），即以􏿴中的序号为参数来索引出相应的元素" ;; 􏿴之 􏿴及 予 序 第 𢭸 挮 𫼛
>>> length 巨 "返回􏿴的长度" ; 度

;; >>> list-tail 去 "从􏿴中去掉n个元素后余下的􏿴" ;; 去 舍  ;; same as 佐 佑.....

>>> append 􏿝 @elem{把多􏿴贯穿相连组成一个@racket[􏿴]并返回之} ;; 串 接 通 捅 􏿝 􏾟
>>> reverse 􏾛 "倒序排列" ;; 颠 倒 仮 􏾛 仮

>>> remove 􏹊~ @elem{以@racket[同?]作为比较来删除第一个寻找到的某元素} ;; 刈 删 缺
>>> remw 􏹊~/􏾗 @elem{类上，另外比较例程是@racket[􏾗?]}
>>> remv 􏹊~/􏾃 @elem{类上，另外比较例程是@racket[?􏾃]}
>>> remq 􏹊~/侗 @elem{类上，另外比较例程是@racket[侗?]}
;; 刈~ should be acting as 刈, and result of (刈 'c '(a b c c d)) should be same as (刈* '(c) '(a b c c d))
>>> remove* 􏹊^ @elem{类@racket[􏷲]，不过入参不同。}
>>> remw* 􏹊^/􏾗 @elem{类上}
>>> remv* 􏹊^/􏾃 @elem{类上}
>>> remq* 􏹊^/侗 @elem{类上}

>>> sort 𠆯 @elem{将@racket[􏿴]中元素以指定的规则理顺} ; 亻理 𠍣 􏿀 􏿀

>>> member 􏹋 @elem{以@racket[同]作为比较来寻找某元素和其之后的所有元素}  ;; 后􏿴 索 ;; 索 寻 寻随
>>> memw 􏹋/􏾗 @elem{类上}
>>> memv 􏹋/􏾃 @elem{类上}
>>> memq 􏹋/侗 @elem{类上}
>>> memf 􏹅 @elem{类上}

>>> assoc 􏹉 @elem{以@racket[同]作为比较来寻找阳位是某值的元素}  ; 探 挖 掘
>>> assw 􏹉/􏾗 @elem{类上}
>>> assv 􏹉/􏾃 @elem{类上}
>>> assq 􏹉/侗 @elem{类上}
>>> assf 􏹄 @elem{类上}

>>> findf 􏹌 @elem{查找出第一个符合条件的某元素}  ;; 查 找  选  查 寻 找 查 索 筛甲 @; 寻 找 查 搜 探 觅 检 索 俭 叟 傁
>>> filter 􏹈 @elem{查找出所有符合条件的元素}  ;; 滤 筛 选 挑 挑 选 择 􏾽


;; >>> for-each 巡 "酒席上给全座依次斟酒一遍称为巡杯（酒过三巡），这里意思是􏿴内元素依次执行某一个例程" ; 轮着 每 轮 依次 遍自 遍执 行 循序
>>> for-each 各 "各个元素依次执行某一个例程" ; 𮞑 𮞑
>>> map 佫 @elem{把某一个例程依次作用在各个元素上} ;; 各 依次应 映

>>> andmap 􏷮 @elem{各个元素全都是...} ;; 各有应 各都 映且 且佫 全 各且 􏷱 􏷮 􏷬
>>> ormap 􏷭 @elem{各个元素有的是...} ;; 各无应 各有 映或 或佫 有 各或 􏷰 㦴 􏷭
>>> foldl 垎 @elem{各个元素作为参数连同上次结果一块依次参与作用到函数上}  ;; 各左参 摄 扌参 参予 挌参 敋参 掺 各参 臵 垎 珞 敋 垎 酪
>>> foldr 右垎 @elem{从右边起，各个元素作为参数连同上次结果一块依次参与作用到函数上} ;;右掺


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
