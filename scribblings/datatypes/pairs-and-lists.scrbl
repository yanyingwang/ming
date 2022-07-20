#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*


@title[#:tag "pairs-and-lists"]{对和链}
@declare-exporting[ming]
“对”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是LISP语言最最基础的数据结构。@linebreak{}
对于名语言来说，如果我们把两个数据对在一块，我们就得到一个“对”，而对在一块的这两个数据分别处于他们所构成的这个对的“阳”位和“阴”位。@linebreak{}
另外，如果一个“对”的阴位不是存的一个具体数据而是存的另外一个“对”的索引，此时的这个“对”，也叫做“链”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "list"]）。


@examples[#:eval (the-eval)
(require ming)
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

@defthing[对 cons]
@defthing[对? pair?]

@defthing[链 list]

@defthing[阳 car]
@defthing[阴 cdr]
@defthing[阴之阳 cadr]
@defthing[甲 first]
@defthing[乙 second]
@defthing[丙 third]
@defthing[丁 fourth]
@defthing[戊 fifth]
@defthing[己 sixth]
@defthing[庚 seventh]
@defthing[辛 eighth]
@defthing[壬 ninth]
@defthing[癸 tenth]
@defthing[余 rest]
@defthing[尾 last]
