#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.penumbra-light,  
    styles: ergo-styles.classic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 237A Final",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)
#set enum(numbering: "(a)")
= ND//1
#problem[
  Lazarsfeld Problem Set 6 (4):

  Let $GG=GG(1,3)$ be the Grassmannian parametrizing lines in $PP^3$, and fix a line $ell_0 subset PP^3$. Let $Sigma subset GG$ be the subset of $GG$ corresponding to all lines meeting $ell_0$, so that (as we've seen before) $Sigma$ is a hyperplane section of $GG$.
  + Show that $Sigma$ has a unique singular point (at the point of $GG$ corresponding to $ell_0$). In fact, $Sigma'$ is a quardric $Q$ of rank $4$ in $PP^4$.
  + Let $Q subset PP^4$ be a quadric of rank $4$ in $PP^4$, with singular point $o in Q$. Let $Q'$ be the proper transform of $Q$ under the blowing up of $o in P^4$. Show that $Q'$ is non-singular, and that the fibre of $nu:Q'-->Q$ over $o$ is (isomorphic to) $PP^1 times PP^1$.d
  + Returning to the realization $Sigma$ of $Q$ in (a), define $Sigma' subset.eq GG times ell_0$ to be the incidence correspondance $Sigma' = {([ell], x) | x in ell sect ell_0}$. Show that $Sigma'$ is smooth (non-signular), and that the projection $mu:Sigma' --> Sigma$ is an isomorphism away from$[ell_0]$, while $mu^(-1)[ell_0]$ is a copy of $PP^1$. This map is called the "small resolution" of $Q=Sigma$.
][
  
]

\ 

= ND//2
#problem[
  Lazarsfeld Problem Set 7 (1):

  Let $X subset.eq CC^3$ be the hypersurface $x^2+y^4+z^4=0$, and denote y $X' subset.eq Bl_(0)(CC^3)$ the proper transform of $X$ under the blowing up of the origin. Show that $X$ has an isolated singularity, but that $X'$ is singular along a curve.
][]

\ 

= ND//3
#problem[
  Hartshorne 5.1:

  Locate the singular points and sketch the following curves in $AA^2$ (assume $Char(k)!= 2$). Which is which in Figure 4?
  + $x^2=x^4+y^4$
  + $x y=x^6+y^6$
  + $x^3 = y^2+x^4+y^4$
  + $x^2y+x y^2=x^4+y^4$
  #figure(
  image("hartshorne 5.1.png", width: 80%)
  )
][]

\ 

= ND//4
#problem[
  Hartshorne 5.2:

  Locate the singular points and describe the singularities of the following surfaces in $AA^3$ (assume $Char(k)!=2$). Which is which in Figure 5?
  + $x y^2=z^2$
  + $x^2+y^2=z^2$
  + $x y+x^3+y^3=0$
  #figure(
  image("hartshorne 5.2.png", width: 80%)
  )
][]

\ 

= ND//5
#problem[
  Hartshorne 5.3:

  #emph[Multiplicities]. Let $Y subset.eq AA^2$ be a curve defined by the equation $f(x,y)=0$. Let $P=(a,b)$ be a point of $AA^2$. Make a linear change of coordinates so that $P$ becomes the point $(0,0)$. Then write $f$ as a sum $f=f_0+f_1+...+f_d$, where $f_i$ is a homogeneous polynomial of degree $i$ in $x$ and $y$. Then we define the #emph[multiplicity] of $P$ on $Y$, denoted $mu_(P)(Y)$, to be the least $r$ such that $f_1!=0$ (Note that $P in Y <==> mu_(P)(Y) >0$). The linear factors of $f_r$ are called the #emph[tangent directions] at $P$.
  + Show that $mu_(P)(Y)=1 <==> P$ is a nonsingular point of $Y$.
  + Find the multiplicity of each of the singular points in Exercise 5.1 (#text(weight: "bold")[Problem 3]) above.
][]

\ 

= ND//6
#problem[
  Hartshorne 5.6:

  #emph[Blowing Up Curve Singularities:]
  + Let $Y$ be a cusp or node of Exercise 5.1 (#text(weight: "bold")[Problem 3]. Show that the curve $tilde(Y)$ obtained by blowing up $Y$ at $O=(0,0)$ is non=singular (cf. Hartshorne (4.9.1) and (Exercise 4.10)).
  + We define a #emph[node] (also called  #emph[ordinary double point]) to be a double point (i.e. a point of multiplicity 2) of a plane curve with distinct tangent directions (Exercise 5.3, #text(weight: "bold")[Problem 5]). If $P$ is a node on a plane curve $Y$, show that $phi^(-1)(P)$ consists of two distinct nonsingular points on the blown-up curve $tilde(Y)$. We say that "blowing up $P$ resolves the singularity at $P$".
  + Let $P in Y$ be the tacnode of (Exercise 5.1, #text(weight: "bold")[Problem 3]). If $phi:tilde(Y) -> Y$ is the blowing-up at $P$, show that $phi^(-1)(P)$ is a noe. Using (b) we see that the tacnode can be resolved by two successive blowings-up.
  + Let $Y$ be the plane curve $y^3=x^5$, which has a "higher order cusp" at $O$. Show that $O$ is a triple point; that blowing up $O$ give rise to a double point (what kind?) and that one further blowing up resolves the singularity.

  Note: We will see late (V, 3.8) that any singular point of a plane curve can be resolved by a finite sequence of successive blowings-up.
][]

\ 

= ND//7
#problem[
  Hartshorne 5.7:

  Let $Y subset.eq PP^2$ be a non-singular plane curve of degree $>1$, defined by the equation $f(x,y,z)=0$. Let $X subset.eq AA^3$ be the affine variety defined by $f$ (this is the cone over $Y$; see (Exercise 2.10)). Let $P$ be the point $(0,0,0)$, which is the #emph[vertex] of the cone. Let $phi:tilde(X)->X$ be the blowing-up of $X$ at $P$.
  + Show that $X$ has just one singular point, namely $P$.
  + Show that $tilde(X)$ is non-singular (cover it with open affines).
  + Show that $phi^(-1)(P)$ is isomorphic to $Y$.
][]

\ 

= ND//8
#problem[
  Hartshorne 5.11:

  #emph[The Elliptic Quarter Curve in $PP^3$:] Let $Y$ be the algebraic set in $PP^3$ defined by the equations $x^2-x z-y w=0$ and $y z-x w-z w=0$. Let $P$ be the point $[x,y,z,w]=[0,0,0,1]$, and let $phi$ denote the projection from $P$ to the plane $w=0$. Show that $phi$ induces an isomorphism of $Y\\{P}$ with the plane cubic curve $y^2z-x^3+x z^2=0$ minus the point $[1,0,-1]$. Then show that $Y$ is an irreducible non-singular curve. It is called the #emph[elliptic quartic curve in $PP^3$]. Since it is defined by two equations it is another example of complete intersection (Exercise 2.17).
][]