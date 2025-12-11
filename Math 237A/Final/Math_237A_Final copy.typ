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
  + Show that $Sigma$ has a unique singular point (at the point of $GG$ corresponding to $ell_0$). In fact, $Sigma$ is a quardric $Q$ of rank $4$ in $PP^4$.
  + Let $Q subset PP^4$ be a quadric of rank $4$ in $PP^4$, with singular point $o in Q$. Let $Q'$ be the proper transform of $Q$ under the blowing up of $o in PP^4$. Show that $Q'$ is non-singular, and that the fibre of $nu:Q'-->Q$ over $o$ is (isomorphic to) $PP^1 times PP^1$.
  + Returning to the realization $Sigma$ of $Q$ in (a), define $Sigma' subset.eq GG times ell_0$ to be the incidence correspondance $Sigma' = {([ell], x) | x in ell sect ell_0}$. Show that $Sigma'$ is smooth (non-signular), and that the projection $mu:Sigma' --> Sigma$ is an isomorphism away from$[ell_0]$, while $mu^(-1)[ell_0]$ is a copy of $PP^1$. This map is called the "small resolution" of $Q=Sigma$.
][
  + First, recall that the Grassmannian has Plucker Embedding $GG(1,3) arrow.hook PP^5$, where for each line (or a 2-dimensional subspace in $k^4$), a corresponding matrix $mat(x_1,x_2,x_3,x_4;y_1,y_2,y_3,y_4)$ in $PP^5$ corresponds to the point $[X_(12),X_(13),X_(14),X_(23),X_(24),X_(34)] in PP^5$, where each $X_(i j) = det mat(x_i,x_j;y_i, y_j)$. 

    WLOG, up to a projective linear transform one can assume the point $ell_0 = mat(1,0,0,0;0,1,0,0)$, which corresponds to the point $[1,0,0,0,0,0] in GG(1,3) subset PP^5$. Which, we claim that a line $ell = mat(x_1,x_2,x_3,x_3;y_1,y_2,y_3,Y_4) in Sigma$ iff $X_(3 4) = det mat(x_3,x_4;y_3,y_4)=0$.

    $==>:$ If $ell in Sigma$, then it intersects with $ell_0$. On the level of $k^4$, it implies there exists $[s,t] in PP^1$, such that $s[x_1,x_2,x_3,x_4]+t [y_1,y_2,y_3,y_4] in ell_0$, which has the last two coordinates being zero, showing $(s x_3 + t y_3, s x_4+t y_4) = mat(s ,t)mat(x_3,x_4;y_3,y_4) = mat(0,0)$. With $(s,t)!=0$ as a vector, this implies $det mat(x_3,x_4;y_3,y_4)=0$, hence the corresponding Pucker coordinate has $X_(3 4)=0$.

    $<==:$ If $X_(34)=det mat(x_3,x_4;y_3,y_4)=0$, there exists nonzero $(s,t)$, such that $mat(s,t)mat(x_3,x_4;y_3,y_4)=(s x_3+t y_3,s x_4+t y_4)=0$. Hence, the vector (in $k^4$) / point (in $PP^3$) has $[s x_1+t y_1,s x_2+t y_2, s x_3+t y_3, s x_4+t y_4] = [s x_1+t y_1,s x_2+t y_2,0,0] in ell_0$, shwoing $ell sect ell_0 != emptyset$, or $ell in Sigma$.

    \ 

    Hence, $Sigma subset GG(1,3) subset PP^5$ is the intersection ${X_(34)=0} sect GG(1,3)$; with $GG(1,3)$ being cut out by the equation $X_(12)X_(34)-X_(13)X_(24)+X_(14)X_(23)=0$, the defining equation for $Sigma subset PP^5$ is ${X_(34)=0, X_(14)X_(23)-X_(13)X_(24)=0}$. And, notice that since the last coordinate is $0$, one can simply project $Sigma$ down to $PP^4$ with coordinates $[X_(12),X_(13),X_(14),X_(23),X_(24)]$, and now the definig equation is $X_(14)X_(23)-X_(13)X_(24)=0$.

    For this equations, the partial derivatives all vanished iff $X_(14)=X_(23)=X_(13)=X_(24)=0$ (since the partials would precistly result in these for, up to $pm 1$), showing the only singular point must be at $[X_(12),0,0,0,0] = [1,0,0,0,0]$. Which, the only line in $PP^3$ with $X_(12)!=0$, is $ell_0$. So, $ell_0$ is the only singular point.

    \ 

    \ 

  + WLOG,up to change of coordinates, say the singularity occurs at $o=[1,0,0,0,0]$ (and say $PP^4$ has coordinates $[x_0,x_1,x_2,x_3,x_4]$). Then, if say $Q$ is a quadric defined by homogeneous equation $f$, then within the affine chart $U_(x_0)$ (where $x_0!=0$, WLOG say $x_0=1$), the equation of $Q$ is defined by $f(1,x_1,x_2,x_3,x_4)$, and must have all of its partial derivatives vanished at $x_1=x_2=x_3=x_4=0$. This indicates that one can't have any terms wit $x_0$ involved. Which, $f$ can be viewed as a homogeneous polynomial in $x_1,...,x_4$.

    As a result, when blowing up with respect to this affine chart (say $U_(x_0) tilde.equiv AA^4$ with coordinates $(x_1,x_2,x_3,x_4)$), then one has $Bl_0 U_(x_0) = {mat(x_1,x_2,x_3,x_4;W,X,Y,Z)}$ (where $[W,X,Y,Z] in PP^3$ and the matrix has rank $<=1$). Which, if pick the affine chart $U_W$ (where $W!=0$), then within the blowing-up the proper transform of $Q$, say $Q'$, has the equation of $Q$ pulling back to $f(1,x_1, x_1 X, x_1 Y, x_1 Z) = x_1^2 dot f(1,1,X,Y,Z)$ (since $f$ is homogeneous, and for quadric surface the degree is $2$), where $x_1^2$ cuts out the exceptional divisor in this chart, so the defining equation of $Q'$ in $U_(W)$ is $f(1,1,X,Y,Z)$. Which, notice that since within $Q subset PP^4$, the only singularity is $o$, then with the point $[1,1,X,Y,Z] != o$, hence any partial derivatives with respect to $X,Y,Z$ has $f$ being non-vanishing, showing it's non-singular. If apply similar results, this indicates that it is non-singular at all points.

    (Isomorphism to $PP^1 times PP^1$ now is unclear).

    \ 

    \ 

  + 

    For $ell in Sigma$ such that $ell != ell_0$, it's clear that $ell sect ell_0 = {x}$ a single point, so there exists a unique $x in ell_0$, where $([ell], x) in Sigma'$. Hence, restricting to $Sigma \\ {[ell_0]}$, the map $psi: Sigma \\{[ell_0]}$ has $psi([ell]) = ([ell], ell sect ell_0)$ being a well-defined morphism (since it requires the second coordinate to satisfy the equation for both $ell$ and $ell_0$ as a variety in $PP^3$), and it defines an isomorphism onto its image (since each $ell!=ell_0$ corresponds to a unique intersection). Which, the inverse is instead given by the projectio (since $mu compose psi([ell]) = mu([ell], ell sect ell_0)= [ell]$, while $([ell],x)$ with $x = ell sect ell_0$ has $psi compose mu([ell],x) = psi([ell]) = ([ell],x)$).

    Finally, the reason why $mu^(-1)([ell_0]) = PP^1$, because for any $x in ell_0$, one has $x in ell_0 sect ell_0$, hence $([ell_0], x) in Sigma'$. Which, one has $mu^(-1)([ell_0]) = {([ell_0],x) | x in ell_0}$ has a one-to-one correspondance to $ell_0$ by projecting down to the second coordinates. Then, since $ell_0 tilde.equiv PP^1$ (a copy of $PP^1$), then $mu^(-1)([ell_0]) tilde.equiv PP^1$.
]
