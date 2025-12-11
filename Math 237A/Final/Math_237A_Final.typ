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

#pagebreak()

= D//2
#problem[
  Lazarsfeld Problem Set 7 (1):

  Let $X subset.eq CC^3$ be the hypersurface $x^2+y^4+z^4=0$, and denote $X' subset.eq Bl_(0)(CC^3)$ the proper transform of $X$ under the blowing up of the origin. Show that $X$ has an isolated singularity, but that $X'$ is singular along a curve.
][

  #text(weight: "bold")[I. Isolated Singularity of $X$:]

  Consider th partial derivatives of the defining equation $f(x,y,z) = x^2+y^4+z^4$, one has $(partial f)/(partial x)=2x$, $(partial f)/(partial y)=4y^3$, and $(partial f)/(partial z)=4z^3$. Which, the singularity happens when all three partial derivatives vanished, which requires $2x=4y^3=4z^3=0$, showing $x=y=z=0$. Hence, the only singularity of $X$ is $(x,y,z)=(0,0,0)$.

  \ 

  #text(weight: "bold")[II. Singularity of Proper Transform:]

  If consider the blowing up of $CC^3$ at the origion, it is given by $Bl_0 CC^3 subset CC^3 times PP^2$, where $Bl_0 CC^3 = {(overline(x), [ell]) | overline(x) in ell}$ (where $overline(x)=(x,y,z)$ is a point of the $1$-dimensional subspace $ell subset CC^3$). If expresses $[ell] = [X',Y,Z]$, then $overline(x) in ell$ implies $(x,y,z)$ is some multiple of $(X',Y,Z)$, hence the matrix $mat(x,y,z;X,Y,Z)$ has rank $<=1$. Which, on the open set $Z!=0$ (WLOG $Z=1$), $Bl_0 CC^3$ has $(overline(x), [ell])$ satisfy $overline(x)=(x,y,z)$ and $[ell] = (X,Y,1)$ being linearly dependent, showing $x = z X$ and $y = z Y$. Which, it can be described by the affine chart $(X, Y, z)$, with projection onto $CC^3$ given by $(X,Y,z) mapsto (X z,Y z, z)$.

  Notice that under this affine chart, the defining equation $f=x^2+y^4+z^4$ pulls back to $z^2 X^2 + z^4 Y^4 + z^4 = z^2(X^2+z^2Y^4 + z^2) = 0$. Which, excluding the exceptional divisor's equation $z^2$, the defining equation is $f_z = X^2 + z^2 Y^2 + z^2 = 0$. Which, to find singular points, its partial derivatives are given as follow:
  $ (partial f_z)/(partial X) = 2X, quad (partial f_z)/(partial Y) = 2 Y z^2, quad (partial f_z)/(partial z) = 2z(1+Y^2) $
  Which, if all three partial derivatives vanish, one has $X=0$ (for $partial X$), $Y=0$ or $z=0$ (for $partial Y$), $z=0$ or $Y^2=-1$ (for $partial z$).

  Which, all the points of the form $X=z=0$ has all partial derivatives vanished, also $f_z (0,Y,0) = 0^2 + 0^2 dot Y^2 + 0^2 = 0$, showing these points are contained in the proper transform. Hence, the proper transform is non-singular, and within the affine chart (where $Z!=0$), one has all $(0,Y,0)$ (where $Y in k$) being singular. Hence, the proper transform is singular along a curve.
]

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

= D//4
#problem[
  Hartshorne 5.2:

  Locate the singular points and describe the singularities of the following surfaces in $AA^3$ (assume $Char(k)!=2$). Which is which in Figure 5?
  + $x y^2=z^2$
  + $x^2+y^2=z^2$
  + $x y+x^3+y^3=0$
  #figure(
  image("hartshorne 5.2.png", width: 80%)
  )
][
  + Given $f(x,y,z) = x y^2-z^2$, its singular points occurred as all partial derivatives vanished. Which, $(partial f)/(partial x)=y^2 = 0$ implies $y=0$, $(partial f)/(partial y)=2x y=0$ implies $x=0$ or $y=0$, and $(partial f)/(partial z)=-2z=0$ implies $z=0$. So, the partial derivatives all vanished when $(x,y,z)=(x,0,0)$.

    Also, for any points of this form, it satisfies $f(x,0,0) = x dot 0^2-0^2 = 0$, hence any point of this form is on the surface, which is a singular point. So, all singular points are of the form $(x,0,0)$ (where $x in k$).

    \ 

    If consider $k=RR$, then since the surface has a whole line worth of singularities, it must either be a double line, or a Pinch point; also, since if $(x,y,z)$ is a solution, one als has $(x,-y,z)$ being a solution (since the term involving $y$ has even power of $y$). Hence, the curve is invariant when reflecting by the $x z$-plane, which cannot be the Double line in this case. Hence, it is the Pinch point.
    #figure(
      image("p4 pinch.png", width: 20%)
    )

    \ 

    \ 

  + Given $g(x,y,z)=x^2+y^2-z^2$, its singular points occurred where all partial derivatives vanished. So, $(partial g)/(partial x)=2x=0$ (implying $x=0$), $(partial g)/(partial y)=2y=0$ (implying $y=0$), and $(partial g)/(partial z)=2z=0$ (implying $z=0$). Hence, the only possible singular point is $(0,0,0)$ (which is also on the curve, so it's actually a singular point.

    \ 

    for $k=RR$, since it only has a singular point, it must be the Conical Double Point (also, for each fixed $z$, $x,y$ satisfy the equation for a circle, hence the intersection with a horizontal plane is always a circle).
    #figure(
      image("p4 conical.png", width: 20%)
    )

    \ 

    \ 

  + Given $h(x,y,z)=x y+x^3+y^3$, the singular points occurred when the partial derivatives are all vanishing. Hence, $(partial h)/(partial x)=y+3x^2 = 0$, showing $y=-3x^2$; $(partial h)/(partial y) = x+3 y^2 = 0$, showing $x = -3 y^2$; $(partial h)/(partial z)=0$, which doesn't impose extra restriction. Plugin the equations to $h(x,y,z)$, one gets the following:
    $ -3y^3 - 27 y^6 + y^3 = 0 ==> y^3(27 y^3 + 2)=0 $
    S, either $y=0$ (which implies $x=0$), or $y^3 = -2/27$. Which, the two potential collections of singular points, are $(0,0,z)$ (where $z=k$), or $(-3y^2, y, z)$ (where $z in k$, and $y$ satisfies $y^3 - 2/27$).

    The first collection $(0,0,z)$ is guaranteed to be singular points, since $h(0,0,z) = 0$ (all entries are $x,y$), while the second one is not singular (since if $y^3=-2/27$ and $x=-3y^2$, with the equation $y=-3x^2$, one needs $y = -27 y^4$, so $y(27 y^3+1)=0$, hence $y!=0$ implies $y^3 = -1/27$, which contradicts the assumption that $y^3=-2/27$). So, the only singular points are $(0,0,z)$ (where $z in k$).

    \ 

    Consider $k=RR$, then since the whole $z$-axis is singular, then it must be the Double line.
    #figure(
      image("p4 double line.png", width: 20%)
    )

]

#pagebreak()

= D//5
#problem[
  Hartshorne 5.3:

  #emph[Multiplicities]. Let $Y subset.eq AA^2$ be a curve defined by the equation $f(x,y)=0$. Let $P=(a,b)$ be a point of $AA^2$. Make a linear change of coordinates so that $P$ becomes the point $(0,0)$. Then write $f$ as a sum $f=f_0+f_1+...+f_d$, where $f_i$ is a homogeneous polynomial of degree $i$ in $x$ and $y$. Then we define the #emph[multiplicity] of $P$ on $Y$, denoted $mu_(P)(Y)$, to be the least $r$ such that $f_r!=0$ (Note that $P in Y <==> mu_(P)(Y) >0$). The linear factors of $f_r$ are called the #emph[tangent directions] at $P$.
  + Show that $mu_(P)(Y)=1 <==> P$ is a nonsingular point of $Y$.
  + Find the multiplicity of each of the singular points in Exercise 5.1 (#text(weight: "bold")[Problem 3]) above.
][
  + First, one knows that $P$ is nonsingular $<==>$ at least one of the partial derivatives of $f$ is non-vanishing (so, one of $(partial f)/(partial x), (partial f)/(partial y)$ is nonzero at $P = (0,0)$). Which, this is equivalent to having one of the $(partial f)/(partial x), (partial f)/(partial y)$ endowed with nonzero constant term.

    Which, notice that given any homogeneous monomial $x^p y^q$ of degree $p+q$, its partial derivative of $x$ is $p dot x^(p-1) y^q$ with degree $(p+q-1)$ (if the result is nonzero), while its partial derivative of $y$ is $q dot x^(p) y^(q-1)$ with degree $(p+q-1)$ again (if the result is nonzero). Hence, given a homogeneous polynomial $f_n$ of degree $n$, if its partial derivative (with respect to any variable $x_i$) is nonzero, then $(partial f_n)/((partial x_i))$ is of homogeneous degree $n-1$. Hence, $(partial f)/(partial x) = sum_(i=1)^d (partial f_i)/(partial x)$ and $(partial f)/(partial y) = sum_(i=1)^d (partial f_i)/(partial y)$, where each nonzero $(partial f_i)/(partial x), (partial f_i)/(partial y)$ is of homogeneous degree $i-1$.

    \ 

    $==>:$ If $mu_P (Y) = 1$, this implies the term $f_1 !=0$, hence $f_1 = a x+b y$ for some $a, b in k$ (where one of them is nonzero). For definiteness, say $a!=0$, hence $(partial f)/(partial x)$ contains constant term $ (partial f_1)/(partial x)=a!=0$, showing $(partial f)/(partial x)!=0$ at $P=(0,0)$.

    $<==:$ Suppose $P$ is a nonsingular point, then we know one of the $(partial f)/(partial x), (partial f)/(partial y)$ has nonzero constant term. For definiteness say $(partial f)/(partial x) = sum_(i=1)^d (partial f_i)/(partial x)$ has nonzero constant term, then $(partial f_1)/(partial x) = a$ for some nonzero $a in k$. Hence, one must have $f_1 = a x+b y$ for some $b in k$, showing $f_1 !=0$, or $mu_P (Y) = 1$ (since $P in Y$ implies $mu_P (Y)>0$ implies $f_0 = 0$, so $f_1 !=0$ implies $mu_P (Y)=1$).

    \ 

    \ 

  + In 5.1 (#text(weight: "bold")[Problem 3]), it turns out that all four curves in $AA^2$ only contain $(0,0)$ as their only singular point. Which, one has the following:
    - For $Y$ defined by $x^4+y^4 - x^2=0$, the smallest degree homogeneous polynomial is $-x^2$, hence $mu_((0,0))(Y) = 2$.
    - For $Y$ defined by $x^6+y^6-x y=0$, the smallest degree homogeneous polynomial is $-x y$, hence $mu_((0,0))(Y)=2$.
    - For $Y$ defined by $x^4+y^4 - x^3 + y^2$, the smallest degree homogeneous polynomial is $-y^2$, hence $mu_((0,0))(Y)=2$.
    - For $Y$ defined by $x^4+y^4 - x^2y-x y^2=0$, the smallest degree homogeneous polynomial is $-x^2y-x y^2$, hence $mu_((0,0))(Y) = 3$.
]

#pagebreak()

= ND//6
#problem[
  Hartshorne 5.6:

  #emph[Blowing Up Curve Singularities:]
  + Let $Y$ be a cusp or node of Exercise 5.1 (#text(weight: "bold")[Problem 3]). Show that the curve $tilde(Y)$ obtained by blowing up $Y$ at $O=(0,0)$ is non-singular (cf. Hartshorne (4.9.1) and (Exercise 4.10)).
  + We define a #emph[node] (also called  #emph[ordinary double point]) to be a double point (i.e. a point of multiplicity 2) of a plane curve with distinct tangent directions (Exercise 5.3, #text(weight: "bold")[Problem 5]). If $P$ is a node on a plane curve $Y$, show that $phi^(-1)(P)$ consists of two distinct nonsingular points on the blown-up curve $tilde(Y)$. We say that "blowing up $P$ resolves the singularity at $P$".
  + Let $P in Y$ be the tacnode of (Exercise 5.1, #text(weight: "bold")[Problem 3]). If $phi:tilde(Y) -> Y$ is the blowing-up at $P$, show that $phi^(-1)(P)$ is a node. Using (b) we see that the tacnode can be resolved by two successive blowings-up.
  + Let $Y$ be the plane curve $y^3=x^5$, which has a "higher order cusp" at $O$. Show that $O$ is a triple point; that blowing up $O$ give rise to a double point (what kind?) and that one further blowing up resolves the singularity.

  Note: We will see late (V, 3.8) that any singular point of a plane curve can be resolved by a finite sequence of successive blowings-up.
][
  We'll consider the blowing-up as the proper transform of the albegraic sets. under the blowing-up $Bl_0 AA^2 = {(overline(x), [ell]) in AA^2 times PP^1 | overline(x) in [ell]}$ (where $[ell] = [X,Y]$ represents a $1$-dimensional subspace in $AA^2$, and with $overline(x) = (x,y)$, they satisfy $mat(x,y;X,Y)$ has rank $<=1$), and the projection $phi:Bl_0 AA^2 -> AA^2$.

  \ 

  + #text(weight: "bold")[Cusp (Need some tweak):] It's corresponding to the equation $f=x^4-x^3+y^4+y^2=0$. 
    
    Under the open subset $U_X$ (where $X!=0$, WLOG say $X=1$), since $(x,y)$ is a scalar multiple of $[1,Y]$, then $y = x Y$, so the local description of the chart is $(x, Y)$ (which $U_X sect Bl_0 AA^2 tilde.equiv AA^2$). And, under the projection $phi:U_X sect Bl_0 AA^2 -> AA^2$, one has $phi(x,Y) = (x,x Y) = (x,y) = overline(x)$.

    Which, the equation pulls back to $x^4 - x^3 + x^4Y^4 + x^2Y^2 = x^2(x^2-x+x^2Y^4+Y^2)=0$. With $x^2$ defines the exceptional divisor, the equation is $f_X = x^2-x+x^2Y^4 + Y^2 = 0$. For any singular points, it has the following relations:
    $ &(partial f_X)/(partial x)=2x-1++2x Y^4 = 0 ==>2x (1+Y^4)=1\ 
    &(partial f_X)/(partial Y)=4x^2Y^3 + 2Y=0 ==> 2Y(2x^2Y^2 +1)=0 $
    This indicates that $x!=0$ and $Y^4!=-1$ (for the first equation to hold). There are two casees: 
    
    First, if $Y=0$, then plugin the first partial reads $2x=1$, or $x=1/2$. Yet, plugin $(x,Y)=(1/2,0)$ to $f_X$, it reads $1/2^2-1/2+ 0 = -1/4!=0$, so such point is not in the proper transform. 
    
    Second, if $2x^2Y^2 +1=0$ (or $2x^2Y^2 = -1$), then both $x,Y!=0$, and one reads $Y^2=-1/(2x^2)$, and one also has $1+Y^4 = 1/(2x)$, or $Y^4 = 1-1/(2x)$. Plugin to $f_X$, it simplifies to the following:
    $ f_X = x^2-x+x^2Y^4+Y^2 = x^2-x+x^2(1-1/(2x)) - 1/(2x^2) = 1/(2x^2)(4x^4-2x^3-1)=0 $
    Hence, $4x^4-2x^3-x-1=0$, if the point is on the proper transform, it satisfies this equation. 

    \ 

    Under the open subset $U_Y$ (where $Y!=0$, again WLOG $Y=1$), since $(x,y)$ is some multiple of $[X,1]$, then $x= y X$, so the local dexcription of the chart $(X,y)$, and under the projection $mu(X,y) = (y X,y)$. 

    Which, the equation pulls back to $y^4X^4-y^3X^3+y^4+y^2 = y^2(y^2X^4-y X^3+y^2+1)=0$, with $y^2$ defines the exceptional divisor, the defining equation is  $f_Y = y^2X^4-y X^3+y^2+1=0$. For any singular points, it has the following relations:
    $ &(partial f_Y)/(partial X)=4y^2X^3 - 3 y X^2=0 ==> y X^2(4y X - 3)=0\ 
    &(partial f_Y)/(partial y)=2y X^4-X^3+2 y =0 $
    If $X=0$ or $y=0$ (to satisfy $partial X=0$), $X=0$ implies $2 y=0$ (or $y=0$), while $y=0$ implies $-X^3=0$, $X=0$. So, this directly implies $X=0$ iff $y=0$. Yet, plugin $(X,y)=(0,0)$ for $f_Y$, one yields $1!=0$, so these points are not on the proper transform, hence doesn't affect.

    Else, if $4y X=3$ (where $y,X!=0$), then the second partial tells that $2(2y X^4-X^3+2y) = 3X^3 - 2X^3 + 4y = X^3 +4 y=0$, so $4y = -X^3$. Plugin to the initial relation, $4y X=-X^4 = 3$, so $X^4 = -3$, and $X^3 = -4y$. Plugin to $f_Y$ one yields $-3y^2+ 4y^2 + y^2+1 = 0$, or $2y^2+1=0$. However, this implies $y^2=-1/2$, showing $X^6 = 16y^2 = 4$, so $X^12 = 16$; yet $X^4 = -3$ implies $X^12 = -27$, which reaches a contradiction. So, there cannot be any singular points in $U_Y$.

    The above two claims showed that the Cusp in Exercise 5.1 (Problem 3) is non-singular after blowing-up.

    \ 

    #text(weight: "bold")[Node:] Its corersponding equation is $g=x^6-x y+y^6=0$. 

    Under the open subset $U_X$, the chart has description $(x,Y)$, so map has description $phi(x,Y) = (x,x Y)$. Then, the equation pulls back to $x^6 - x^2Y + x^6Y^6 = x^2(x^4-Y+x^4Y^6)=0$. With $x^2$ defines the exceptional divisor, the equation is $g_X = x^4-Y + x^4Y^6=0$. Then, the singular points satisfy:
    $ (partial g_X)/(partial x)=4x^3(1+Y^6)=0, quad (partial g_X)/(partial Y)=-1+6x^4Y^5 = 0 $
    Hence, $6x^4Y^5 = 1$, indicating $x,Y!=0$. So, one has $Y^6=-1$ instead (for $partial x$ to hold). But, plugin $g_X$ one yields $x^4 - Y - x^4 = -Y !=0$, showing this point is not in the proper transform, hence not a singular point.

    \ 

    Else, under the open subset $U_Y$, the chart has description $(X,y)$, with the map's description $phi(X,y) = (y X,y)$. Then, the equation pulls back to $y^6 X^6 - y^2 X + y^6 = y^2(y^4X^6 - X + y^4)=0$. With $y^2$ defines the exceptional divisor, the equation is $g_Y = y^4X^6 - X+y^4=0$. Then, the singular points satisfy:
    $ (partial g_Y)/(partial X)=6y^4X^5 - 1=0, quad (partial g_Y)/(partial y)=4y^3(X^6+1)=0 $
    With $6y^4X^5=1$, this indicates $X,y!=0$; so, for the second equation to hold, $X^6=-1$. Yet, plugin to $g_Y$, one yields $-y^4 - X + y^4 = -X !=0$, which is not in the proper transform, hence not a singular point.

    As a result, the two charts contained no singular points (for the proper transform), showing the blowing-up is non-singular.

    \

    \ 

  + d

    \ 

    \ 

  + Given the equation of the Tacnode being $x^4-x^2+y^4=0$ in Exercise 5.1 (Problem 3). Take the BLowing-up $tilde(Y)$ as the proper transform under $Bl_0 AA^2$, and take the open subset $U_Y$ (where $Y!=0$), then the local description of the chart is $(X,y)$, with $phi(X,y) = (y X,y)$.

    Then, the defining equation pulls back to $y^4X^4-y^2X^2+y^4=y^2(y^2X^4-X^2+y^2)=0$, so with $y^2$ describes the exceptional divisor, the defining equation is $y^2X^4-X^2+y^2 = 0$. 

    Notice that $phi^(-1)(P)$ yields $(X,y) = (0,0)$. Which, since under the open subset $U_Y$ the defining equation has the lowest degree nonzero homogeneous polynomial being $-X^2+y^2 = (y-X)(y+X)$, showing that the point $phi^(-1)(P)$ (under this chart) has two distinct linear factors corresponding to $f_2$ (the lowest degree nonzero homogeneous polynomial of the defining equation), hence it's a node.

    For safety (meaning $phi^(-1)(P)$ is only one point), let's check the other open subset $U_X$ (where $X!=0$). The local description of the chart is $(x,Y)$, with the mapt $phi(x,Y)=(x,x Y)$. Which, the defining equation pulls back to $x^4-x^2 + x^4Y^4 = x^2(x^2-1+x^2Y^4)=0$, with $x^2$ defines the exceptional divisor, the equation is $x^2-1+x^2 Y^4=0$. Notice that $phi^(-1)(P)$ should yield $(x,Y)=(0,0)$, but this point is not on the curve defined by the equation mentioned, hence $phi^(-1)(P)$ doesn't exist in this chart. This shows the only point in $phi^(-1)(P)$ lies in $U_Y$ (which has been calculated above), and it is a node.

    \ 

    \ 

  + First, the point $)$ in $x^5-y^3=0$ has multiplicity $3$, since the lowest degree homogeneous plynomial is $-y^3$, indicating that it's a triple point.

    If blowing up at $O = (0,0)$ (viewed as the proper transform in $Bl_0 AA^2$), take the open subset $U_Y$ (where $Y!=0$), the local chart provides $(X,y)$, and the map can be defined as $phi(X,y)=(y X,y)$. So, the defining equation pulls back to $y^5 X^4 - y^3 = y^3(y^2X^4 -1)=0$. With $y^3$ defines the exceptional divisor, $y^2 X^4 -1 = 0$ is the defining equation. Which, $phi^(-1)(O)$ supposedly provides $(X,y)=(0,0)$, yet this point is not on the algebraic set (since plugin provides $-1!=0$), so we need to see the other affine chart.

    \ 

    Take $U_X$ (where $X!=0$), the local chart provides $(x,Y)$, and the map can be defined as $phi(x,Y)= (x,x Y)$. So, the defining equation pulls back to $x^5-x^3 Y^3 = x^3(x^2-Y^3)=0$. So, the defining equation is given by $x^2-Y^3 = 0$. Here, $phi^(-1)(O)$ provides $(x,Y)=(0,0)$, which is on the locus; and, notice that the lowest degree homogeneous polynomial is $x^2$, showing that $phi^(-1)(O)$ is a double point (and since the linear factor of $x^2$ is not distinct, it's not a node, must be a Tacnode or a Cusp). If limit to $k=RR$, it defines a cuspidal cubic, which the point $phi^(-1)(O)$ is a cusp.

    Finally, under this affine chart (isomorphic to $AA^2$), the blowing-up of $x^2-Y^3=0$ at $(x,Y)=(0,0)$ as a set, can be viewed as the proper transform in $Bl_0 AA^2 = {(overline(x), [ell])}$, where $overline(x)=(x,Y)$ and $[ell] = [X',Y']$ has $mat(x,Y;X',Y')$ with rank $<=1$.

    On the open subset $V_(X')$ (where $X'!=0$), the local chart is $(x,Y')$, with map $mu(x,Y') = (x,x Y')$ as the projection back to the affine chart. Which, the equation pulls back to $x^2 - x^3 Y'^3 = x^2(1-x Y'^3)=0$, which the $x^2$ is defining the exceptional divisor, so the equation under this set $V_(X')$ is $1-x Y'^3 = 0$. But, notice that $mu^(-1)(0,0)$ supposedly provides $(x,Y')=(0,0)$, which is not on the curve. Hence, we need to look at the other open subset.

    Take $V_(Y')$ (where $Y'!=0$), the local chart is $(X', Y)$, with projection $mu(X',Y) = (Y X', Y)$, so the equation pulls back to $Y^2 X'^2 - Y^3 = Y^2(X'^2 - Y)=0$. With $Y^2$ defines the exceptional devisor, the equation is $X'^2 - Y=0$. Notice that this has linear factor, hence under this chart the point $mu^(-1)(0,0)$ (being $(X',Y)= (0,0)$) is non-singular, showing the second blowing up in fact resolves the singularity at the point.
]

#pagebreak()

= (b),(c) ND//7
#problem[
  Hartshorne 5.7:

  Let $Y subset.eq PP^2$ be a non-singular plane curve of degree $>1$, defined by the equation $f(x,y,z)=0$. Let $X subset.eq AA^3$ be the affine variety defined by $f$ (this is the cone over $Y$; see (Exercise 2.10)). Let $P$ be the point $(0,0,0)$, which is the #emph[vertex] of the cone. Let $phi:tilde(X)->X$ be the blowing-up of $X$ at $P$.
  + Show that $X$ has just one singular point, namely $P$.
  + Show that $tilde(X)$ is non-singular (cover it with open affines).
  + Show that $phi^(-1)(P)$ is isomorphic to $Y$.
][
  + Since $Y$ is a projective algebraic set, its defining equation $f$ is homogeneous of some degree $d$; also, it is assumed to be non-singular, then under the affine cover of $PP^2$, the defining equation of $Y$ in each of the affine chart is nonzero: 
  
    For instance, in the affine chart $U_x$ (where $x!=0$), the defining equation of $Y sect U_x subset.eq U_x$ is $f(1,y,z)$ (since can assume $x=1$). Then, $Y$ is non-singular implies $(partial f)/(partial y)(1,y,z)$ or $(partial f)/(partial z)(1,y,z)$ is nonzero (for definiteness, say $(partial f)/(partial y)(1,y,z)!=0$). Hence, in $AA^3$, if $(x,y,z) in X$ has $x = a!=0$, then since $(partial f)/(partial y)$ has degree $d-1$ (Note: in #text(weight: "bold")[Problem 5] it's proven that any homogeneous polynomial of degree $d$ has nonzero partial derivatives being homogeneous of degree $d-1$), then one has $(partial f)/(partial y)(a,y,z) = a^(d-1) (partial f)/(partial y)(1, y/a, z/a) != 0$. So, the partial derivative is nonvanishing at $(x,y,z) = (a,y,z)!=0$.

    Apply similar logic to $y!=0$ and $z!=0$ (which instead need the affine chart $U_y subset.eq PP^2$ and $U_z subset.eq PP^2$ respectively, and the same claim on the partial derivatives in the affine chart), one can deduce that if $x!=0$, $y!=0$, or $z!=0$, at least one of the partial derivatives of $f$ is nonvanishing. Hence, the only possible singularity must be at $P=(0,0,0)$.

    Finally, the reason why $P$ is singular, is because $Y subset PP^2$ is of degree $d>1$ (the homogeneous degree of $f$), hence all of its partial derivatives $(partial f)/(partial x), (partial f)/(partial y), (partial f)/(partial z)$ are homogeneous of degree $d-1 >= 1$. Hence, plugin $(x,y,z)=(0,0,0)$, since each monomial (of the partial derivatives) is non-constant, it must evaluate to be $0$, showing all partial derivatives vanish at $P=(0,0,0)$.

    \ 

  /*
  + First, we know that $tilde(X)$ can also be viewed as the proper transform of $X$, namely if constructing the blowing-up $Bl_P AA^3 = {(overline(x), [ell]) in AA^3 times PP^2 | overline(x) in ell}$ (where $ell subset AA^3$ is a $1$-dimensional subspace), with projection $mu:Bl_P AA^3 -> AA^3$, the blowing-up $tilde(X)$ is also isomorphic to $overline(mu^(-1)(X\\{P})) subset Bl_P AA^3$.

    Which, consider the closed set $C = (X times Y) sect Bl_P AA^3$ (which are all pairs $(overline(x), [ell])$, such that $[ell] in Y$, and $overline(x) in ell$), we claim that $C = overline(mu^(-1)(X\\{P}))$, the proper transform of $X$. 
    
    It's clear that $overline(mu^(-1)(X\\{P})) subset.eq C$ (since for any nonzero $overline(x) in X subset AA^3$, its fibre is $mu^(-1)(overline(x)) = (overline(x), [ell]) in Bl_P AA^2$, where $ell$ is the $1$-dimensional subspace spanned by $overline(x)$; notice that $(overline(x), [ell]) in C$ since $f$ is homogeneous, the $f(overline(x))=0$ implies all points on $ell$ is also a solution of $f$, so $f([ell])=0$ also, hence $[ell] in Y$, showing $mu^(-1)(overline(x)) = (overline(x), [ell]) in C$).

    For the converse, since $mu$ is continuous, one has $mu(overline(mu^(-1)(X\\{P}))) subset.eq overline(mu(mu^(-1)(X\\{P}))) = overline(X\\{P}) = X$ (the first inclusion is the property of continuous map, the second inclusion is by definition of preimage and image; on the other hand, since $mu$ is surjective, $mu(mu^(-1)(X\\{P})) = X\\{P}$). Also, one has $X=overline(mu(mu^(-1)(X\\{P}))) subset.eq mu(overline(mu^(-1)(X\\{P})))$ (since $mu:Bl_P AA^3-> AA^3$ is a restriction of the projection $AA^3 times PP^2 -> AA^3$, which is a closed map; which, this inclusion is the property of closed map). Hence, one has $mu(overline(mu^(-1)(X\\{P}))) = X$

    \ 

    From the above information, given $tilde(X) = Bl_P X = {(overline(x), [ell]) in Bl_P AA^3 | overline(x) in ell subset X}$ (where $ell$ is a $1$-dimensional subspace of $AA^3$, with $[ell] in Y$, hence $ell subset X$, the cone of $Y$), which are also all the points $(overline(x), [ell]) in X times Y$, such that $overline(x) = (x,y,z)$ and $[ell] = [X',Y,Z]$ satisfies $mat(x,y,z;X',Y,Z)$ has rank $<=1$ (here, $x,y,z$ are the defining equations of $P=(0,0,0) in AA^3$). Which, if cover $tilde(X)$ with the standard affine charts, one can calculate the defining equations as follow: 
  
    For instance, take open subset $U_X'$ (where $X'!=0$ in $AA^3 times PP^2$), its intersection with $Bl_P AA^3$ can be given as all points $(overline(x), [ell])$ such that $mat(x,y,z;X',Y,Z)$ has rank $<=1$; with $X!=0$, one can assume $X=1$, hence $(x,y,z)$ is a scalar multiple of $(1,Y,Z)$, causing $y = x Y$ and $z = x Z$. So, such open chart in $Bl_P AA^3$ is isomorphic to $AA^3$ by the coordinate $(x,Y,Z)$. And, the projeciton $mu:tilde(X) -> X$ restricted onto this chart $U_X sect tilde(X)$ has $phi(x,Y,Z) = (x,y,z) = (x,x Y, x Z)$. So, the defining equation of $X$ (given as $f$), pulls back to a definine equation of $tilde(X) sect U_X'$, given by $f_X'  = f(x, x Y, x Z)$; and since $f$ is homogeneous of degree $d$, $f_X'= f(x, x Y, x Z) = x^d f(1, Y, Z)$. Which, the partial derivatives of $f_X'$, are $(partial f_X')/(partial x) = d x^(d-1) f(1,Y,Z)$, $(partial f_X')/(partial Y) = x^d dot (partial f)/(partial Y)(1,Y,Z)$, and $(partial f_X')/(partial Z) = x^d dot (partial f)/(partial Z)(1,Y,Z)$. With $d>1$, this shows that all partial derivatives vanished whenever $x = 0$. Which, notice that any points $(0,Y,Z)$ satisfies the defining equation $f_X'$, since $f_X'(0,Y,Z) = f(0,0 dot Y, 0 dot Z) = f(0,0,0)=0$ (due to the fact that $f$ is homogeneous of degree $d>1$). Hence, within the open chart $tilde(X) sect U_X'$, one can find a collection of singular points, showing $tilde(X)$ is non-singular in the region $U_X'$. Apply similar logic to open subsets $U_Y$ (where $Y!=0$) and $U_Z$ (where $Z!=0$), in each region one can deduce $tilde(X)$ is non-singular using similar method

    \ 

  + Notice that the set $phi^(-1)(P) = {(P, [ell]) in tilde(X)}$ (based on the information in part (b)), where $tilde(X)$ enforces $[ell] in Y$; and, since $P = (0,0,0)$, then $P in ell$ for any $[ell] in Y$. So, the map $Y -> phi^(-1)(P)$ by $[ell] mapsto (P, [ell])$ is well-defined; also, if using the restricted second projection $"pr"_2:phi^(-1)(P) -> PP^2$, one has $"pr"_2 (P, [ell]) = [ell] in Y$ for any $(P,[ell]) in phi^(-1)(P)$.

    Which, these two maps are clearly mutual inverses of each other, while being morphisms, showing that $phi^(-1)(P) tilde.equiv Y$.

    */
]

#pagebreak()

= D//8
#problem[
  Hartshorne 5.11:

  #emph[The Elliptic Quarter Curve in $PP^3$:] Let $Y$ be the algebraic set in $PP^3$ defined by the equations $x^2-x z-y w=0$ and $y z-x w-z w=0$. Let $P$ be the point $[x,y,z,w]=[0,0,0,1]$, and let $phi$ denote the projection from $P$ to the plane $w=0$. Show that $phi$ induces an isomorphism of $Y\\{P}$ with the plane cubic curve $y^2z-x^3+x z^2=0$ minus the point $[1,0,-1]$. Then show that $Y$ is an irreducible non-singular curve. It is called the #emph[elliptic quartic curve in $PP^3$]. Since it is defined by two equations it is another example of complete intersection (Exercise 2.17).
][

  Let $Z :={y^2z-x^3+x z^2=0} subset.eq PP^2$ be the algebraic set. Also, the projection $phi:PP^3\{P} -> PP^2$ is defined by $phi([x,y,z,w]) = [x,y,z]$ (here it rules out $P=[0,0,0,1]$, so the projection is well-defined).

  \ 

  #text(weight: "bold")[I. Projection $phi:Y\\{P} -> Z\\{[1,0,-1]}$ is well-defined:]

  If restrict to $Y\\{P}$, we'll first show that $phi(Y\\{P}) subset.eq Z$: Given any $[x,y,z,w] in Y$ that's not $P$, they satisfy the equations $cases(
    x^2-x z-y w=0, y z-x w-z w=0
  )$. Which, there are two cases:
  - First, if $w=0$, the equations reduce to $cases(x^2-x z=0, y z=0)$. So, one has $[x,y,z] = phi([x,y,z,w])$ satisfy:
    $ y^2 z - x^3 + x z^2 = y(y z) + (x^2-x z)(z+x) = 0 $
    Hence, $phi([x,y,z,w]) = [x,y,z] in Z$.
  - Else, if $w!=0$, WLOG say $w=1$. Which, teh equations reduce to $cases(x^2 - x z - y=0, y z - x - z = 0)$, or $cases(x^2 = x z+y, y z=x+z)$ (also, by rearrangement $x z = x^2-y$ also). Again, one has $[x,y,z]=phi([x,y,z,w])$ satisfy:
    $ y^2z - x^3 + x z^2 &= y(x+z) - x(x z+y) + z(x^2-y)\
    &= x y+y z - x^2z - x y + x^2z - y z = 0  $
    Hence again, $phi([x,y,z,w]) = [x,y,z] in Z$.

  These showed that as projection, $phi:Y\\{P} -> Z$ is well-defined.

  Also, notice that for all $w in k$, the point $[1,0,-1,w] in.not Y$ (since plugin the polynomial $x^2-x z-y w$, one has $1^2 - 1(-1) - 0 dot w = 2 != 0$ if $Char(k)!=2$; if $Char(k)=2$, plugin the polynomial $y z-x w-z w$, one has $0 - 1 dot w - (-1) dot w = 0$). So $[1,0,-1,w] in.not Y$, showing $[1,0,-1] in.not im(phi)$ when restricting to $Y\\{P}$. So, $phi:Y\\{P} -> Z\\{[1,0,-1]}$ is a well-defined projection.

  \ 

  #text(weight: "bold")[II. Projection $phi:Y\\{P}-> Z\\{[1,0,-1]}$ is an isomorphism:]

  For this, it suffices to find the inverse in some open neighborhood, for every point in $Z\\{[1,0,-1]}$. Let $U_y$ denotes the open set such that $y!=0$, and $V$ denotes the open set where $x+z!=0$. 
  
  Notice that $Z\\{[1,0,-1]} subset.eq U_y union V$, since if any $[x,y,z] in.not U_y union V$, one has $y = 0$ and $x+z = 0$ (or $x=-z$), which to have $[x,y,z] in PP^2$ be well-defined, one needs $x=-z!=0$, hence WLOG assume $x=1$, showing $[x,y,z]=[1,0,-1]$, which is not contained in $Z\\{[1,0,-1]}$. In other words, $Z\\{[1,0,-1]}$ is fully contained in $U_y union V$, so having the inverse defined on these two open sets is enough.
  
  Now, define the map $psi:Z\\{[1,0,-1]} -> Y\\{P}$ as follow:
  $ psi([x,y,z]) = cases(
    [x,y,z, x(x-z)/y]\, quad y!=0,
    [x,y,z,(y z)/(x+z)] quad\, quad x+z !=0
  ) $
  Which, the first condition can be defined on $U_y$, the second condition can be defined on $V$.

  First, to show it's well-defined at each point, given any $[x,y,z] in Z\\{[1,0,-1]}$ that's also in $U_y sect V$, notice that it satisfies the equation $y^2 z - x^3 + x z^2=0$, or $y(y z) = x(x-z)(x+z)$ (where $y, x+z!=0$). So, one has $(y z)/(x+z) = x(x-z)/y$, showing the two definitions above agree, which the map $psi$ (into $PP^3$) is well-defined (and is a well-defined rational map on $Z\\{[1,0,-1]}$).

  Second, to show the image is in $Y\\{P}$, consider the following two cases:
  - If $[x,y,z] in (Z\\{[1,0,-1]}) sect U_y$, then $psi([x,y,z]) = [x,y,z,x(x-z)/y]$ satisfies:
    $ x^2 - x z - y w &= x^2 - x z - y dot x(x-z)/y = x^2 - x z - x^2+ x z = 0 $
    $ y z - x w - z w= y z - (x+z) dot x(x-z)/y = 1/y (y^2 z - x^3 - x z^2) = 0 $
    (Note: the second equation is due to the fact that $[x,y,z] in Z$, so $y^2 z-x^3-x z^2=0$).

    Hence, $psi([x,y,z]) in Y$ based on the two equations. 

  - If $[x,y,z] in (Z\\{[1,0,-1]}) sect V$ (in fact, $V$ automaticaly rules oout the point $[1,0,-1]$), then $psi([x,y,z]) = [x,y,z,(y z)/(x+z)]$ satisfies:
    $ x^2 - x z - y w = (x^2-x z)-y dot (y z)/(x+z) = 1/(x+z)(x^3 - x z^2 - y^2 z)=0 $
    $ y z- x w - z w = y z - (x+z) dot (y z)/(x+z) = 0 $
    (Note: the first equation is due to $[x,y,z] in Z$, so $y^2 z - x^3 - x z^2=0$).

    Hence, $psi([x,y,z]) in Y$ based on the two equations.
    
  Also, since one of $x,y,z$ is nonzero (since $[x,y,z] in PP^2$), it's clear that $psi([x,y,z]) != P = [0,0,0,1]$, hence it's in $Y\\{P}$. So, $psi:Z\\{[1,0,-1]}-> Y\\{P}$ is well-defined.

  Finally, to check it's the inverse of $phi:Y\\{P}-> Z\\{[1,0,-1]}$, any $[x,y,z,w] in Y\\{P}$ divides to the following two cases:
  - If $y!=0$, then the first equation of $Y$, $x^2-x z-y w=0$ implies $w = x(x-z)/y$. Hence:
    $ psi compose phi([x,y,z,w]) = psi([x,y,z]) = [x,y,z,x(x-z)/y] = [x,y,z,w] $
  - Else if $x+z!=0$, then the second equation of $Y$, $y z-x w-z w=0$ implies $w=(y z)/(x+z)$. Hence:
    $ psi compose phi([x,y,z,w]) = psi([x,y,z]) = [x,y,z,(y z)/(x+z)] = [x,y,z,w] $
  This shows that $psi compose phi = id$ on $Y\\{P}$. Also, it's clear that for all $[x,y,z] in Z\\{[1,0,-1]}$, one has $phi compose psi([x,y,z]) = phi([x,y,z,*]) =[x,y,z]$, showing $phi compose psi = id$ on $Z\\{[1,0,-1]}$. Hence, the two sets are isomorphic. 

  \ 

  #text(weight: "bold")[III. $Y$ is an irreducible Non-singular curve:]

  Based on the isomorphism above, it suffices to show that $Z$ is a projective variety (which implies $Z\\{[1,0,-1]}$ is an irreducible open subset of $Z$, so $Y\\{P}$ is irreducible, hence $Y = overline(Y\\{P})$ under its subspace topology is also irreducible). 
  
  Which, to show $Z$ is a projective variety, it's the most efficient to show its defining equation $y^2 z - x^3 + x z^2$ is irreducible (hence the homogeneous ideal $(y^2 z-x^3 + x z^2) subset k[x,y,z]$ is prime, where $Z$ as the algebraic set of this ideal, is a variety).

  Since the polynomial has $y$-degree being $2$, if it's reducible it must be the form $z dot y^2 + (x z^2+x^3) = (f dot y - g)(h dot y - l)$, where $f,g,h,l in k[x,z]$. Which, one has $f dot h = z$, showing both $f,h$ involves no $x$ term, while one has $z$-degree $1$. Hence up to unit, one can assume $f = z$ and $h=1$ (so, $z dot y^2 + (x z^2 - x^3) = (z dot y-g)(y - l)$).

  Then, in case to have no degree 1 $y$ term, one must have $-z dot l -g = 0$, or $g = -z dot l$. Which, this implies $-z l^2 = g l = x z^2 - x^3$. Yet, this is clearly impossible, since plugin $z=0, x=1$, one yields $-z l^2 = 0$, while $x z^2-x^3 = -1!=0$. So, we reach a contradiction. Therefore, $y^2 z-x^3+x z^2$ cannot be reducible, hence irreducible, and this finishes the proof that $Y$ is irreducible.

  \ 

  Finally, to show $Y$ is non-singular, let's look at one of the affine open subset: Consider the open subset $U_z$ (where $z!=0$), WLOG say $z=1$. Hence, $Y sect U_z$ can be defined by the two equations $cases(x^2-x-y w, y^2-x^3-x)$. So, the Jacobian matrix becomes (in terms of $x,y,w$ from left to right columns, and the polynomials are from top to bottom row in order):
  $ J = mat((2x-1), -w, -y;-(3x^2-1),2y, 0) $
  Which, since $Y subset PP^3$ has dimension at most 1 (since the two defining equations generate two hypersurfaces not containing each other, so the intersection must necessarily be a curve with one dimension lower), hence the Jacobian must have rank being the codimension $3-1 = 2$ for it to be non-singular. However, take $x=1/2, y=w=0$, then $J = mat(0,0,0;1/4,0,0)$, which clearly doesn't have rank $2$. This shows that $Y$ contains non-singular points, which finishes the last piece of the proof.

]