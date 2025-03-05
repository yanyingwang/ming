#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> cons 双  ;; 组合， 对:把两个东西双在一块,配对在一块.     接 合 连 构 结 创 造
>>> pair? 双? ;; 对子? 双

>>> car 阳
>>> cdr 阴

>>> null? 㐅? ;𥤦 空
>>> null 㐅

>>> list 􏿴   ;; 􏿴子
>>> list* 􏿫
>>> list? 􏿴?
>>> build-list 􏼎 ;; 垿 序  􏼒

>>> list-ref 弔 ;; 􏿴之 􏿴及 予 序 第 𢭸 挮 𫼛
>>> length 巨 ; 度

;; >>> list-tail 去 "从􏿴中去掉n个元素后余下的􏿴" ;; 去 舍  ;; same as 佐 佑.....

>>> append 􏿝  ;; 串 接 通 捅 􏿝 􏾟
>>> reverse 􏾛 ;; 颠 倒 仮 􏾛 仮

>>> remove 􏹊~ ;; 刈 删 缺
>>> remw 􏹊~/􏷇
>>> remv 􏹊~/􏷅
>>> remq 􏹊~/冃
;; 刈~ should be acting as 刈, and result of (刈 'c '(a b c c d)) should be same as (刈* '(c) '(a b c c d))
>>> remove* 􏹊^
>>> remw* 􏹊^/􏷇
>>> remv* 􏹊^/􏷅
>>> remq* 􏹊^/冃

>>> sort 𠆯 ; 亻理 𠍣 􏿀 􏿀

>>> member 􏹋  ;; 后􏿴 索 ;; 索 寻 寻随
>>> memw 􏹋/􏷇
>>> memv 􏹋/􏷅
>>> memq 􏹋/冃
>>> memf 􏹅

>>> assoc 􏹉  ; 探 挖 掘
>>> assw 􏹉/􏷇
>>> assv 􏹉/􏷅
>>> assq 􏹉/冃
>>> assf 􏹄

>>> findf 􏹌  ;; 查 找  选  查 寻 找 查 索 筛甲 @; 寻 找 查 搜 探 觅 检 索 俭 叟 傁
>>> filter 􏹈  ;; 滤 筛 选 挑 挑 选 择 􏾽


;; >>> for-each 巡 "酒席上给全座依次斟酒一遍称为巡杯（酒过三巡），这里意思是􏿴内元素依次执行某一个例程" ; 轮着 每 轮 依次 遍自 遍执 行 循序
>>> for-each 􏷒 ; 𮞑 𮞑
>>> map 􏷑 ;; 各 依次应 映

>>> andmap 􏷐 ;; 各有应 各都 映且 且佫 全 各且 􏷱 􏷮 􏷬
>>> ormap 􏷏 ;; 各无应 各有 映或 或佫 有 各或 􏷰 㦴 􏷭
>>> foldl 􏷎  ;; 各左参 摄 扌参 参予 挌参 敋参 掺 各参 臵 垎 珞 敋 垎 酪
>>> foldr 右􏷎  ;;右掺


>>> caar 阳+ (阳+)
>>> cadr 阴+ (阴+)
>>> cdar 阳- (阳-)
>>> cddr 阴- (阴-)
>>> caaar 阳++ (阳+)
>>> caadr 阴++ (阴+)
>>> cadar 阳-+ (阳-)
>>> caddr 阴-+ (阴-)
>>> cdaar 阳+- (阳+)
>>> cdadr 阴+- (阴+)
>>> cddar 阳-- (阳-)
>>> cdddr 阴-- (阴-)
>>> caaaar 阳+++ (阳+)
>>> caaadr 阴+++ (阴+)
>>> caadar 阳-++ (阳-)
>>> caaddr 阴-++ (阴-)
>>> cadaar 阳+-+ (阳+)
>>> cadadr 阴+-+ (阴+)
>>> caddar 阳--+ (阳-)
>>> cadddr 阴--+ (阴-)
>>> cdaaar 阳++- (阳+)
>>> cdaadr 阴++- (阴+)
>>> cdadar 阳-+- (阳-)
>>> cdaddr 阴-+- (阴-)
>>> cddaar 阳+-- (阳+)
>>> cddadr 阴+-- (阴+)
>>> cdddar 阳--- (阳-)
>>> cddddr 阴--- (阴-)
