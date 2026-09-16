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

Ming's @tech[#:key "ideograph"]{ideograph system} is not merely a system for naming programming keywords with Chineseoid characters. It establishes an @tech{ideographic morphology} in which programming concepts, semantic relationships, and structural constraints are expressed through the composition, derivation, and modification of ideographs.

This morphological perspective is fundamental to understanding how Ming's vocabulary is constructed and how relationships among programming concepts are represented. The terminology used to describe these mechanisms is formally introduced in @secref["Terminology"].

@section{Morphology}

In linguistics, morphology concerns the internal structure of words and the ways in which meaningful units combine to form new words or related forms. A word may consist of a root together with prefixes, suffixes, infixes, or other morphological elements, where each element contributes systematically to the meaning or grammatical behavior of the resulting word.

Ming applies a similar principle to programming concepts. An ideograph is therefore not necessarily an indivisible name. It may participate in semantic derivation, structural modification, and composition, so that a resulting ideograph retains a systematic relationship with the concepts from which it is formed.

This internal organization of an ideograph is referred to as its @tech{Morphological Structure}.

For example, @zi[弓] represents the concept of @emph{index}. From this concept, further ideographs can be constructed:

@itemlist[
@item{@zi[弔], derived from @zi[弓] with @zi[丨], represents indexed reference.}
@item{@zi[𢎨], derived from @zi[弔] with @zi[丿], represents a related form of indexed reference using human-oriented, one-based indexing.}
@item{@zi[阝] represents a serial-subset relationship.}
@item{@zi[􏴗], derived from @zi[阝] with @zi[丶], preserves that relationship while modifying its range semantics.}
]

The resulting ideographs are therefore not arbitrary names. Their forms make relationships between programming concepts visible.

The same morphological principle also operates when different kinds of ideographic elements participate in the formation of a procedure name. Some elements primarily contribute an independently meaningful programming concept, while others primarily modify an existing concept, specify structural information, or impose constraints on the procedure represented by the resulting name.

These different roles include:

@itemlist[
@item{@tech{Semantic Ideograph}, which provides an independently meaningful programming concept and may serve as a semantic root.}
@item{@tech{Semantic Modifier}, which derives a related meaning by modifying some semantic dimension of an existing ideograph.}
@item{@tech{Structural Modifier}, which contributes information about the structural formation or positional organization of an ideograph.}
@item{@tech{Composition}, through which distinct contributions are combined into a new ideograph or concept.}
@item{@tech{Naming Rule}, through which an ideographic component explicitly constrains properties of a procedure through its occurrence or composition within a procedure name.}
@item{@tech{Minor Type}, through which more fine-grained distinctions among data structures and values can be represented.}
]

These terms describe different roles that components may play within the same morphological system. Their precise definitions and relationships are given in @secref["Terminology"].

For this reason, many Ming ideographs should be understood as derived forms rather than as independently invented symbols. Once a semantic relationship has been established, new concepts can be constructed by systematically applying existing semantic or structural elements.

For example,

@centered{
@zi[亻] + @zi[弔] → @zi[伄]
}

does not merely assign a new Chineseoid character to another procedure. @zi[亻] contributes an explicit Naming Rule concerning the relationship between input and output, while @zi[弔] contributes the semantic concept of indexed reference. Their composition therefore produces an operation whose meaning and interface constraints arise from both components.

Likewise,

@centered{
@zi[又LB] + @zi[㐅] → @zi[􏿴]
}

expresses the morphological construction of a list, while

@centered{
@zi[􏿴] + @zi[句] → @zi[􏴷]
}

further specifies a list whose elements are strings.

The resulting concepts therefore form a derivational network rather than a flat collection of names.

@section{Ideographic Morphological System}

This perspective leads to an important characteristic of Ming: its ideographs are not a collection of isolated glyphs created one by one. They belong to a recursive and extensible system in which established semantic concepts, modifiers, structural elements, and Naming Rules can participate in further formations.

We call this overall system @tech{Ideographic Morphology}.

Once an ideographic unit or relationship has been established, it can participate in further formations. Consequently, Ming's vocabulary can grow by deriving new concepts from existing ones while preserving explicit relationships between them.

This makes the morphology of Ming fundamentally extensible. A newly constructed ideograph does not merely introduce another name into the vocabulary; it may also introduce a new node and new relationships into the network of programming concepts.

In this sense, Ming's ideograph system is closer to a morphological grammar for programming concepts than to a conventional naming scheme.

The purpose is not simply to make programming syntax look Chinese. It is to make the internal relationships among programming concepts visible in their names and forms, while allowing those relationships to participate in further semantic and structural composition.

@nested[#:style 'inset]{
@bold{Ming's ideograph system is not “using Chinese characters to name keywords”; it is establishing an ideographic morphology.}
}

This principle underlies the terminology, morphology, and naming rules described throughout the Ming language.



@section{Terminology}
Ming's ideograph system is not merely a system for naming programming keywords with Chinese characters. It establishes an @bold{ideographic morphological system for programming semantics}.

The ideographs of Ming therefore should not be understood as a collection of independently invented symbols. They form a compositional and derivational system in which individual semantic units, modifiers, structural elements, and naming rules can be combined to construct increasingly specific programming concepts and procedural interfaces.

This morphological system distinguishes different kinds of meaning and different roles played by ideographic components.


@verbatim{
                    Ming
                     │
                     ▼
       ideographic composition
              ↓ semantic composition
                     │
                     ▼
          conceptual explanation
                     │
                     ▼
          Ideographic Morphology
                     │
        ┌────────────┼─────────────┐
        ▼            ▼             ▼
 Semantic        Naming        Composition
 Ideograph        Rule          / Derivation
        │            │
        ▼            ▼
 Conceptual     Programmatic
 Meaning          Meaning
}


At the most fundamental level, Ming distinguishes between @tech{conceptual meaning} and @tech{programmatic meaning}.

@tech{Conceptual meaning} represents what a programming concept means in itself. It is primarily expressed by @tech{Semantic Ideographs}, which may exist independently of any particular procedure and may be used to describe concepts, data structures, @tech{Minor Types}, or other semantic entities.

@tech{Programmatic meaning}, in contrast, expresses properties and relationships that concern a program or procedure itself, such as input and output types, parameter kinds, @tech{cardinality}, or @tech{structural relationships}. It is primarily encoded through @tech{Naming Rules}, whose purpose is to impose such constraints through the morphology of a procedure name.

This distinction is not a distinction between meaningful and meaningless ideographs. Both @tech{Semantic Ideographs} and @tech{Naming Rules} carry meaning; they differ in the @bold{kind of meaning} they primarily express.

A @tech{Semantic Ideograph} primarily answers:

@nested[#:style 'inset]{@bold{What concept does this represent?}}

A @tech{Naming Rule} primarily answers:

@nested[#:style 'inset]{@bold{What must a procedure represented by this name be like?}}

@verbatim{
Ming's
@tech{Ideographic Morphology}
│
├── @tech{Semantic Ideograph}
│      │
│      ├── @tech{Conceptual Meaning}
│      │
│      └── @tech{Semantic Implication}
│
├── @tech{Semantic Modifier}
│      │
│      └── @tech{Semantic Derivation}
│
├── @tech{Structural Modifier}
│
├── @tech{Composition}
│
└── @tech{Naming Rule}
       │
       └── @tech{Programmatic Meaning}
              │
              ├── Input constraints
              ├── Output constraints
              ├── Type constraints
              ├── @tech{Cardinality}
              └── Structural relationships
}

Other ideographic components operate between and around these two roles. @tech{Semantic Modifiers} derive related meanings from existing concepts, @tech{Structural Modifiers} describe or alter the morphological structure of an ideograph, and @tech[#:key "Composition"]{Composition Ideograph} combines distinct semantic or structural contributions into a new form.

The resulting system can therefore be viewed as a morphological grammar for programming concepts: existing concepts and rules become building blocks from which new, systematically related concepts can be derived.



@subsection{Ideograph}
@deftech{Ideograph} is a character used in Ming as an semantic or structural unit of programming-language notation.


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
│   ├── @tech{Semantic Ideograph}
│   │
│   ├── @tech[#:key "general type"]{General-Type Ideograph} / @tech[#:key "minor type Ideograph"]{Minor-Type Ideograph}
│   │
│   └── @tech[#:key "naming rule"]{Naming-Rule Ideograph}
│
├── @tech{Semantic Modifier}
│
└── @tech{Structural Modifier}


Ideograph
│
├── structurally-modified-by → @tech{Structural Modifier}
│
├── semantically-modified-by → @tech{Semantic Modifier}
│
└── composed-with → @tech{Composition} Ideograph
}



@subsection{Semantic Ideograph}
A @deftech{Semantic Ideograph} is an ideograph whose primary function is to represent an independently meaningful programming concept.

A Semantic Ideograph is not inherently tied to a particular procedure name. It may be used to express a concept in a variety of contexts, including the description of data structures, Minor Types, or other semantic entities.

For example:
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
(list @zi[?] "predicate")
(list @zi[!] "modification of the original value")
)]

When a Semantic Ideograph participates in a procedure name, its semantic meaning may naturally imply properties of the procedure. These are @tech{Semantic Implications}, rather than necessarily being @tech{Naming Rules}.

For example, the meaning of @zi[?] as a predicate conventionally implies a Boolean result, while the meaning of @zi[!] as an operation that modifies the original value conventionally implies a void result.



@subsection{Semantic Implication}
@deftech{Semantic Implication} is a type, structural, or behavioral property that can be inferred from the semantic meaning of an ideograph, rather than being explicitly declared as a @tech{naming rule}.

A Semantic Implication is a property of a procedure, operation, or data relationship that follows naturally from the meaning of a @tech{Semantic Ideograph}.

A Semantic Implication is not necessarily stated as an explicit @tech{naming rule}. Rather, it arises from the semantic interpretation of the concept represented by the ideograph.

For example, the concept represented by ? is predicate. In the context of a procedure, this naturally implies that its result is Boolean.

Likewise, @zi[!] represents modification of the original value. The conventional consequence is that the procedure produces a void result.

Semantic Implications may therefore provide interface information without being the primary purpose of the ideograph.

e.g. @zi[弔] only means @emph{indexed reference}, but when it is used as procedure @racket[弔], we have:
@verbatim{
input Rule Rule 1 = list
input 2 = number
output = element
}
those input and output types are derived from its semantic concept. The way how we derive those types are called @tech{semantic implication}.

@verbatim{
@zi[伄]:
亻→ explicit rule
弔 → semantic implication
}


@subsection{Naming Rule}
A @deftech{Naming Rule} is an ideographic rule whose primary function is to explicitly constrain or determine the interface or operational structure of a procedure through its name.

A Naming Rule may specify properties such as:

@itemlist[
@item{the type or structure of an input;}
@item{the type or structure of an output;}
@item{relationships between inputs and outputs;}
@item{parameter kinds;}
@item{cardinality;}
@item{or other structural relationships of an operation.}
]

Unlike a @tech{Semantic Ideograph}, a Naming Rule does not primarily exist to represent an independently referential programming concept. Its meaning is primarily @bold{morphological and programmatic}: it specifies how a procedure bearing the corresponding name is to be understood or constrained.

For example:

@itemlist[
@item{@zi[^] specifies that the input is a list.}
@item{@zi[亻] specifies a derived-set relationship between input and output.}
@item{@zi[阝] specifies a serial-subset relationship.}
@item{@zi[入] specifies that an input parameter is a function.}
]

A Naming Rule may nevertheless carry meaningful information. Its distinction from a @tech{Semantic Ideograph} is not that it is meaningless, but that its meaning primarily concerns the @bold{formation and interpretation of a procedure} rather than an independently existing concept.

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


@subsection{Programmatic Meaning}
@deftech{Programmatic Meaning} is meaning concerning the properties, relationships, and behavior of a program or procedure, including its data, types, inputs, outputs, parameters, cardinality, and structural relationships.

@tech{Naming Rules} primarily express Programmatic Meaning.

This should be distinguished from the @tech{Conceptual Meaning} expressed by @tech{Semantic Ideographs}.

Thus:

@nested[#:style 'inset]{
@tech{Semantic Ideograph} → @tech{Conceptual Meaning}
@tech{Naming Rule} → @tech{Programmatic Meaning}
}

The distinction concerns the primary role of the meaning rather than whether an ideograph possesses meaning at all.



@subsection{Conceptual Meaning}

@deftech{Conceptual Meaning} is the meaning of an independently recognizable concept represented by an ideograph.

Conceptual Meaning may exist independently of any particular procedure or naming context. It can therefore be used to describe programming concepts, data structures, @tech{Minor Types}, or other semantic entities.

For example, @zi[弓] can express the concept of index independently of any particular procedure.



@subsection{Type Prefix}
@deftech{Type Prefix} is an ideograph placed before a procedure name as a word-level prefix to determine or override the data type referred to by a naming rule.

e.g. where @zi[􏿴](list) is put first in @racket[􏿴伄], and @zi[􏿲](vector) in @racket[􏿲伄], are both type prefix.(Since @zi[伄] specifies @tt{T → T}, @zi[􏿴] and @zi[􏿲] as the type prefixes here have made the @tt{T} be @tt{list} and @tt{vector}.)

@subsection{Default Type Context}
@deftech{Default Type Context} is ahe implicit data type supplied when a @tech{naming rule} is used without an explicit type prefix.

e.g. since @zi[亻]'s default type is @zi[􏿴](list), @litchar{伄} can be seen as the abbreviated form of @litchar{􏿴伄}.


@subsection{Component}
@deftech{Component} is an ideograph or morphological unit used to construct another ideograph. e.g. Since @tt{伄 = 亻 + 弔}, both @zi[亻] and @zi[弔] are components of @zi[伄].


@subsection{Composition}
@deftech{Composition} is the formation of an ideograph or programming concept by combining two or more @tech{ideographic components} whose semantic or structural contributions are jointly interpreted.

Composition differs from @tech{Semantic Derivation} in that the constituent components may contribute distinct concepts or rules rather than one component simply modifying another.

Examples include:

@verbatim{
@tech{component}₁ + @tech{component}₂ + ... + @tech{component}ₙ
│
↓
Composition

亻 + 弔 → @zi[伄]
亻 + 􏴫 → @zi[􏳋]
􏴺 + 並 → @zi[􏳥]
毌 + 􏿴BR → @zi[􏿝]
又LB + 㐅 → @zi[􏿴]
}

The resulting form derives its interpretation from the systematic interaction of its components.


@subsection{Semantic Modifier}
A @deftech{Semantic Modifier} is an @tech{ideographic component} that modifies an existing semantic concept while preserving a systematic relationship with that concept.

A Semantic Modifier may modify dimensions such as semantic scope, extent, @tech{cardinality}, range, indexing convention, representation, or perspective.

For example:

@zi[*] expresses strengthening.
@zi[~] expresses weakening.
@zi[丨], @zi[丿], and @zi[丶] act as small semantic modifiers that derive closely related meanings from existing ideographs.

When a Semantic Modifier is applied to an ideograph, the resulting form constitutes a @tech{Semantic Derivation}.

@tt{@zi[阝] → @zi[􏴗]}, where @zi[丶] acts as a semantic modifier of @zi[阝].
@verbatim{
阝
↓
serial subset

阝 + 丶
↓
􏴗
↓
serial Rule subset with a modified range
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
human Rule-oriented indexed reference
}

@tt{@zi[𰁦] → @zi[攸]}, where @zi[丨] acts as a semantic modifier(more specificity called @tech{cardinality restriction}) of @zi[𰁦].


@subsection{Semantic Derivation}
@deftech{Semantic Derivation} is the derivation of an ideograph from another ideograph by applying one or more @tech{semantic modifiers}, resulting in a new ideograph whose meaning remains systematically related to the source ideograph.

Examples include:

@verbatim{
弔 + 丿 → @zi[𢎨]
弔 + 一 → @zi[􏴧]
阝 + 丶 → @zi[􏴗]
𰁦 + 丨 → @zi[攸]

Base Ideograph
+
Semantic Modifier
↓
Derived Ideograph

@zi[弓]
│
semantic derivation
│
└── 丨
↓
@zi[弔]
│
└── 丿
↓
@zi[𢎨]
}


@subsection{Structural Modifier}
A @deftech{Structural Modifier} is an @tech[#:key "Component"]{ideographic component} whose primary function is to specify or modify the structural or positional organization of @tech[#:key "Component"]{ideographic components} rather than their @tech{conceptual meaning}.

Structural Modifiers describe how an ideograph is formed, where a component occurs, or how components relate spatially or morphologically.

Examples include:

@zis[L R T B]
@zis[LB BR BL]
@zis[PFX SFX IFX]
@zis[RTT1 RTT2 RTT3]

These elements belong to the morphology of an ideograph rather than directly expressing an independent programming concept.

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

@subsection{Position Operator}
@deftech{Position Operator}: e.g. @zis[L R B T]

@subsection{Extent Operator}
@deftech{Extent Operator}: e.g. @zis[LB BR BL]

@subsection{Word-position Operator}
@deftech{Word-position Operator}: e.g. @zis[PFX SFX IFX]

@subsection{Rotation Operator}
@deftech{Rotation Operator}: e.g. @zis[  RTT1 RTT2 RTT3]

@subsection{General Type}
@deftech{General Type} is all the traditional types of what we call in Racket. e.g. @zis[􏿴 句 􏿰 勺]

@subsection{Minor Type}
A @deftech{Minor Type} is a fine-grained classification of a data structure or value based on structural or semantic properties that are more specific than conventional broad programming-language types.

Ming uses its @tech{ideographic morphology} to expose distinctions that would often remain implicit within conventional types.

For example, the distinction among:

@itemlist[
@item{pair;}
@item{list;}
@item{non-empty list;}
@item{association list;}
@item{list of lists;}
@item{list of strings;}
]

can be represented through systematically related ideographs rather than being treated merely as unrelated names. @zis[􏿫 􏿳 􏴳 􏴷] are all @tech{minor type}s of @tech{general type} of @zi[􏿴].

Minor Types therefore represent one of the consequences of Ming's semantic and morphological system: the naming system can express distinctions in data structure that conventional type categories often leave implicit.



@subsection{Minor-type Ideograph}
@deftech{Minor-type Ideograph} is a refined data-structure type distinguished by structural properties, element types, termination forms, nesting, cardinality, or other semantic invariants beyond a general data type.

e.g. @zis[􏿴 􏿫 􏿳 􏴳 􏴷].



@subsection{Cardinality}
@deftech{Cardinality} is the number or multiplicity of data units represented or produced by an ideograph. e.g.
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

@subsection{Cardinality Restriction}
@deftech{Cardinality Restriction} is one kind of @tech{Semantic Modifier} and specifically changes the base ideograph to constrains itts semantic parameterization. e.g. @zi[丨] in @zi[攸].

@subsection{Output Representation}
@deftech{Output Representation} is the form in which multiple output data are represented or returned. e.g.
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



@subsection{Morphological Structure}
The @deftech{Morphological Structure} of an ideograph is the organization of its constituent semantic, modifying, structural, and naming-rule components.

Morphological Structure determines how the components of an ideograph are interpreted in relation to one another.

This makes an ideograph more analogous to a morphologically constructed word than to an arbitrary identifier.

For example:

@verbatim{
@zi[伄] = 亻 + 弔
}

contains both a @tech{Naming Rule} and a @tech{Semantic Ideograph}. Its meaning is therefore obtained not simply by looking up @zi[伄] as an atomic symbol, but by interpreting the relationship between its components.



@subsection{Ideographic Morphology}

@deftech{Ideographic Morphology} is the overall system by which Ming constructs programming meanings through the composition, derivation, modification, and structural organization of ideographs.

It includes:

@itemlist[
@item{@tech{Semantic Ideographs};}
@item{@tech{Semantic Modifiers};}
@item{@tech{Structural Modifiers};}
@item{@tech{Naming Rules};}
@item{@tech{Semantic Derivation};}
@item{@tech{Composition};}
@item{and the @tech[#:key "conceptual meaning"]{semantic} and @tech[#:key "programmatic meaning"]{programmatic} relationships resulting from them.}

]

Ming's ideographic morphology is therefore not merely a visual notation system. It is a mechanism for systematically constructing and exposing relationships among programming concepts.

@subsection{Summary}
The terminology can be summarized as follows:

@verbatim{
Ideographic Morphology
│
├── Semantic Ideograph
│     └── Conceptual Meaning
│           └── Semantic Implication
│
├── Semantic Modifier
│     └── Semantic Derivation
│
├── Structural Modifier
│
├── Composition
│
└── Naming Rule
      └── Programmatic Meaning
            └── procedure/interface constraints
}
The central principle is that Ming does not merely assign Chinese characters to pre-existing programming-language concepts. It uses the morphological properties of ideographs to construct, relate, and constrain programming meanings.

In this sense, Ming's ideograph system is an ideographic morphological system for programming semantics.


@section{Prose Verbs}
@itemlist[
@item{Because of @tech{Composition}, we draw the verb @emph{compose}, e.g. @tt{􏿝 is composed of 毌 and 􏿴BR}, @tt{􏳋 is @emph{composed} of 亻 and 􏴫}.}
@item{Because of @tech{Naming Rule}, we draw the verb @emph{specify}, e.g. @tt{@zi[亻] @emph{specifies} the output has the same type as input.}}
@item{Because of @tech{Semantic Ideograph} and @tech{Semantic Implication}, we draw the verb @emph{imply}, e.g. @tt{@zi[弓] @emph{implies} the output is a number.}}
]


@section{core ideographs}
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
(list
(list @bold{Idepgraph} @bold{Role} @bold{Concept/Rule} @bold{Derived from})
(list @zi[亻] "naming rule" "same input/output type; output elements derived from input" "semantic borrowing")
(list @zi[阝] "naming rule" "serial subset; output same type, successive subset" "borrowed")
(list @zi[􏴗] "naming rule / modifier" "suffix-to-end subset" "阝-related")
(list @zi[􏴫] "semantic + naming rule" "sectionalization, exactly 2" "段")
(list @zi[􏴺] "semantic + naming rule" "sectionalization, multiple" "􏴫 + 一")
(list @zi[並] "semantic" "multiple values" "semantic extension of 并列")
(list @zi[弓] "semantic" "index" "glyph borrowing")
(list @zi[弔] "semantic" "indexed reference" "simplified/derived from 第")
(list @zi[𢎨] "semantic" "human-oriented indexed reference" "弔 + 丿")
(list @zi[彐] "semantic" "find" "simplified from 寻")
(list @zi[毌] "semantic" "append" "historical semantic inheritance")
(list @zi[双] "semantic / type" "pair" "又 + 又")
(list @zi[㐅] "semantic / type" "null" "derived borrowing")
(list @zi[􏿴] "minor type" "proper list" "又LB + 㐅")
(list @zi[􏿫] "minor type" "improper/list* structure" "又LB + 又")
(list @zi[􏿳] "minor type" "association list" "双RB + 㐅")
(list @zi[􏴳] "minor type" "list of lists" "又LB + 􏿴")
(list @zi[􏴷] "minor type" "list of strings" "􏿴LB + 句")
(list @zi[􏳋] "naming rule" "same-type sectional output" "亻 + 􏴫")
(list @zi[􏳥] "naming rule / representation" "sectional values" "􏴺 + 並")
(list @zi[􏿰] "type/data structure" "hash" "广 + 双")
)]