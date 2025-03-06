#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/vector ming/racket/list
                      ming/vector ming/list ming/bool)
           ming/vector ming/scribble
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/vector ming/vector)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "ming-vector"]{􏻿}
@defmodule[ming/vector]
Originates from @secref["vector"].

@; @defthing[空􏻿 􏻿?]{
@; 生成@racket[空]@racket[􏻿]，与@code{(􏻿)}等同。
@; @examples[#:eval (the-eval)
@; 空􏻿
@; (􏻿)
@; ]
@; }

@defproc[(􏻽 [V 􏺡?] ...)
􏻽?]{
@eleph-note{@zi[􏻽] @zi[􏻿] @zi[􏻼]}
@examples[#:eval (the-eval)
(􏻽 1 2 3 4)
]
}

@deftogether[(
@defproc[(􏻽? [VEC any?])
          boolean?]
@defproc[(􏻼? [VEC any?])
          boolean?])]{
@defideogr[(􏻼? 􏻽?) ((􏻼 􏻽) ?SFX) #f #f #f]
Short for @racket[(并 (水? VEC) (􏻿? VEC))] and @racket[(并 (山? VEC) (􏻿? VEC))].
@examples[#:eval (the-eval)
(􏻽? '#(1 2 3 4))
(􏻼? '#(1 2 3 4))
]
}

@; @defproc[(􏻿􏾝* [VEC 􏻿?] [N1 精确非负整数?] [N2 精确非负整数?])
@; 􏻿?]{
@; @margin-note{另见：@racket[􏻿􏾝]}
@; @examples[#:eval (the-eval)
@; (􏻿􏾝* '#(a b c d e f) 0 2)
@; ]
@; }


@; @deftogether[(
@; @defproc[(􏻿化􏸼 [VEC 􏻿?])
@;           􏸼?]
@; @defproc[(􏻿􏾝化􏸼* [VEC 􏻿?] [N1 精确非负整数?] [N2 精确非负整数?])
@;          􏸼?])]{
@; @margin-note{另见：@racket[􏻿􏾝*]、@racket[􏻿􏾝化􏸼]}
@; @examples[#:eval (the-eval)
@; (􏻿化􏸼 '#(a b c d))
@; (􏻿􏾝化􏸼* '#(a b c d) 0 2)
@; ]
@; }



@; @defproc[(􏻿􏾩/以􏾝* [VEC 􏻿?] [N 精确非负整数?] [VECC 􏻿?] [NN1 精确非负整数?] [NN2 精确非负整数?])
@; 􏻿?]{
@; @margin-note{另见：@racket[􏻿􏾩/以􏾝]}
@; @examples[#:eval (the-eval)
@; (名 vec (􏻿 'a 'b 'c 'd))
@; (名 vecc (􏻿 'aa 'bb 'cc 'dd))
@; (􏻿􏾩/以􏾝* vec 0 vecc 1 3)
@; vec
@; ]
@; }

@; @defproc[(易? [V any?]) boolean?]{
@; @racket[固?]的反义。
@; @examples[#:eval (the-eval)
@; (名 vec (􏻿 'a 'b 'c 'd))
@; (名 vecc (􏻿 'aa 'bb 'cc 'dd))
@; (􏻿􏾩/以􏾝* vec 0 vecc 1 3)
@; vec
@; ]
@; }
