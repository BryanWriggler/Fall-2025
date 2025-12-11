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

  + #text(weight: "bold")[Cusp:] It's corresponding to the equation $f=x^4-x^3+y^4+y^2=0$. 
    
    Under the open subset $U_X$ (where $X!=0$, WLOG say $X=1$), since $(x,y)$ is a scalar multiple of $[1,Y]$, then $y = x Y$, so the local description of the chart is $(x, Y)$ (which $U_X sect Bl_0 AA^2 tilde.equiv AA^2$). And, under the projection $phi:U_X sect Bl_0 AA^2 -> AA^2$, one has $phi(x,Y) = (x,x Y) = (x,y) = overline(x)$.

    Which, the equation pulls back to $x^4 - x^3 + x^4Y^4 + x^2Y^2 = x^2(x^2-x+x^2Y^4+Y^2)=0$. With $x^2$ defines the exceptional divisor, the equation is $f_X = x^2-x+x^2Y^4 + Y^2 = 0$. For any singular points, it has the following relations:
    $ &(partial f_X)/(partial x)=2x-1++2x Y^4 = 0 ==>2x (1+Y^4)=1\ 
    &(partial f_X)/(partial Y)=4x^2Y^3 + 2Y=0 ==> 2Y(2x^2Y^2 +1)=0 $
    This indicates that $x!=0$ and $Y^4!=-1$ (for the first equation to hold). There are two casees: 
    
    First, if $Y=0$, then plugin the first partial reads $2x=1$, or $x=1/2$. Yet, plugin $(x,Y)=(1/2,0)$ to $f_X$, it reads $1/2^2-1/2+ 0 = -1/4!=0$, so such point is not in the proper transform. 
    
    Second, if $2x^2Y^2 +1=0$ (or $2x^2Y^2 = -1$), then both $x,Y!=0$, and one reads $Y^2=-1/(2x^2)$, and one also has $1+Y^4 = 1/(2x)$, or $Y^4 = 1/(2x)-1$. Plugin to $f_X$, it simplifies to the following:
    $ f_X &= x^2-x+x^2Y^4+Y^2 = x^2-x+x^2(1/(2x)-1) - 1/(2x^2)\ 
    &= -1/(2x^2)(x^3+2)=0 $
    Hence, $x^3+2=0$, or $x^3=-2$. Then, with $2x^2 Y^2 = -1$, $-4Y^2 = 2 x^3 Y^2 = -x$, so $4 Y^2 = x$. Plugin back to $f_X$, one yields $x^2-x+x^2 Y^4 + Y^2 = x^2 - x + x^2/16 + x/4 = 0$, showing $x/16 (17x-12) = 0$. With $x!=0$, it must be $x = 12/17$. Yet, this doesn't satisfy the equation $x^3 = -2$, which is a contradiction. Hence, in this case there can't have any singular points either.

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

  + If consider a plane curve with a node (WLOG, say up to a shift of coordinate, the node $P = (0,0)$), if say that the equation is given by $f = f_2 + ... + f_d$ (each $f_i$ is a homogeneous polynomial of degree $i$), then the description of a node provides that $f_2 = a x^2+b x y + c y^2 = (e x+f y)(g x+h y)$, where $(e x+f y)(g x+h y)$ are distinct linear factors. If view $k[x,y]$ as a $k$-vector space, the two being distinct linear factors imply they're linearly  independent, hence one must have $e h-f g!=0$.

    If consider the blowing-up as a proper transform in $Bl_0 AA^2$, for simplicity let's derive some statements using the open subset $U_X$ of $Bl_0 AA^2$ (where $X!=0$). In here the local chart is $(x,Y)$, with map $phi(x,Y) = (x,x Y)$ projecting down to the original affine space. Notice that for equation $f$, any of the homogeneous polynomial $f_i = sum_(j=0)^i a_(j,i) x^j y^(i-j)$ pulls back to $sum_(j=0)^i a_(j,i) x^j dot x^(i-j) Y^(i-j) = x^i dot sum_(j=0)^i Y^(i-j)$. With $i>=2$ for $f$, define $overline(f_i) := x^(i-2)sum_(j=0)^i a_(j,i)Y^(i-j)$, then $f$ pulls back to $x^2(overline(f_2)+...+overline(f_d))$ (since each $f_i$ pulls back to $x^2 dot overline(f_i)$). 
    
    Notice that $phi^(-1)(P)$ (under this affine chart) all have $x$-coordinate being $0$ (since one needs $phi(x,Y) = (x,x Y)=P = (0,0)$). With all the $i>=3$ term including a factor of $x$ in $overline(f_i)$, then at any point in $phi^(-1)(P)$, $overline(f_i)$ vanishes for $i>=2$, with only $overline(f_2) = (e+f Y)(g + h Y)$ left (this is constructed by the previous definition). Which, in case for $overline(f)=0$, we need $overline(f_2)=0$. Which, there are two possible cases:
    - If both $f,h!=0$, $overline(f_2)$ is a quadratic, then the solutions yield $Y=-e/f, -g/h$. Which, under the blowing-up $Bl_0 AA^3$, they correspond to the matrix $mat(x,y;X,Y)=mat(0,0;1,-e/f)$ and $mat(0,0;1,-g/h)$ (these two are distinct, based on the fact that $e h-g f!=0$, or $e/f != g/h$).

      Notice that at these points $(partial overline(f))/(partial Y)!=0$, since $(partial overline(f_2))/(partial Y) = (e h+f g) - 2 f h Y$. Which, if $Y=-e/f$, it provides $-e h+f g = -(e h-f g)!=0$; else if $Y=-g/h$, it provides $e h-f g!=0$. So, at any point of $phi^(-1)(P)$, in this case the partial derivative of $Y$ is non-vanishing, hence non-singular.
    - If one of $f,h$ is $0$, then $overline(f_2)$ is linear. If $f=0$, for linear independence of $(e x+f y),(g x+h y)$, it enforces $h!=0$, then the only point is $Y = -g/h$; else if $h=0$, by similar reason it enforces $f!=0$, then the only point is $Y = -e/f$. Which, regardless these two cases both yield non-singular points.

    \ 

    But, in both cases we still need to worry about the other affine chart (if they provide more information or not): Using the same machinery, if looking into the open subset $U_Y$ in $Bl_0 AA^2$ (where $X!=0$), the local description is by $(X,y)$, and with the projection $phi(X,y) = (y X,y)$. So, the equation $f$ pulls back to an equation $overline(overline(f))$, where $y^2 dot overline(overline(f)) = y^2 dot (overline(overline(f_2))+...+overline(overline(f_d)))$, where each $overline(overline(f_i)) = y^(i-2)sum_(j=0)^i b_(j,i)X^j$ (here the coefficients depend on each $f_i$). So, with $phi^(-1)(P)$ having the $y$-coordinate being $0$, then every term $overline(overline(f_i))$ vanishes for $i>=3$ (since they contained nontrivial factor of $y$).

    Then, looking at the factor $overline(overline(f_2)) = (e X+f)(g X+h)$, one can consider the two cases:
    - If $e,g!=0$, then one has $X = -f/e, X=-h/g$. Which, in $Bl_0 AA^2$ they correspond to the matrices $mat(x,y;X,Y) = mat(0,0;-f/e,1), mat(0,0;-h/g,1)$. (Note: in this case $(partial x)$ never vanishes at these points, using the same logic as the proof in $U_X$).
    - If $e=0$ or $g=0$, then first case corresponds to $X=-h/g$, the second case corresponds to $X=-f/e$ (since again by linear independence of factors $(e x+f y), (g x+h y)$, $e=0$ implies $g!=0$, while $g=0$ implies $e!=0$).

    For the case where $f,h!=0$, in the chart $U_X$ one has $phi^(-1)(P) = {mat(0,0;1,-e/f), mat(0,0;1,-g/h)}$. If $e!=0$, then the point $X=-f/e$ in $U_Y$ reads $mat(0,0;-f/e,1) = mat(0,0;1,-e/f)$ (since $[X,Y] in PP^1$, so up to scaling they're the same). Else if $f!=0$, then the point $X=-h/g$ reads $mat(0,0;-h/g,1) = mat(0,0;1,-g/h)$. So, in this case $U_Y$ doesn't provde extra points, it's indeed the two points listed in $U_X$.

    For the case where $f=0$ or $h=0$ (for definiteness say $f=0$), it implies $h!=0$, and one has $phi^(-1)(P) = {mat(0,0;1,-g/h)}$ in $U_X$. for $(e x+f y), (g x+h y)$ to be linearly independent, one needs $e!=0$, which extends to two cases: Either $g=0$ or $g!=0$. If $g=0$, then in $U_Y$ the solution provides $X=-f/e = 0$, which corresponds to $mat(0,0;0,1)$ (distinct from $phi^(-1)(P)$); else if $g!=0$, then in the solution it has $X = -f/e = 0$ and $X = -h/g != 0$, corresponding to the two matrices $mat(0,0;0,1), mat(0,0;-h/g,1) = mat(0,0;1,-g/h)$. Which, we yield two distinct points, with one of them coincide with the solution derived in $U_X$.

    So, regardless we'll always find two distinct solutions, and they're non-singular because under the affine chart, one of the partial derivative doesn't vanish. 

    \ 

    \ 

  + Given the equation of the Tacnode being $x^4-x^2+y^4=0$ in Exercise 5.1 (Problem 3). Take the BLowing-up $tilde(Y)$ as the proper transform under $Bl_0 AA^2$, and take the open subset $U_Y$ (where $Y!=0$), then the local description of the chart is $(X,y)$, with $phi(X,y) = (y X,y)$.

    Then, the defining equation pulls back to $y^4X^4-y^2X^2+y^4=y^2(y^2X^4-X^2+y^2)=0$, so with $y^2$ describes the exceptional divisor, the defining equation is $y^2X^4-X^2+y^2 = 0$. 

    Notice that $phi^(-1)(P)$ yields $(X,y) = (0,0)$. Which, since under the open subset $U_Y$ the defining equation has the lowest degree nonzero homogeneous polynomial being $-X^2+y^2 = (y-X)(y+X)$, showing that the point $phi^(-1)(P)$ (under this chart) has two distinct linear factors corresponding to $f_2$ (the lowest degree nonzero homogeneous polynomial of the defining equation), hence it's a node.

    For safety (meaning $phi^(-1)(P)$ is only one point), let's check the other open subset $U_X$ (where $X!=0$). The local description of the chart is $(x,Y)$, with the mapt $phi(x,Y)=(x,x Y)$. Which, the defining equation pulls back to $x^4-x^2 + x^4Y^4 = x^2(x^2-1+x^2Y^4)=0$, with $x^2$ defines the exceptional divisor, the equation is $x^2-1+x^2 Y^4=0$. Notice that $phi^(-1)(P)$ should yield $(x,Y)=(0,0)$, but this point is not on the curve defined by the equation mentioned, hence $phi^(-1)(P)$ doesn't exist in this chart. This shows the only point in $phi^(-1)(P)$ lies in $U_Y$ (which has been calculated above), and it is a node.

    \ 

    \ 

  + First, the point $(0,0)$ in $x^5-y^3=0$ has multiplicity $3$, since the lowest degree homogeneous plynomial is $-y^3$, indicating that it's a triple point.

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
