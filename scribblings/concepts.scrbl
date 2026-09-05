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


@title[#:tag "concepts"]{Concepts}
Ming's ideograph system is not merely a system of naming keywords with Chinese characters. It establishes a programming semantic system analogous to morphology in natural language: ideographs function as semantic roots, modifiers derive related meanings, structural components determine how those meanings are formed, and their composition produces increasingly specific programming concepts.

This distinction is fundamental to understanding the terminology used throughout Ming.

@section{Morphology}
In linguistics, morphology concerns the internal structure of words and the ways in which meaningful units combine to form new words or related forms. A word may consist of a root together with prefixes, suffixes, infixes, or other morphological elements, where each element contributes systematically to the meaning or grammatical behavior of the resulting word.

Ming applies a similar principle to programming concepts.

An ideograph in Ming is therefore not necessarily an indivisible name. It may participate in a system of semantic derivation, structural modification, and composition, in which the resulting ideograph retains a systematic relationship with the concepts from which it is formed.

For example, a semantic ideograph may serve as a root concept, while a semantic modifier changes some dimension of that concept:

弓 represents index.
弔, derived from 弓 with 丨, represents indexed reference.
𢎨, derived from 弔 with 丿, represents a related form of indexed reference using human-oriented, one-based indexing.
阝 represents a serial subset relation.
􏴗, derived from 阝 with 丶, preserves that relation while modifying its range semantics.

The resulting ideographs are therefore not arbitrary names. Their forms encode relationships between programming concepts.

This morphological principle also operates at a larger scale. Different kinds of ideographic units may participate in different kinds of formation:

Semantic Ideograph provides an independent programming concept and may function as a semantic root.
Semantic Modifier modifies the semantic scope, extent, cardinality, indexing convention, representation, perspective, or another semantic dimension of an ideograph.
Structural Modifier determines or modifies the structural formation or positional relationship of ideographic components.
Composition combines distinct semantic contributions into a new concept.
Naming Rule expresses constraints on the interface or behavior of a procedure through the ideographic components occurring in its name.
Minor Type represents the finer-grained data-structural distinctions that emerge from these semantic and naming constraints.

These categories are not isolated naming conventions. They describe different roles played by components within the same morphological system.

For this reason, many Ming ideographs should be understood as derived forms rather than independently invented symbols. Once a semantic relationship has been established, new concepts can be constructed by systematically applying existing semantic or structural elements.

For example, 亻 + 弔 → 伄 does not merely assign a new Chinese character to another procedure. 亻 contributes an explicit naming rule concerning the relationship between input and output, while 弔 contributes the semantic concept of indexed reference. Their composition therefore produces a new operation whose meaning and interface constraints arise from both components.

Likewise, 又LB + 㐅 → 􏿴 expresses a structural construction of a list, while 􏿴 + 句 → 􏴷 can further specify the element type as strings. The resulting concepts form a derivational network rather than a flat collection of names.

@section{Ming as an Ideographic Morphological System}
This perspective explains an important characteristic of Ming: its ideographs are not a collection of isolated glyphs created one by one. They belong to a recursive and extensible morphological system.

Once a semantic unit, modifier, structural relation, or naming rule has been established, it can participate in further formations. Consequently, the vocabulary of Ming can grow by deriving new concepts from existing ones while preserving explicit semantic relationships between them.

In this sense, Ming's ideograph system is closer to a morphological grammar for programming concepts than to a conventional naming scheme.

The purpose is not simply to make programming syntax look Chinese. It is to make the internal relationships among programming concepts visible in their names and forms.

@nested[#:style 'inset]{@bold{Ming's ideograph system is not “using Chinese characters to name keywords”; it is establishing an ideographic morphological system for programming semantics.}}

This principle underlies the terminology and naming rules described throughout the Ming language.

@section{Terminology}
@itemlist[
@mtem["ideograph"]{A character used in Ming as an semantic or structural unit of programming-language notation.
@verbatim{
Ideograph
│
┌──────────────────┼──────────────────┐
│                  │                  │
↓                  ↓                  ↓
Semantic          Naming Rule       Structural /
Ideograph           Ideograph         Morphology
│                  │                  │
│                  │                  ├── Position
│                  │                  ├── Extent
│                  │                  ├── Word position
│                  │                  └── Rotation
│                  │
│                  ├── Type relation
│                  ├── Input constraint
│                  ├── Output constraint
│                  └── Cardinality constraint
│
├── Data concept
├── Operation concept
├── Representation concept
└── Structural concept


Ideograph
│
├── Lexical Ideograph
│   │
│   ├── Semantic Ideograph
│   │
│   ├── Type / Minor-Type Ideograph
│   │
│   └── Naming-Rule Ideograph
│
├── Semantic Modifier
│
└── Structural Modifier


Ideograph
   │
   ├── structurally-modified-by → Structural Modifier
   │
   ├── semantically-modified-by → Semantic Modifier
   │
   └── composed-with → Ideograph
}
}
@mtem["semantic ideograph"]{
An ideograph that represents a programming concept or semantic operation.
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
(list
(list @bold{Semantic Ideograph in Ming} @bold{Corresponding English concept in Racket})
(list @zi[弓] "index")
(list @zi[弔] "indexed reference")
(list @zi[彐] "find")
(list @zi[毌] "append")
(list @zi[並] "multiple values")
(list @zi[双] "pair")
(list @zi[􏿴] "list")
(list @zi[􏿰] "hash")
(list @zi[㐅] "null")
(list @zi[句] "string")
)]
}
@mtem["naming rule"]{
A rule represented by an ideograph that @emph{explicitly constrains} or determines the input, output, or structural relationship of a procedure according to its position or composition within a procedure name, e.g. @zis[亻 阝].
@verbatim{
@zi[亻]
Role:
  naming-rule
Rule:
  output data has the same type as input data;
  output elements are derived from / belong to the input data.
Default type:
  list
Type override:
  determined by a type-prefix ideograph
}
For example, @zi[伄] = @zi[亻] + @zi[弔]. Among them:
@verbatim{
亻 → explicit constraint
弔 → semantic concept
}
}
@mtem["type prefix"]{
An ideograph placed before a procedure name as a word-level prefix to determine or override the data type referred to by a naming rule.

e.g. where @zi[􏿴](list) is put first in @racket[􏿴伄], and @zi[􏿲](vector) in @racket[􏿲伄], are both type prefix.(Since @zi[伄] specifies @tt{T → T}, @zi[􏿴] and @zi[􏿲] as the type prefixes here have made the @tt{T} be @tt{list} and @tt{vector}.)
}

@mtem["default type context"]{
The implicit data type supplied when a naming rule is used without an explicit type prefix.

e.g. since @zi[亻]'s default type is @zi[􏿴](list), @litchar{伄} can be seen as the abbreviated form of @litchar{􏿴伄}.
}
@mtem["semantic implication"]{
A type, structural, or behavioral property that can be inferred from the semantic meaning of an ideograph, rather than being explicitly declared as a naming rule.

e.g. @zi[弔] only means @emph{indexed reference}, but when it is used as procedure @racket[弔], we have:
@verbatim{
input 1 = list
input 2 = number
output = element
}
those input and output types are derived from its semantic concept. The way how we derive those types are called @tech{semantic implication}.

@verbatim{
@zi[伄]:
亻→ explicit rule
弔 → semantic implication
}
}
@mtem["component"]{
An ideograph or morphological unit used to construct another ideograph. e.g. Since @tt{伄 = 亻 + 弔}, both @zi[亻] and @zi[弔] are components of @zi[伄].
}
@mtem["composition ideograph"]{
An ideograph whose semantic or structural meaning is derived by composing two or more ideographic components. e.g. @zis[伄 􏿴 􏿝 􏳋 􏳥]
@verbatim{
@tech{component}₁ + @tech{component}₂ + ... + @tech{component}ₙ
                     │
                     ↓
             Composition Ideograph

亻 + 弔 → 伄
毌 + 􏿴BR → 􏿝
亻 + 􏴫 → 􏳋
􏴺 + 並 → 􏳥
}


}

@mtem["structural modifier"]{The way where and how an idegraph as a component exits in another @tech{Composition Ideograph}. e.g. @zis[L R B T LB PFX SFX IFX RTT1 RTT2]

@verbatim{
   又
   │
structural
   │
  又LB
   │
   ├─────────┐
   │         │
   ↓         ↓
  􏿴        􏿫
   ↑         ↑
  㐅         又
}
}
@mtem["semantic modifier"]{An ideographic component that modifies the semantic scope, extent, cardinality, or operational interpretation of another ideograph while preserving a significant part of its original semantic identity. e.g. @zis[丶 丿].
@tt{@zi[阝] → @zi[􏴗]}, where @zi[丶] acts as a semantic modifier of @zi[阝].
@verbatim{
阝
↓
serial subset

阝 + 丶
↓
􏴗
↓
serial subset with a modified range
}

@tt{@zi[弔] → @zi[𢎨]}, where @zi[丿] acts as a semantic modifier of @zi[弔].
@verbatim{
弔
↓
indexed reference

弔 + 丿
↓
𢎨
↓
human-oriented indexed reference
}

@tt{@zi[𰁦] → @zi[攸]}, where @zi[丨] acts as a semantic modifier(more specificity called @tech{cardinality restriction}) of @zi[𰁦].
}
@mtem["semantic derivation"]{
The derivation of an ideograph from another ideograph by applying one or more semantic modifiers, resulting in a new ideograph whose meaning remains systematically related to the source ideograph. e.g.
@verbatim{
阝 ──丶──→ 􏴗
弔 ──丿──→ 𢎨
弓 ──丨──→ 弔
𰁦 ──丨──→ 攸


Base Ideograph
      +
Semantic Modifier
      ↓
Derived Ideograph

弓
 │
semantic derivation
 │
 └── 丨
      ↓
     弔
      │
      └── 丿
           ↓
          𢎨
}
}
@mtem["position operators"]{e.g. @zis[L R B T]}
@mtem["extent operators"]{e.g. @zis[LB BR BL]}
@mtem["word-position operators"]{@zis[PFX SFX IFX]}
@mtem["rotation operators"]{@zis[  RTT1 RTT2 RTT3]}
@mtem["general type"]{All the traditional types of what we call in Racket. e.g. @zis[􏿴 句 􏿰 勺]}
@mtem["minor type"]{A refined data-structure type distinguished by structural properties, element types, termination forms, nesting, cardinality, or other semantic invariants beyond a general data type. e.g. @zis[􏿫 􏿳 􏴳 􏴷] are all @tech{minor type}s of general type of @zi[􏿴].}
@mtem["minor-type ideograph"]{An ideograph whose primary semantic role is to identify a minor type of data. e.g. @zis[􏿴 􏿫 􏿳 􏴳 􏴷].}
@mtem["cardinality"]{
The number or multiplicity of data units represented or produced by an ideograph. e.g.
@verbatim{
二 → exactly 2
三 → 3 / multiple in designated contexts
􏴫 → two sections
􏴺 → multiple sections
}
@verbatim{
@zi[􏴫]
semantic:
  sectionalization
cardinality:
  2
}
}
@mtem["cardinality restriction"]{Is one kind of @tech{Semantic Modifier} and specifically changes the base ideograph to constrains itts semantic parameterization. e.g. @zi[丨] in @zi[攸].
}
@mtem["output representation"]{
The form in which multiple output data are represented or returned. e.g.
@verbatim{
@zi[􏳥L]:
sectionalization
+
output-representation = values
}
@verbatim{
@zi[􏳋]:
sectionalization
+
output-representation = list(@tech{default type context})
}
}
]


@section{Prose Verbs}
@itemlist[
@item{Because of @tech{Compostion Ideograph}, we draw the verb @emph{composes}, e.g.@tt{􏿝 is composed of 毌 and 􏿴BR}, @tt{􏳋 is composed of 亻 and 􏴫}.}
@item{Because of @tech{Compostion Ideograph}, we draw the verb @emph{composes}, e.g.@tt{􏿝 is composed of 毌 and 􏿴BR}, @tt{􏳋 is composed of 亻 and 􏴫}.}

]




@section{core ideographs}
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
(list
(list @bold{Idepgraph} @bold{Role} @bold{Concept/Rule} @bold{Derived from})
(list "亻" "naming rule" "same input/output type; output elements derived from input" "semantic borrowing")
(list "阝" "naming rule" "serial subset; output same type, successive subset" "borrowed")
(list "􏴗" "naming rule / modifier" "suffix-to-end subset" "阝-related")
(list "􏴫" "semantic + naming rule" "sectionalization, exactly 2" "段")
(list "􏴺" "semantic + naming rule" "sectionalization, multiple" "􏴫 + 一")
(list "並" "semantic" "multiple values" "semantic extension of 并列")
(list "弓" "semantic" "index" "glyph borrowing")
(list "弔" "semantic" "indexed reference" "simplified/derived from 第")
(list "𢎨" "semantic" "human-oriented indexed reference" "弔 + 丿")
(list "彐" "semantic" "find" "simplified from 寻")
(list "毌" "semantic" "append" "historical semantic inheritance")
(list "双" "semantic / type" "pair" "又 + 又")
(list "㐅" "semantic / type" "null" "derived borrowing")
(list "􏿴" "minor type" "proper list" "又LB + 㐅")
(list "􏿫" "minor type" "improper/list* structure" "又LB + 又")
(list "􏿳" "minor type" "association list" "双RB + 㐅")
(list "􏴳" "minor type" "list of lists" "又LB + 􏿴")
(list "􏴷" "minor type" "list of strings" "􏿴LB + 句")
(list "􏳋" "naming rule" "same-type sectional output" "亻 + 􏴫")
(list "􏳥" "naming rule / representation" "sectional values" "􏴺 + 並")
(list "􏿰" "type/data structure" "hash" "广 + 双")
)]