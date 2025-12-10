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

#pagebreak()

= D//3
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
][
  + Given the equation $f(x,y)=x^4-x^2+y^4$, the singular points occurred at where all the partial derivatives are $0$. Which, one has $(partial f)/(partial x) = 4x^3 - 2x = 0$ (which occurred at $x=0$, and $4x^2-2=0$ /  $x^2 = 1/2$); also, one has $(partial f)/(partial y) = 4y^3 = 0$ (which occurred at $y=0$). Hence, the points where all partial derivatives vanished include $(x,y)=(0,0), (z_1,0), (z_2,0)$ (where $z_1,z_2 in k$ satisfy $z_1^2=z_2^2=1/2$).

    Out of these points, only $(0,0)$ is a solution to $f(x,y)$ (since if $z=z_1,z_2$, one has $z^2 = 1/2$, so $f(z,0) = z^4-z^2+0^4 = 1/4-1/2 = -1/4 !=0$). So, the only singular point on the curve is $(0,0)$.

    \ 

    Which, if limited to $k = RR$, given that $(x,y)$ is a solution to $f$, one also has $(x,-y), (-x,y), (-x,-y)$ being solutions to $f$ (since all $x,y$ in $f$ has even power, so the $-1$ doesn't impact the solution), this implies that $x$ is invariant under reflection over $x$ and $y$ axis, showing the only possible graph is the Tacnode.
    #figure(
      image("p3_tacnode.png", width: 20%)
    )

    \ 

    \ 

  + Given the equation $g(x,y) = x^6-x y+y^6$, the singular points occurred at where all partial derivatives are $0$. Which, $(partial g)/(partial x)=6x^5 - y=0$ (where $y=6x^5$), and $(partial g)/(partial y)=6y^5 - x$ (where $x = 6 y^5$). This indicates that $x = 6^6 dot x^25$, so either $x = 0$ (indicating $y=0$ also), or $x^(24) = 1/(6^6)$ (which this has no inconsistency; notice that $y$ also satisfies $6^6 dot y^25 = y$, so $y=0$ or $y^(24) = 1/6^6$; with $y = 6x^5$, $y^24 = 6^24 dot (x^24)^5 = 6^24 dot (1/6^6)^5 = 6^24/6^30 = 1/6^6$). So, points where partial derivatives all vanished include $(x,y)= (0,0)$, and $(x,y) = (z, 6z^5)$ (where $z$ is a solution to the equation $z^24 = 1/6^6$).

    Out of these points, the only one that is a solution to $g(x,y)$ is $(0,0)$ (since $(z,6z^5)$ has $f(z,6z^5) = z^6 - z dot 6z^5 + (6 z^5)^6 = z^6 - 6z^6 + 6^6 dot z^24 dot z^6 = z^6 - 6z^6 + z^6 = -4z^6 !=0$). So, the only singular point on the curve is $(0,0)$.

    \ 

    If limited to $k=RR$ again, if $(x,y)$ is a solution to $g$, one also has $(-x,-y)$ being a solution to $g$ (since the homogeneous degrees of each monomials are all even). Hence, the only possible curves are the Node or the Tacnode (since it's invariant under rotation by radian $pi$); yet, because $(-x,y)$ is not a solution for most $x,y !=0$ (since if $(x,y)$ is a solution to $g$, one has $x^6 + y^6 = x y!=0$, then $x^6+y^6 != -x y$, showing $(-x)^6 - (-x)y + y^6!=0$). So, the curve is not invariant under he reflection over $y$-axis, showing it's not a Tacnode. Hence, it must be a Node.
    #figure(
      image("p3_node.png", width: 20%)
    )

    \ 

    \ 

  + Given the equation $h(x,y) = x^4-x^3+y^4+y^2$, the singular points occurred at where all partial derivatives vanishes. Which, $(partial h)/(partial x)= 4x^3-3x^2=0$ (where $x=0$ or $x=3/4$), and $(partial h)/(partial y)=4y^3 + 2y = 0$ (where $y=0$, or $y^2 = -1/2$). Hence, let $z_1,z_2 in k$ satisfy $z_1^2=z_2^2 = -1/2$, the points where all partial derivatives vanished include $(0,0), (0,z_1), (0,z_2), (3/4,0), (3/4,z_1)$, and $(3/4,z_2)$. 

    However, only $(0,0)$ is actually a solution to $h(x,y)$ (for $(0,z_1), (0,z_2),$ and $(3/4,0)$, it's clear that plugging in creates equation of only $x$ or $y$, but none of the numbers are solutions; also, $h(3/4, z_1) = 81/256 - 27/64 + 1/4 - 1/2 != 0$). So, the only singular point on the curve is $(0,0)$.

    \ 

    If limit to $k=RR$, if $(x,y)$ is a solution to $h$, then $(x,-y)$ is also a solution to $h$ (since all terms include $y$ with even degree), this indicates the solution curve is invariant under reflection by $x$-axis, which can only be a Cusp or a Tacnode; yet, in general for $x,y!=0$, if $(x,y)$ is a solution, $(-x,y)$ is not (for instance, take $(x,y)=1,0$, one has $h(1,0) = 1^4-1^3+0^4+0^2 = 0$, yet $h(-1,0) = (-1)^4 - (-1)^3+0^4+0^2 = 2!=0$), so the curve is not invariant under reflection by $y$-axis, showing it can't be a Tacnode. Hence, it's a Cusp.
    #figure(
      image("p3_cusp.png", width: 20%)
    )

    \ 

    \ 

  + For $l(x,y) = x^4-x^2y-x y^2+y^4$, the singular points occurred at where all partial derivatives vanished. Which, $(partial l)/(partial x)=4x^3 - 2x y - y^2 = 0$, and $(partial l)/(partial y) = 4y^3 - x^2 - 2 x y = 0$. Which, using these equations, a singular on a curve also needs to satisfy $y^2 = 4x^3 - 2x y$, and $y^3 = x^2/4+ (x y)/2$. Plugin $y^2 = 4x^3 - 2x y$ to $l(x,y)$, one has the singular points satisfy:
    $ -3x^4 + x^2y + y^4=0 $
    Now, substituting $y^3 = x^2/4+ (x y)/2$ in, one also has:
    $ -4x^4 + x^2y=0 ==> x^2(y-4x^2)=0 $
    So, there are two outcomes:
    - If $x=0$, this enforces $y=0$ (since $y^2=4x^3-2x y = 0$). Which, $(0,0)$ is indeed a singular point (since $l(0,0)=0$, while the partial derivatives also vanished).
    - Else, if $x!=0$, then $y = 4x^2$ instead. Plugin this to $(partial l)/(partial x)$, one has:
      $ 4x^3 - 8x^3 - 16x^4 = 0 ==> -4x^3(4x+1)=0 $
      Hence, either $x=0$ (which is ruled out in this case), or $x=-1/4$. Then, $y=4x^2$ implies $y = 1/4$. Yet, $(x,y)=(-1/4,1/4)$ is not a singular point, since $l(-1/4,1/4) = 1/256 - 1/64 + 1/64 + 1/256 = 1/128 != 0$, so it's not on the curve.

    Hence, the only singular point on the curve is $(0,0)$.

    \ 

    When limit to $k=RR$, notice that if $(x,y)$ is a solution to $l$, then so is $(y,x)$ (since each $x^p y^q$ involved in $l(x,y)$, one also has $y^p x^q$ involved in it), so it's invariant under reflection about the line $y=x$, so the only possibilities are Node and Triple Point. Yet, in general if $(x,y)$ is a solution, $(-x,-y)$ need not be a solution: Take $(x,y)=(1,1)$, $l(1,1) = 1-1-1+1 = 0$, yet $l(-1,-1) = 1+1+1+1=4!=0$, showing $(-1,-1)$ is not a solution. Hence, it's not invariant under the rotation by radian $pi$, which can't be a Node. So, it must be a Triple Point.
    #figure(
      image("p3_triple point.png", width: 20%)
    )

]

#pagebreak()

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