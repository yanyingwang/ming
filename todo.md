# λ extended
(入口 (displayln "aaa")) => (λ () (displayln "aaa")) 
(λ0 (displayln "aaa")) => (λ () (displayln "aaa")) 
(λ2 a b (displayln "aaa")) => (λ (a b) (displayln "aaa")) 

# nwe chars of 並
並示/並十 =单字=> 坐标的意思

# depths works with 􏿰
􏿰*^ => no matter how depths data are:
```racket
(􏿰*^
`([1 . 2]
  [3 . ([4 . 5]
        [6 . ([7  8]
              [9 10])])]))
```

# 人称代词的应用/he she it in let
发展出一种编程规范，在let等作用域内，变量用代词

