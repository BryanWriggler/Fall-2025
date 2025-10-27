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
  title: "Math 237A HW 5",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(a)")

= ND//1
#problem[
  Hartshorne 3.14:

  #emph[Projection from a Point]. Let $PP^n$ be a hyperplane in $PP^(n+1)$ and let $P in PP^(n+1)\\PP^n$. Define a mapping $phi:PP^(n+1)\\ {P} arrow.r PP^n$ by $phi(Q) = $ the intersection of the unique line containing $P$ and $Q$ with $PP^n$.

  + Show that $phi$ is a morphism.
  + Let $Y subset.eq PP^3$ be the twisted cubic curve which is the image of the $3$-tuple embedding of $PP^1$ (EX. 2.12). If $t,u$ are the homogeneous coordinates on $PP^1$, we say that $Y$ is the curve given #emph[parametrically] by $[x,y,z,w]=[t^3,t^2u,t u^2,u^3]$. Let $P=[0,0,1,0]$, and let $PP^2$ be the hyperplane $z=0$. Show that the projection of $Y$ from $P$ is a cuspidal cubic curve in the plane, and find its equation.
][
  + 
]

= D//2
#problem[
  Hartshorne 4.3:

  + Let $f$ be the rational function on $PP^2$ given by $f=x_1/x_0$. Find the set of points where $f$ is defined and describe the corresponding regular function.
  + Now think of this function as a rational map from $PP^2$ to $AA^1$. Embed $AA^1$ in $PP^1$, and let $phi:PP^2 arrow.r PP^1$ be the resulting rational map. Find the set of points where $phi$ is defined, and describe the corresponding morphism.
][
  + In case for the rational function $f:PP^2 arrow.r.dashed k$ by $f([x_0,x_1,x_2]) = x_1/x_0$ to be defined, one needs $x_0!=0$. Hence, let $H_0:={[x_0,x_1,x_2]in PP^2|x_0=0}$, $f$ is defined on the open set $PP^2\\H_0 tilde.equiv AA^2$ (where the isomorphism is given by the map $AA^1 arrow.r PP^2\\H_0$ by $(x,y) mapsto [1,x,y]$).

    So, if view such domain $PP^2\\H_0$ as $AA^2$, the corresponding regular function is pulls back to a projection $AA^2 arrow.r k$ by $(x,y) mapsto x$, since precomposing with the isomorphism, we get the map $AA^2arrow.r PP^2\\H_0 arrow.r k$ by $(x,y) mapsto [1,x,y] mapsto x/1=x$.

    \ 

  + Define the embedding $k=AA^1 arrow.r PP^1$ by $x mapsto [1,x]$ (hence corresponds to the open set $PP^1\\H_0 subset.eq PP^1$, where $H_0={[x_0,x_1]|x_0=0}$). Compose this embedding with the previous rational map $f$, we get $PP^2 arrow.r.dashed PP^1$ given by $[x_0,x_1,x_2] mapsto x_1/x_0 mapsto [1,x_1/x_0]$.

    Notice that on the open subset $PP^2\\H_0$ (where $x_0!=0$), such rational map is well-defined morphism, and is given by $PP^2\\H_0 arrow.r PP^1$ as $[x_0,x_1,x_2] mapsto [1,x_1/x_0]=[x_0,x_1]$. 

    Hence, if consider the rational map $phi: PP^2 arrow.r.dashed PP^1$ given by $[x_0,x_1,x_2] mapsto [x_0,x_1]$, it agrees with the previous rational map $f:PP^2 arrow.r.dashed AA^1 subset PP^1$, and its domain in fact enlarges to the open subset where $x_0!=0$ or $x_1!=0$ (where $[x_0,x_1] in PP^1$ is well-defined). Hence, the open subset $PP^2\\(H_0 sect H_1)$ (where the closed set $H_i :={[x_0,x_1,x_2] in PP^2|x_i=0}$ for index $i=0,1,2$), is the largest domain where $phi$ is well-defined morphism, and is a projection of open subsets of $PP^2$ onto $PP^1$.
]

= ND//3
#problem[
  Hartshorne 4.4:

  A variety $Y$ is #emph[rational] if it is birationally equivalent to $PP^n$ for some $n$ (or, equivalently by (4.5), if $k(Y)$ is a pure transcedental extension of $k$).
  + Any conic in $PP^2$ is a rational curve.
  + The cuspidal cubic $y^2=x^3$ is a rational curve.
  + Let $Y$ be the nodal cubic curve $y^2z=x^2(x+z)$ in $PP^2$. Show that the projection $phi$ from the point $P=(0,0,1)$ to the line $z=0$ (Ex. 3.14) induces a birational map from $Y$ to $PP^1$. Thus $Y$ is a rational curve.
][]

#pagebreak()

= D//4
#problem[
  Hartshorne 4.6:

  #emph[Plane Cremona Transformations]. A birational map of $PP^2$ into itself is called a #emph[plane Cremona transformation]. We give an example, called a #emph[quadratic transformation]. It is the rational map $phi:PP^2 arrow.r.dashed PP^2$ given by $(a_0,a_1,a_2) arrow.r (a_1a_2,a_0 a_2,a_0 a_1)$ when no two of $a_0,a_1,a_2$ are $0$.

  + Show that $phi$ is birational, and is its own inverse.
  + Find open sets $U,V subset.eq PP^2$, such that $phi:U arrow.r V$ is an isomorphism.
  + Find the open sets where $phi$ and $phi^(-1)$ are defined, and describe the corresponding morphisms. See also (V, 4.2.3).
][
  + Let $[x_0,x_1,x_2]$ be the coordinates of $PP^2$, and let $H_i:={x_i=0}$ be the corresponding algebraic set of index $i=0,1,2$. Then, define $U_i:= PP^2\\H_i$, consider the open set $U:= U_0 sect U_1 sect U_2=` PP^2\\(H_0 union H_1 union H_2)$ (where every $[x_0,x_1,x_2] in U$ has $x_0,x_1,x_2!=0$). Then, if consider $phi$ when restricting onto $U$, we have $phi([x_0,x_1,x_2])=[x_1x_2,x_0x_2,x_0x_1] in U$ (since each of the component $x_i!=0$, then their finite product is still nonzero. Hence, each entry of the output is nonzero).

    Now, notice that $[x_0,x_1,x_2] in U$ implies $phi([x_0,x_1,x_2]) = [x_1x_2,x_0x_2,x_0x_1] = [1/x_0,1/x_1,1/x_2]$ (since $x_0x_1x_2 !=0$, so divide every entry by it). Then, $phi^2:U arrow.r U$ satisfies $phi^2([x_0,x_1,x_2])=phi([1/x_0,1/x_1,1/x_2]) = [1/(1\/x_0), 1/(1\/x_1), 1/(1\/x_2)] = [x_0,x_1,x_2]$. Hence, when restrict onto the open subset $U$, $phi$ is its own mutual inverse, which is a birational equivalence.

    \ 

  + Based on the statement established in (a), choose $U = V=PP^2\\(H_0 union H_1 union H_2)$, then $phi:U arrow.r.tilde V$ is an isomorphism with itself being its own inverse (since it's well-defined on each point of $U=V$, while also having an inverse on this open set). 

    \ 

  + In case for $phi$ to be well-defined, then at least one of the entries in the output needs to be nonzero. For definiteness, say $phi([x_0,x_1,x_2])=[x_1x_2,x_0x_2,x_0x_1]$ has the first coordinate being nonzero, then $x_1x_2!=0$ implies $x_1,x_2!=0$. Apply similar logic to the other two coordinates, one can deduce that on the open set where $phi$ is well-defined, one must have at least two coordinates being nonzero. Also, conversely if two of the coordinates are nonzero (for definiteness, say $x_1,x_2!=0$), then $phi([x_0,x_1,x_2])=[x_1x_2,x_0x_2,x_0x_1]$ has the first coordinate being nonzero, which is well-defined.

    So, $phi$ being well-defined at $[x_0,x_1,x_2] in PP^2$ iff two of its coordinates are nonzero. Hence, $phi([x_0,x_1,x_2])$ is well-defined iff $[x_0,x_1,x_2] in W = (U_0 sect U_1) union (U_0 sect U_2) union (U_1 sect U_2)$, where each open set $U_i := PP^2\\H_i = {x_i!=0}$. This will be the open set where $phi$ is well-defined.

    \ 
    
    Besides the collection $U_0 sect U_1 sect U_2 = U$ (where $U$ defined in part (a) has $phi$ as a self-isomorphism on $U$), there are other sets (not necessarily open in $PP^2$) that is within the domain $W$. Given $W\\U$, it is the collection of points in $W$ (with at least 2 nozero coordinates) that're not in $U$ (not all 3 coordinates are nonzero), which there are exactly 2 coordinates being nonzero. So, $W\\U = union.big_(i=0)^2 W sect H_i$ (which each $W sect H_i$ is the set with $x_i=0$, and the other two cordinates being nonzero).

    Given each $W sect H_i$ (for definiteness, we'll demonstrate $i=0$), since $x_0=0$ and $x_1,x_2!=0$, then one has $phi([0,x_1,x_2]) = [x_1x_2,0 dot x_2, 0 dot x_1] = [1,0,0] in PP^2$. Apply similar logic to other index $i$, one can deduce that any $W sect H_i$ has all its points being sent to the point where $x_i=1$, and other coordinates are $0$.

    \

    So as conclusion, $phi:W arrow.r PP^2$ has $phi:U arrow.r.tilde U$ given by $phi([x_0,x_1,x_2])=[1/x_0,1/x_1,1/x_2]$; also, $phi:W sect H_0 arrow.r PP^2$ is given by $phi([x_0,x_1,x_2]) = [1,0,0]$, $phi:W sect H_1 arrow.r PP^2$ by $phi([x_0,x_1,x_2]) = [0,1,0]$, and $phi:W sect H_2 arrow.r PP^2$ by $phi([x_0,x_1,x_2])=[0,0,1]$. 
]