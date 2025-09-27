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

= D//1
#problem[
  Show that $GL_n (RR)$ has a smooth manifold structure.
][
  First, wel'll view $GL_n (RR) subset.eq M_n (RR) = RR^(n^2)$ (as $RR$-vector space). Then, if consider the determinant function $det:M_n (RR)arrow.r RR$, it is precisely a polynomial function in terms of the $n^2$ entries of the $n times n$ matrices in $M_n (RR)$. Which, since polynomial functions are smooth, then the preimage of any open set under $det$ function is guaranteed to be open also. 

  Since for all $A in M_n (RR)$, we have $A in GL_n (RR) <==> det(A) != 0$, then $GL_n   (RR) = det^(-1)(RR\\{0})$, which since $RR\\{0}$ is an open set in $RR$, so is $GL_n (RR) subset.eq M_n (RR)$ under the standard topology of $M_n (RR)$ (as $RR^(n^2)$).

  \ 

  Now, since $M_n (RR)=RR^(n^2)$ is a finite dimensional $RR$-vector space, then $GL_n (RR)$ as an open subset of it, then for every $A in GL_n (RR)$ there exists radius $r>0$, such that $B_r (A) subset.eq GL_n (RR)$ (where the open ball $B_r (A)$ uses Euclidean Norm), then the identity function $id:B_r (A) arrow.r.tilde B_r (A)$ is precisely the homeomorphism of an open neighborhood of $A$ in $GL_n (RR)$, to an open neighborhood in $M_n (RR) = RR^(n^2)$, and all transition maps are simply the composition of restrictions of identity function, hence is smooth. This shows that $GL_n (RR)$ has a smooth manifold structure, and with dimension $n^2$. 
]

#pagebreak()

= ND//2
#problem[
  Show that $SL_n (RR)$ has a smooth manifold structure.
][

]

#pagebreak()

= ND//3
#problem[
Solve #text(weight: "bold")[Exercise 1.10] in the lecture notes for smooth manifolds, the prove #text(weight: "bold")[Prop 1.18] (You don't need to do this for $C^k$ / analytic cases).

\ 

#text(weight: "bold")[Exercise 1.10 (Modified):]

Let $f_1,...,f_m$ be functions $RR^n arrow.r RR$ which are smooth. Let $X subset RR^2$ be the set of points $P$ such that $f_i(P)=0$ for all $i$, and $d f_i(P)$ are linearly independent. Use the implicit function theorem to show that $X$ is a topological manifold of dimension $n-m$ and equip it with a natural smooth structure.


\ 

#prop(1.18)[If $F$ is a submersion then for any $Q in Y$, $F^(-1)(Q)$ is a manifold of dimension $dim X - dim Y$.][]
][

]

#pagebreak()

= ND//4
#problem[
  Let $X$ be ${(x,y,t) in RR^3 | x^3+y^3+3t x y +1=0}$, show that $X$ has a smooth manifold structure. Now let $Y$ be the real line with coordinate $t$, and let $F:X arrow.r Y$ be the map sending $(x,y,t)$ to $t$. Show that $F$ is not a submersion, but the restriction of $F$ to the open set $t!=1$ is a submersion. What does $F^(-1)(1)$ look like?
][

  #text(weight: "bold")[1. Smooth Manifold Structure of $X$:]

  If consider the function $f:RR^3 arrow.r RR$ defined by $f(x,y,t) = x^3+y^3-3t x y+1$, then $X = f^(-1)(0)$ by definition. Which, if consider the differential $d f = mat(3x^2-3t y, 3y^2 - 3 t x, -3x y)$, we'll prove that $d f != 0$ for all $p in X$.

  Suppose the contrary that $d f_p = 0$ for some $p=(x,y,t) in X$, then $-3x y = 0$, showing that $x=0$ or $y=0$; for definiteness, say $x=0$, then the second entry $0=3y^2-3t x= 3y^2$, showing $y=0$ (else if $y=0$, one can deduce $0=3x^2-3t y=3x^2$, or $x=0$ through the first entry instead). Hence, $x=y=0$. But, if plug in $p=(0,0,t)$ to the given polynomial, we get $x^3+y^3-3t x y+1 = 1!=0$, which $p=(0,0,t)$ is not a solution to the given polynomial, hence $p in.not X$, contradicting the assumption that $p in X$. Therefore, $d f_p !=0$ for all $p in X$, hence $d f_p$ (as a single vector) is linearly independent for all $p in X$. Apply #text(weight: "bold")[Example 1.10] mentioned in #text(weight: "bold")[Problem 3] (where $f_1 := f$), we conclude that $X = f^(-1)(0)$ (every point $p in RR^3$ satisfying $f_1(p)=f(p)=0$) endows a smooth manifold structure, with dimension $3-1=2$.

  \ 

  #text(weight: "bold")[2. Submersion Property of $F$:]

  Given $Y$ as the real line with coordinate $t$, and let $F:X arrow.r Y$ be defined by $F(x,y,t)=t$.
]

#pagebreak()

= D//5
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