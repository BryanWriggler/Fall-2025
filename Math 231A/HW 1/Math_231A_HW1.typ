#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.1.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: "bootstrap",  
    headers: "classic", //"tab" for upper bar, classic for the one I used, sidebar for the emphasis on the left
    all-breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 231A HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

=//1
#problem[
  Show that $GL_n (RR)$ has a smooth manifold structure.
][
  
]

#pagebreak()

= //2
#problem[
  Show that $SL_n (RR)$ has a smooth manifold structure.
][

]

#pagebreak()

= //3
#problem[
Solve #text(weight: "bold")[Example 1.10] in the lecture notes for smooth manifolds, the prove #text(weight: "bold")[Prop 1.18] (You don't need to do this for $C^k$ / analytic cases).

\ 

#example(1.10)[]

\ 

#prop(1.18)[][]
][

]

#pagebreak()

= //4
#problem[
  Let $X$ be ${(x,y,t) in RR^3 | x^3+y^3+3t x y +1=0}$, show that $X$ has a smooth manifold structure. Now let $Y$ be the real line with coordinate $t$, and let $F:X arrow.r Y$ be the map sending $(x,y,t)$ to $t$. Show that $F$ is not a submersion, but the restriction of $F$ to the open set $t!=1$ is a submersion. What does $F^(-1)(1)$ look like?
][

]

#pagebreak()

= //5
#problem[
  Prove the chain rule stated at the beginning of page 17 of the lecture notes:

  Given $F:X arrow.r Y$ and $G:Y arrow.r Z$ that are regular maps between manifolds of same reglarity, then:
  $ d(G compose F)_P = d G_(F(P)) compose d F_P $
][
  By definition, $d(G compose F)_P:T_P X arrow.r T_(G compose F(P))Z$ is a linear map satisfying $(d(F compose G)_P dot v)(f) = v(f compose (G compose F))$ for all derivation $v in T_P X$, and all class of regular function $f in O_(G compose F(P))$.

  Similarly, $d F_P:T_P X arrow.r T_(F(P))Y$ satisfies $(d F_P dot v)(g) = v(g compose F)$ for all derivation $v in T_P X$ and all class of regular function $g in O_(F(P))$; also, $d G_(F(P)):T_(F(P))Y arrow.r T_(G(F(P)))Z$ satisfies $(d G_(F(P)) dot u)(h) = u(h compose G)$ for all derivation $u in T_(F(P))Y$ and class of regular function $h in O_(G compose F(P))$.

  \ 

  By associativity of function composition, given $f in O_(G compose F(P))$ and $v in T_P X$, the first term $(d (G compose F)_P dot v)(f)=v(f compose (G compose F))$ can be rewritten as:
  $ v((f compose G) compose F) = (d F_P dot v)(f compose G) $
  This is due to the fact that $f compose G$ is a class of regular function in $O_(F(P))$. Then again, since $f$ is a class of regular function in $O_(G compose F(P))$, and $d F_P dot v in T_(F(P)) Y$, using the same argument, we have:
  $ (d F_P dot v)(f compose G) = (d G_(F(P)) dot (d F_P dot v))(f) = (d G_(F(P)) compose d F_P (v))(f) $
  Hence, we get $(d (G compose F)_P dot v)(f) = (d G_(F(P)) compose d F_P(v))(f)$, showing that $d(G compose F)_P = d G_(F(P)) compose d F_P$.
]