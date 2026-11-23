#lang racket/base

;; spatial composition
(L (meaning "fill in left of an ideograph")
   (roles "placement-specifier"))
(R (meaning "fill in right of an ideograph")
   (roles "placement-specifier"))
(B (meaning "fill in bottom of an ideograph")
   (roles "placement-specifier"))
(T (meaning "fill in top of an ideograph")
   (roles "placement-specifier"))

(LB (meaning "fill in left and bottom of an ideograph")
    (roles "placement-specifier")
    (composition (L B))
    )
(BR (meaning "fill in bottom and right of an ideograph")
    (roles "placement-specifier")
    (composition (L B))
    )

;; word formation
(PFX (meaning "prefix")
     (role "position-specifier"))
(SFX (meaning "suffix")
     (role "position-specifier"))
(IFX (meaning "infix")
     (role "position-specifier"))

(RTT1 (meaning "Rotate in 90 degrees clockwise")
      (role "orientation-modifier"))
(RTT2 (meaning "Rotate in 180 degrees clockwise")
      (role "orientation-modifier"))
(RTT3 (meaning "Rotate in 270 degrees clockwise")
      (role "orientation-modifier"))
