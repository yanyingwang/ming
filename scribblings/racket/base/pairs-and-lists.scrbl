#lang scribble/manual

@(require (for-label racket ming/racket/base ming/racket/list)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           ming/mapping/racket/base/pairs-and-lists
           )
@(define the-eval
         (make-eval-factory '(ming)))
@(define-namespace-anchor nsa)

@script/rainbow-delimiters*


@title[#:tag "pairs-and-lists"]{对和链}
@declare-exporting[ming]
“对”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是LISP语言最最基础的数据结构。@linebreak{}
对于名语言来说，如果我们把两个数据对在一块，我们就得到一个“对”，而对在一块的这两个数据分别处于他们所构成的这个对的“阳”位和“阴”位。@linebreak{}
另外，如果一个“对”的阴位不是存的一个具体数据而是存的另外一个“对”的索引，此时的这个“对”，也叫做“链”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "list"]）。


@examples[#:eval (the-eval)
(require (minglize racket/base))
(对 1 2)
(对? '(1 . 2))
(阳 '(1 . 2))
(阴 '(1 . 2))

(对 1 (对 2 (对 3 (对 4 空))))
(相等? (对 1 (对 2 (对 3 (对 4 空))))
       (链 1 2 3 4))
(链 1 2 3 4)
(阳 '(1 2 3 4))
(阴 '(1 2 3 4))
(阴之阳 '(1 2 3 4))
(阴之阴阳 '(1 2 3 4))
(甲 '(1 2 3 4))
(乙 '(1 2 3 4))
(丙 '(1 2 3 4))
(阳 '((1 1.1) 2 3 4))
(阳之阳 '((1 1.1) 2 3 4))
(阳之阴阳 '((1 1.1) 2 3 4))
]
@(defmapping mapping nsa)


@examples[#:eval (the-eval)
(require (minglize racket/base))
(对 1 2)
(对? '(1 . 2))
(阳 '(1 . 2))
(阴 '(1 . 2))

(对 1 (对 2 (对 3 (对 4 空))))
(相等? (对 1 (对 2 (对 3 (对 4 空))))
       (链 1 2 3 4))
(链 1 2 3 4)
(阳 '(1 2 3 4))
(阴 '(1 2 3 4))
(阴之阳 '(1 2 3 4))
(阴之阴阳 '(1 2 3 4))
(甲 '(1 2 3 4))
(乙 '(1 2 3 4))
(丙 '(1 2 3 4))
(阳 '((1 1.1) 2 3 4))
(阳之阳 '((1 1.1) 2 3 4))
(阳之阴阳 '((1 1.1) 2 3 4))
]
