#lang racket/base

;; spatial composition
(L (meaning "left")
   (roles ("placement-specifier")))
(R (meaning "right")
   (roles ("placement-specifier")))
(B (meaning "bottom")
   (roles ("placement-specifier")))
(T (meaning "top")
   (roles ("placement-specifier")))

(LB (meaning "left-bottom")
    (roles ("placement-specifier"))
    (composition (L B))
    )
(BR (meaning "bottom-right")
    (roles ("placement-specifier"))
    (composition (B R))
    )

;; word formation
(PFX (meaning "prefix")
     (roles ("position-specifier")))
(SFX (meaning "suffix")
     (roles ("position-specifier")))
(IFX (meaning "infix")
     (roles ("position-specifier")))

(RTT1 (meaning "Rotate 90 degrees clockwise")
      (roles ("orientation-modifier")))
(RTT2 (meaning "Rotate 180 degrees clockwise")
      (roles ("orientation-modifier")))
(RTT3 (meaning "Rotate 270 degrees clockwise")
      (roles ("orientation-modifier")))


(? (meaning "predicate")
   (roles (semantic-atom semantic-modifier)))
(^ (meaning "list input")
   (roles (semantic-atom semantic-modifier)))
(* (meaning "strengthen")
   (roles (semantic-atom semantic-modifier)))
(~ (meaning "soften")
   (roles (semantic-atom semantic-modifier)))
(?SFX (meaning "predicate")
      (naming-rule (-> T+ Boolean))
      (composition (? SFX)))
(^SFX (meaning "predicate")
      (naming-rule (-> T (Listof T)+ T))
      (composition (^ SFX)))
(*SFX (meaning "strengthen")
      (composition (* SFX)))
(~SFX (meaning "soften")
      (composition (~ SFX)))


(丨 (meaning "single")
    (roles (semantic-atom
            parameter-specifier
            (semantic-modifier (meaning #f)))))

(丿 (roles (semantic-modifier)))


(亻 (meaning "derived collection")
    (roles (semantic-atom))
    (naming-rule (-> (collectionof T) T* (collectionof T))))
(􏳋 (meaning "Derived Nested Collection")
   (composition (亻 􏴫))
   (naming-rule (-> (collecitonof T) T* (collectionof (collectionof T)))))
(彳 (meaning "Collection Derived from Multiple Collections")
    (composition (亻 􏴫))
    (naming-rule (-> (Collectionof T) (Collectionof T)+ (Collectionof T))))
(􏲮 (meaning "Nested Collection Derived from Multiple Collections")
    (composition (彳 􏴫))
    (naming-rule (-> (Collectionof T)>=2 T* (Collectionof (Collectionof T)))))

(􏴫 (meaning "Segment Collection")
   (roles (semantic-atom))
   (naming-rule (-> T (Collectionof T))))
(扌 (meaning "modify in place")
    (roles (semantic-atom))
    (naming-rule (-> (collecitonof T) T* void)))

(阝 (meaning "Partial Collection")
    (roles (semantic-atom))
    (naming-rule (-> (collecitonof T) T* (collecitonof T))))
(􏴗 (meaning "Complementary Partial Collection")
   (roles (semantic-atom))
   (composition (阝 (semantic-modifier 丶)))
   (naming-rule (-> (collecitonof T) T* (collecitonof T))))
