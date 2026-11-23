#lang racket/base

;; ideograph should be valid for all naming rule had by composed component unless explicitly mark as non-derived-naming-rule.

(又 (meaning "element")
    (roles (sematic-atom)))

(又LB (meaning "Linked Pairs")
      (composition (又 LB)))

(㐅 (meaning "null"))

(双 (meaning "pair")
    (composition (又 又))
    (roles (general-type))
    (naming-rule (-> T T (pairof T)))) ; (naming-rule (type (-> T T (pairof T))) (data (to-be-filled)))
(􏿫 (meaning "long pair") ; A Pair whose final element is not null. Is not same as list* because list* can return non-pair if has sigular input arguent.
    (composition (又LB 又))
    (roles (resemblance-type (general-type 双)))
    (naming-rule (-> T* (pairof T))))
(􏿴 (meaning "list")
    (composition (又LB 㐅))
    (roles (general-type))
    (naming-rule (-> T+ (listof T))))


(􏿴BR (meaning "resembling list")
      (composition (􏿴 BR)))

(􏼓 (meaning "element-repeating list")
    (composition (三 􏿴BR))
    (roles (resemblance-type (general-type 􏿴))))
(􏼏 (meaning "number-element list")
    (composition (米 􏿴BR))
    (roles (resemblance-type (general-type 􏿴))))
(􏼎 (meaning "orderd-number-element list")
    (composition (弓 􏿴BR))
    (roles (resemblance-type (general-type 􏿴))))
(􏿝 (meaning "list-appended list")
    (composition (毌 􏿴BR))
    (roles (resemblance-type (general-type 􏿴))))
(􏿜  (meaning "list-appended long pair")
     (毌 􏿫BR))

(日 (meaning "former")
    (roles (semantic-atom)))
(月 (meaning "latter")
    (roles (semantic-atom)))

(阳 (meaning "former element")
 (composition (阝 日)))
(阴 (meaning "latter element")
    (compostion (阝 月)))


(阳+ (meaning "former of former") ; + is short for 阳 if suffix at 阳 or 阴.
     ()
     (expanded-expression (阳 (阳 ...)))) ; autoword means can be split to individual ideographs automatically.
(阴- (meaning "latter of latter") ; - is short for 阳 if suffix at 阳 or 阴.
     (composition autoword)
     (expanded-expression (阴 (阳 ...))))
(阳- (meaning "latter of former")
     (composition autoword)
     (expand-expression (阳 (阴 ...))))
(阴+ (meaning "former of latter")
     (composition autoword)
     (expanded-expression (阴 (阳 ...))))

(亻 (meaning "derived collection")
    (naming-rule (-> (collecitonof T) T* (collectionof T))))
(扌 (meaning "directly modify")
    (naming-rule (-> (collecitonof T) T* void)))

(攵 (meaning "modify")
    (roles (semantic-atom)))

(𰁦 (meaning "element-modified list")
    (composition (亻 攵)))
(𢪛 (meaning "modified list's single-element")
    (composition (亻 攵)))

(攸 (meaning "single-element-modified list")
    (composition (亻 (parameter-specifier 丨) 攵)))
(􏾩 (meaning "modified list's single-element")
    (composition (扌 (parameter-specifier 丨) 攵)))

(入 (meaning "function")
    (roles (semantic-atom parameter-specifier)))

(􏳭 (meaning "functionally modified list's single-element") ; functionally: function as input argument
    (composition (扌 (parameter-specifier 丨) 攵 (parameter-specifier 入))))


(弓 (meaning "index")
    (roles (semantic-atom))
    )

(􏹂 (meaning "functionally found index")
   (compostion (弓 (parameter-specifier 入))))

(丨 (meaning "one")
    (roles (semantic-atom
            parameter-specifier
            (semantic-modifier (meaning #f)))))

(弔 (meaning "indexly reference") ; use index as input to reference an element out to output.
    (roles (semantic-atom
            ;; semantic-derivation ; semantic-modifier generates semantic-derivation(ideograph) such as 弔 from 弓。
            ))
    (composition (弓 (semantic-modifier 丨))))


(丿 (roles (semantic-modifier)))

(𢎨 (meaning "human oriented indexly reference") ; number: human oriented
    (roles (semantic-atom))
    (composition弔 丿))


(𢎨RTT3 (composition 弔 RTT3 T))


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

(􏷜 (meaning "No. 1") (compostion (𢎨RTT3 一)))
(􏷛 (meaning "No. 2") (compostion (𢎨RTT3 二)))
(􏷚 (meaning "No. 3") (compostion (𢎨RTT3 三)))
(􏷙 (meaning "No. 4") (compostion (𢎨RTT3 四)))
(􏷘 (meaning "No. 5") (compostion (𢎨RTT3 五)))
(􏷗 (meaning "No. 6") (compostion (𢎨RTT3 六)))
(􏷖 (meaning "No. 7") (compostion (𢎨RTT3 七)))
(􏷕 (meaning "No. 8") (compostion (𢎨RTT3 八)))
(􏷔 (meaning "No. 9") (compostion (𢎨RTT3 九)))
(􏷓 (meaning "No. 10") (compostion (𢎨RTT3 十)))

(末 (meaning "last")
    (roles (semantic-atom)))
(􏹧 (meaning "last pair")
    (compostion (双 末)))

(巨 (meaning "length")
    (roles (semantic-atom)))
(􏹃 (meaning "functionly length")
    (compostion (巨 入)))

(𠂇 (meaning "left") (roles (semantic-atom)))
(􏴊 (meaning "right") (roles (semantic-atom)))
(􏳫? (compostion (􏳬 𠂇 阝 ?SFX)))
(􏾺 (compostion (𠂇 阝)))
(􏴌 (compostion (􏴊 阝)))
(􏳹 (compostion (𠂇 􏴗)))
(􏳸 (compostion (􏴊 􏴗)))
(􏴁 (compostion (𠂇 入 阝)))
(􏳾 (compostion (􏴊 入 􏴗)))
(􏳳 (compostion (𠂇 􏳥)))
(􏳲 (compostion (􏴊 􏳥)))
(􏳰 (compostion (􏴊 入 􏳥)))

(􏳨 (composition (􏳬 同 阝)))
(􏳧 (composition (􏳬 同 􏳤)))
(􏳦 (composition (􏳬 同 􏳥)))

(间 (meaning "between") (roles (semantic-atom)))
(扁 (meaning "flatten") (roles (semantic-atom)))
(糸 (meaning "shuffle") (roles (semantic-atom)))
(重 (meaning "duplication") (roles (semantic-atom)))
(𰂋 (compostion (亻 间)))
(偏 (compostion (亻 扁)))
(􏾜 (compostion (亻 糸)))
(𠝤 (compostion (亻 重)))

(屰 (meaning "reverse") (roles (semantic-atom)))
(川 (meaning "sort") (roles (semantic-atom)))
(􏾛 (compostion (亻 屰)))
(𠆯 (compostion (亻 川)))
(􏽒  (compostion (扌 川)))

(彐 (meaning "find") (roles (semantic-atom)))
(􏹅 (compostion (彐 入 阝 刂)))
(􏹇 (compostion (日 亻 彐 入 􏴗)))
(􏹉 (compostion (日 彐)))
(􏹄 (compostion (日 彐 入)))
(􏹈 (compostion (亻 彐 入)))
(􏹌 (compostion (彐 入)))
(􏹋 (compostion (彐 􏴗)))
(􏹊 (compostion (彐 刂)))
(􏹊~ (compostion autoword))
(􏹊^ (compostion autoword))
(􏹇~ (compostion autoword))

;; 􏷒,􏷑, 􏷐,􏷏，􏷎,右􏷎
;; 􏷑􏹈，􏷑􏿝，􏷑􏺗、􏷑􏺘
;; 夂
(􏷒 (meaning "each") (compostion (夂 入)))
(􏷑 (composition (亻 扌 并 戈 土 􏷒)))
(􏷉 (composition (亻 扌 并 戈 土 􏷒)))
(􏷐 (composition (亻 扌 并 戈 土 􏷒)))
(􏷏 (composition (亻 扌 并 戈 土 􏷒)))
(􏷎 (composition (亻 扌 并 戈 土 􏷒)))




(􏺗 (composition (米 彐 大 小)))
(􏺘 (composition (米 彐 大 小)))


(􏲶 (compostion (􏳋 􏲷 􏲸 􏹌)))
(􏲵 (compostion (􏳋 􏲷 􏲸 􏹌)))
(􏳊 (compostion (􏳋 􏲷 􏲸 􏹌)))



(􏲬 )
(卄 )
(冂 )

(􏲭 (compostion (􏲮 􏲼)))
(􏲷 (compostion (冂 􏲬)))
(􏲸 (composition (冂 卄)))
(􏲼 (composition (冂 􏲹)))
