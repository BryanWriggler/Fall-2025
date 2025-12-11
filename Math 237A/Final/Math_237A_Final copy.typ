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

= D//7
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

  + We'll consider $tilde(X)$ as the proper transform of $X$ in $Bl_0 AA^3$. For simplicity, we'll just demonstrate one affine chart calculation: Pick $U_X'$ (where $X'!=0$ in $Bl_0 AA^3$, where the points are of the form $(overline(x), [ell])$, where $overline(x)=(x,y,z)$ and $[ell] = [X',Y,Z]$ have $mat(x,y,z;X',Y,Z)$ with rank $<=1$). Then, the local description is $(x,Y,Z)$.
  
    Take the pull back of the equation, we in fact ield $f(x, x Y, x Z) = x^d dot f(1, Y, Z)$ (this is based on the fact that $f$ is homogeneous of degree $d$). Here, since the preimage of $P=(0,0,0)$ in this affine chart has $x=0$, $x^d=0$ is the defining equation for the exceptional divisor, hence we're left with the equation $f(1, Y, Z)$ that defines $tilde(X)$ in $U_X'$. Then, the partial derivatives with respect to $Y,Z$ are given by $(partial f)/(partial Y)(1,Y,Z)$, and $(partial f)/(partial Z)(1,Y,Z)$. In part (a) we've verified that at theast one of the two must be nonzero, showing $tilde(X)$ is non-singular within the affine chart.

    Also, notice that the same idea applies to all the other affine charts (liek $U_Y$ where $Y!=0$, and $U_Z$ where $Z!=0$), showing that under the affine cover $tilde(X)$ contains only non-singular points, hence non-singular.

    \ 

  + It suffices to check that under each of the three standard affine charts of $Bl_0 AA^3$ and $PP^2$ (while viewing $tilde(X)$ as the proper transform of $X$), it induces an isomorphism between $phi^(-1)(P)$ and $Y$.

    Let $U_X' tilde.equiv AA^3$ denotes the affine open chart of $Bl_0 AA^3$ with $X'!=0$ (which has local description $(x,Y,Z)$ and projection back to $AA^3$, by $phi(x,Y,Z) = (x,x Y, x Z)$), and let $V_x tilde.equiv AA^2$ denotes the affine open chart of $PP^2$ where $x != 0$ (use $[x,y,z]$ as the coordinates of $PP^2$).

    Which, the answer in part (a) suggested that in $V_x$ (with coordinate $(y,z)$, since WLOG can assume $x = 1$), $Y$ is cut out by the equation $f(1,y,z)=0$; on the other hand the answer in part (b) suggested that in $U_X'$ (with coordinate $(x, Y, Z)$), the exceptional divisor is cut out by the equation $x^d = 0$, hence $phi^(-1)(P) subset.eq {x=0} subset.eq U_X'$ (since if $phi(x,Y,Z) = (x,x Y, x Z) = P = (0,0,0)$, one must have $x=0$), which narrows down the the subset ${(0,Y,Z) in U_X'} tilde.equiv AA^2$.

    Also, notice that $phi^(-1)(P)$ under $U_X'$, is precisely the intersection ${x^d=0} sect (tilde(X) sect U_X')$ (since any point that projects down to $P=(0,0,0)$ must precisely have $x=0$, which is precisely $phi^(-1)(P) sect U_X'$ should contain this set; the other inclusion is by the fact that $phi^(-1)(P) subset.eq tilde(X)$, and all point must have $x=0$ when intersecting $U_X'$), while $tilde(X) sect U_(X')$ has the defining equation $f(1,Y,Z)$ based on the result in part (b).

    Hence, this shows the following isomorphism: 
    $ phi^(-1)(P) sect U_X' &= {x^d = 0} sect (tilde(x) sect U_X') =  {(0,Y,Z) | f(1,Y,Z)=0} \
    &tilde.equiv {(y,z) | f(1,y,z)=0} = Y sect V_x $
    Which, under the intersection with affine charts, one can see $phi^(-1)(P)$ is isomorphic to $Y$. 

    /*
    Finally, it comes down to check such isomorphism on each intersection with the affine chart, agrees when the affine chart overlaps (or, it is uniquely determined regardless of the affine chart). Given any point in $phi^(-1)(P)$, say it's both in $U_X'$ and $U_Y$, then one needs $x=y=0$, which corresponds to a matrix $mat(0,0,z;X',Y,Z)$, with both $X',Y !=0$. However, for this matrix to be in the proper transform (which is part of the $Bl_0 AA^3$), one needs its rank to be at most 1, showing that $(0,0,z)$ is a scalar multiple of $(X',Y,Z)$, and this further implies $z=0$ (since $X',Y$ are multiplied by a scalar to get $0$). However, based on te isomorphism constructed, it corresponds to $[1,0,0]$ and $[0,1,0]$*/
]
