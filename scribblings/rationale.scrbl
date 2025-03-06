#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector)
           scribble/example
           scribble-rainbow-delimiters
           ming/scribble)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/list ming/racket/base ming/racket/list)))


@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "rationle"]{Rationale}
ref to: @url{http://www.yanying.wang/SOICOL}

@section{Lisp and its parenthsis}
Lisp, as an ancient programming language, when I was learning it with inherent ideas from modern programming languages such as Ruby, I noticed there are a few distinctions. Among these, The most prominent one is the form.

LISP is highly flat in forms, all are parenthesis. On the contrary, most modern PLs adhere to use different forms for different operations:
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
(list
(list @bold{Operation} @bold{Ruby code} @bold{Racket code})
(list "number addition" @code{1+2+3}     @code{(+ 1 2 3)} )
(list "create array"    @code{[1, 2, 3]}           @code{(vector 1 2 3)})
(list "create hash"     @code{{a: 1, b: 2, c: 3}}  @code{(hash 'a 1 'b 2)}  )
(list "create array of a range of numbers"   @code{Array(1..5)}     @code{(build-list 5 values)})
(list "create array of duplication elements" @code{Array.new(3, 1)} @code{(make-list 3 1)})
)]

By the examples above, we can see in Ruby, different operations are wrote in distinctive forms, but in Racket they are in same form: elements in one parenthesis. This each other resembled form of LISP impedes people differentiate them on a glimpse, therefore, the meaning of operations are more blamed on the function names(first word of elements in parenthesis).

In conclusion, the function names of LISP take more responsibilities to annotate various operations than modern PLs. The more informations that function names convey to us, the better we can distinguish them and understand the purpose and usage of them.


@section{Ideogram}
Following my theory above, we need to break down concepts of current programming languages to atomic components, with those components we build up all the ideogram characters and words for all the function names. (Upon which, we may possibly and hopefully turn bunch of code to sentences in the future.)

To this date since what has been broadly used ideogram is Chinese character, I intentionally design Ming's ideographs with Chinese characters flavour. This is also the reason that most Chinese speakers find them seeming familar but not recognizable.

Because I also intentionally originate Chinese ideograms to an ancient time, reserve the ideographic components and leave out the phonetic components(hopefully in the future I can make English words used as phonetic components but not suggest sound here espectially borrow its meaning in Ming), thus to be redeveloped and adapted for PL concepts, as well as redesign them be easily learned for international users.


@section{Chineseoid characters}
Compare to English, of which the writing is based on the pronounciation of speaking, Chinese contrarily emphasize its writing more than speaking, which has actually developed a way to write related objects and concepts, we call it @hyperlink["https://en.wikipedia.org/wiki/Chinese_character_classification" "LiuShu(六书)"].

With the fact that chinese characters are just the implementation of using LiuShu for the communication of human, what I am doing here is using it to invent and design lots of @italic{chinese resembled characters}, where we draw the phrase @italic{chineseoid character}, which is ideogram and especially called @italic{zi}, means looking like chinese characters but can not be recognized by most Chinese people.

At last, we use those characters instead of common English words for the concepts of Lisp and even the whole programming language world to make human interact better with it.

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
(list (list @bold{Ming code}  @bold{Racket code})
(list @code{(双 'a 'b)} @code{(cons 'a 'b)})
(list @code{(􏿴 'a 'b 'c 'd)} @code{(list 'a 'b 'c 'd)})
(list @code{(􏿝 '(1) '(2) '(3 4) '(5 6))} @code{(append '(1) '(2) '(3 4) '(5 6))})
(list @code{(􏿜 '(1) '(2) '(3 4) '((5 6)))} @code{(append* '(1) '(2) '(3 4) '((5 6)))})
(list @code{(􏼓 6 'foo)} @code{(make-list 6 'foo)})
(list @code{(􏼎 10 並)} @code{(build-list 10 values)})
(list @code{(弓 '(a b c d e c f) 'c)} @code{(index-of '(a b c d e c f) 'c)})
(list @code{(􏼏 10)} @code{(range 10)})
(list @code{(􏻿 'a 'b 'c 'd)} @code{(vector 'a 'b 'c 'd)})
(list @code{(􏿰 'a 'b 'c 'd)} @code{(hash 'a 'b 'c 'd)})
)]

As chart shown above, the keywords of Ming are much short in length, and in forms the complex characters are usually constituted by other simpler characters, and those simpler characters are usually used for related function names as well.

Further more, the connotations behind the characters work the same way, they are related to each other and complex concepts are broke to simple concepts as well.

Most importantly, the chineseoid characters implemented here also have the ability to imply to human about the arguments and results of functions, check @secref["general-ideographs"] for more.


@section[#:tag "character-implications"]{Character implications}
Since the chineseoid chracters are much complicated than general western characters, there are few terminologies we need to know in advance: @italic{radical}, @italic{component}, @italic{part}(check the @hyperlink["https://en.wiktionary.org/wiki/%E5%81%8F%E6%97%81" "wiktionary page"] for details).

Simply put it, @italic{phrase} is composed by more than one @italic{characters}, @italic{character} is composed by more than on @italic{parts}. For the @italic{parts} of an @italic{specific character}, only one of them can be counted as @italic{radical}, which usually is another @italic{standalone character} that provides the basic meaning for the @italic{specific character}, and the other one can be counted as @italic{component}, which usually implies the difference(type of input, type of output, etc.) between the meaning of @italic{radical} and the @italic{specific character}.

Take example of the procedure @racket[伄], this @italic{character} is composed of two @italic{parts}:  @zi[亻] as @italic{component} and @zi[弔] as @italic{radical}. By composition, we can deduce that this procedure has a similar usage as @racket[弔] since it is the @italic{radical}. And the @zi[亻] additionally means the type of output data is list(read @secref["general-ideographs"] for more).
