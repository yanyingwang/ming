#lang scribble/manual

@(require (for-label racket racket/function ming ming/kernel)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list ming/racket/string ming/racket/function ming/kernel)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "procedures"]{禾}
Racket's @secref["procedures" #:doc '(lib "scribblings/reference/reference.scrbl")] is especially called @zi[禾] in Ming.


@section{禾、禾?}
@defideogr[禾 "procedure" "程" "journey, progress"]
@examples[#:eval (the-eval)
(禾? (􏸧 1))
]

@section{入、􏸗}
@eleph-note{@racket[􏸧]、@racket[􏸬]、@racket[􏸫]、@racket[􏸪]}
@examples[#:eval (the-eval)
(入 () 空)
(名 fun
  (􏸗 [() #f]
      [(x) x]
      [(x y) (􏿴 x y)]
      [(x y z) (􏻿 x y z)]))
(fun)
(fun 1)
(fun 1 2)
(fun 1 2 3)
]

@section{㞢}
@defideogr[㞢 "apply" "㞢" "to go"]{
Imagines @litchar{一} as the first element(the procedure), and @litchar{凵} as the pathesis, and @litchar{丨} as an arrow, which moves the @litchar{一} to the upper position. Since we rotates @zi[㞢] 90 degrees for writing, we are now imaging the moving from left to right not below to upper.
}
@examples[#:eval (the-eval)
(㞢 􏼃 '("a" "b" "c"))
]

@section{秝，􏸕}
@defideogr[􏸛 (禾 禾) #f #f #f]
@defideogr[􏸚 (秝 一) #f #f #f]
@examples[#:eval (the-eval)
((秝 􏿴 􏾺分) '("a" "b" "c") 2)
((􏸕 句化􏷂 􏶒) '("a" "b" "c"))
]

@section{􏸘}
@defideogr[􏸘 (禾 名 攵) #f #f #f]
@examples[#:eval (the-eval)
((􏸘 􏿴 '􏿴1) 'a 'b 'c 'd)
]

@defideogr[􏵃 (非 禾) #f #f #f]

@section[#:tag "base-functions"]{Base References}
@defmodule[ming/racket/base]
@defmapping[racket/base/procedures]

@defideogr[(入 λ) "lambda" "入" "entrance, get in"]{
Implies the input data is procedure instead of normal data.
@ziexamples[􏹌 攸/入]
}

@defideogr[名 "define" "名" "name"]
@defideogr[令 "let" "令" "let, order"]

@section[#:tag "addtional-functions"]{Additional References}
@defmodule[ming/racket/function]
@defmapping[racket/function]


