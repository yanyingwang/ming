#lang racket/base

;; ideograph should be valid for all naming rule had by composed component unless explicitly mark as non-derived-naming-rule.
;; ideograph without meaning should derive a meaning from its composition.
;; ideograph without naming rule but has composition that having a naming rule should derive a naming rule.
;; role of ideograph musct have a meaning in case meaning can not be derived for composed ideograph that use this ideograph as component.


(又 (meaning "element")
    (roles (semantic-atom)))

(又LB (meaning "Pair Chain")
      (composition (又 LB)))

(㐅
 (meaning "null")
 (roles (semantic-atom)))

(双 (meaning "pair")
    (composition (又 又))
    (roles (general-type))
    (naming-rule (-> T T (Pair T1 T2)))) ; (naming-rule (type (-> T T (pairof T))) (data (to-be-filled)))
(􏿫 (meaning "long pair") ; A Pair whose final element is not null. Is not same as list* because list* can return non-pair if has sigular input arguent.
    (composition (又LB 又))
    (roles (data-characteristic (general-type 双)))
    (naming-rule (-> T* (Pair T1 T2))))
(􏿴 (meaning "list")
    (composition (又LB 㐅))
    (roles (general-type))
    (naming-rule (-> T+ (listof T))))

(􏿴BR (meaning "resembling list")
      (composition (􏿴 BR)))

(􏼓 (meaning "repeated-element list")
    (composition (三 􏿴BR))
    (roles (data-characteristic (general-type 􏿴))))
(􏼏 (meaning "numeric-element list")
    (composition (米 􏿴BR))
    (roles (data-characteristic (general-type 􏿴))))
(􏼎 (meaning "index-as-element list")
    (composition (弓 􏿴BR))
    (roles (data-characteristic (general-type 􏿴))))
(􏿝 (meaning "list-appended list")
    (composition (毌 􏿴BR))
    (roles (data-characteristic (general-type 􏿴))))
(􏿜  (meaning "list-appended long pair")
     (composition (毌 􏿫BR)))

(日 (meaning "former")
    (roles (semantic-atom)))
(月 (meaning "latter")
    (roles (semantic-atom)))

(阳 (meaning "first")
 (composition (阝 日)))
(阴 (meaning "rest")
    (composition (阝 月)))


(阳+ (meaning "first of first") ; + is short for 阳 if suffix at 阳 or 阴.
     (expanded-expression (阳 (阳 ...)))) ; autoword means can be split to individual ideographs automatically.
(阴- (meaning "first of rest") ; - is short for 阳 if suffix at 阳 or 阴.
     (composition autoword)
     (expanded-expression (阴 (阴 ...))))
(阳- (meaning "rest of first")
     (composition autoword)
     (expand-expression (阴 (阳 ...))))
(阴+ (meaning "first of rest")
     (composition autoword)
     (expanded-expression (阳 (阴 ...))))


(攵 (meaning "modify")
    (roles (semantic-atom)))

(𰁦 (meaning "element-modified list")
    (composition (亻 攵)))
(𢪛 (meaning "Single-Element In-Place Modification")
    (composition (亻 攵)))

(攸 (meaning "single-element-modified list")
    (composition (亻 (parameter-specifier 丨) 攵)))
(􏾩 (meaning "Single-Element In-Place Modification")
    (composition (扌 (parameter-specifier 丨) 攵)))

(入 (meaning "function")
    (roles (semantic-atom parameter-specifier)))

(􏳭 (meaning " function-based single-element modified list") ; functionally: function as input argument
    (composition (扌 (parameter-specifier 丨) 攵 (parameter-specifier 入))))

(弓 (meaning "index")
    (roles (semantic-atom))
    )

(􏹂 (meaning "function-based found index")
   (composition (弓 (parameter-specifier 入))))

(弔 (meaning "index-based reference") ; use index as input to reference an element out to output.
    (roles (semantic-atom
            ;; semantic-derivation ; semantic-modifier generates semantic-derivation(ideograph) such as 弔 from 弓。
            ))
    (composition (弓 (semantic-modifier 丨))))

(𢎨 (meaning "One-Based Indexed Reference") ; number: human oriented
    (roles (semantic-atom))
    (composition 弔 丿))
(𢎨RTT3 (meaning "Ordinal Reference") (composition 弔 RTT3 T))

(一 (meaning "1") (roles (semantic-atom)))
(二 (meaning "2") (roles (semantic-atom)))
(三 (meaning "3") (roles (semantic-atom)))
(四 (meaning "4") (roles (semantic-atom)))
(五 (meaning "5") (roles (semantic-atom)))
(六 (meaning "6") (roles (semantic-atom)))
(七 (meaning "7") (roles (semantic-atom)))
(八 (meaning "8") (roles (semantic-atom)))
(九 (meaning "9") (roles (semantic-atom)))
(十 (meaning "10") (roles (semantic-atom)))

(􏷜 (meaning "first") (composition (𢎨RTT3 一)))
(􏷛 (meaning "Second") (composition (𢎨RTT3 二)))
(􏷚 (meaning "Third") (composition (𢎨RTT3 三)))
(􏷙 (meaning "Fourth") (composition (𢎨RTT3 四)))
(􏷘 (meaning "Fifth") (composition (𢎨RTT3 五)))
(􏷗 (meaning "Sixth") (composition (𢎨RTT3 六)))
(􏷖 (meaning "Seventh") (composition (𢎨RTT3 七)))
(􏷕 (meaning "Eighth") (composition (𢎨RTT3 八)))
(􏷔 (meaning "Ninth") (composition (𢎨RTT3 九)))
(􏷓 (meaning "Tenth") (composition (𢎨RTT3 十)))

(末 (meaning "last")
    (roles (semantic-atom)))
(􏹧 (meaning "terminal pair")
    (composition (双 末)))

(巨 (meaning "length")
    (roles (semantic-atom)))
(􏹃 (meaning "function-based length")
    (composition (巨 入)))

(𠂇 (meaning "left") (roles (semantic-atom)))
(􏴊 (meaning "right") (roles (semantic-atom)))
(􏳫? (composition (􏳬 𠂇 阝 ?SFX)))
(􏾺 (meaning "Left Partial Collection") (composition (𠂇 阝)))
(􏴌 (meaning "Right Partial Collection") (composition (􏴊 阝)))
(􏳹 (meaning "Left Complimantary Partial Collection") (composition (𠂇 􏴗)))
(􏳸 (meaning "Right Complimantary Partial Collection") (composition (􏴊 􏴗)))
(􏴁 (composition (𠂇 入 阝)))
(􏳾 (composition (􏴊 入 􏴗)))
(􏳳 (composition (𠂇 􏳥)))
(􏳲 (composition (􏴊 􏳥)))
(􏳰 (composition (􏴊 入 􏳥)))

(􏳨 (composition (􏳬 同 阝)))
(􏳧 (composition (􏳬 同 􏳤)))
(􏳦 (composition (􏳬 同 􏳥)))

(间 (meaning "between") (roles (semantic-atom)))
(扁 (meaning "flatten") (roles (semantic-atom)))
(糸 (meaning "shuffle") (roles (semantic-atom)))
(重 (meaning "duplication") (roles (semantic-atom)))
(𰂋 (composition (亻 间)))
(偏 (meaning "Flattened Collection") (composition (亻 扁)))
(􏾜 (meaning "Shuffled Collection") (composition (亻 糸)))
(𠝤 (meaning "Duplicate-Removed Collection") (composition (亻 重)))

(屰 (meaning "reverse") (roles (semantic-atom)))
(川 (meaning "sort") (roles (semantic-atom)))
(􏾛 (meaning "Reversed Collection") (composition (亻 屰)))
(𠆯 (meaning "Sorted Collection")(composition (亻 川)))
(􏽒 (meaning "In-Place Sorting") (composition (扌 川)))

(彐 (meaning "find") (roles (semantic-atom)))
(􏹅 (composition (􏹌 􏴗)))
(􏹇 (composition (􏹌 刂)))
(􏹉 (composition (日 彐)))
(􏹄 (composition (􏹉 入)))
(􏹈 (composition (亻 􏹌)))
(􏹌 (meaning "Predicate-Based Find") (composition (彐 入)))
(􏹋 (composition (彐 􏴗)))
(􏹊 (composition (彐 刂)))
(􏹊~ (composition autoword))
(􏹊^ (composition autoword))
(􏹇~ (composition autoword))

;; 􏷒,􏷑, 􏷐,􏷏，􏷎,右􏷎
;; 􏷑􏹈，􏷑􏿝，􏷑􏺗、􏷑􏺘
;;
(夂 (meaning "every") (roles (semantic-atom)))
(􏷒 (meaning "each loop") (composition (夂 入)))
(并 (meaning "and") (roles (semantic-atom)))
(戈 (meaning "or") (roles (semantic-atom)))
(􏷑 (composition (亻􏷒)))
(􏷉 (composition (扌􏷒)))
(􏷐 (composition (并 􏷒)))
(􏷏 (composition (戈 􏷒)))
(􏷎 (composition (土 􏷒)))

(大 (meaning "max") (roles (semantic-atom)))
(小 (meaning "min") (roles (semantic-atom)))
(米 (meaning "numeric") (roles (semantic-atom)))
(􏺗 (composition (米 彐 大)))
(􏺘 (composition (米 彐 小)))

(􏲬 (meaning "combination") (roles (semantic-atom)))
(卄 (meaning "ordered elements") (roles (semantic-atom)))
(冂 (meaning "data container") (roles (semantic-atom)))
(􏲹 (meaning "cartesian product") (roles (semantic-atom)))
(􏲷 (composition (冂 􏲬)))
(􏲸 (composition (冂 卄)))
(􏲼 (composition (冂 􏲹)))
(􏲶 (meaninng "combination") (composition (􏳋 􏲷)))
(􏲵 (meaninng "permutation") (composition (􏳋 􏲸)))
(􏳊 (composition (􏳋 􏹌)))
(􏲭 (composition (􏲮 􏲼)))
