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

= D//1
#problem[
  Hartshorne 3.14:

  #emph[Projection from a Point]. Let $PP^n$ be a hyperplane in $PP^(n+1)$ and let $P in PP^(n+1)\\PP^n$. Define a mapping $phi:PP^(n+1)\\ {P} arrow.r PP^n$ by $phi(Q) = $ the intersection of the unique line containing $P$ and $Q$ with $PP^n$.

  + Show that $phi$ is a morphism.
  + Let $Y subset.eq PP^3$ be the twisted cubic curve which is the image of the $3$-tuple embedding of $PP^1$ (EX. 2.12). If $t,u$ are the homogeneous coordinates on $PP^1$, we say that $Y$ is the curve given #emph[parametrically] by $[x,y,z,w]=[t^3,t^2u,t u^2,u^3]$. Let $P=[0,0,1,0]$, and let $PP^2$ be the hyperplane $z=0$. Show that the projection of $Y$ from $P$ is a cuspidal cubic curve in the plane, and find its equation.
][
  + First, for any $Q in PP^(n+1)\\PP^n$, define the line $r_Q:PP^1 arrow.r PP^(n+1)$ by $r_Q ([s,t]) = s P+t Q = [s p_0+t q_0,s p_1+t q_1,...,s p_(n+1)+t q_(n+1)]$ as the line embedding (Note: this is well-defined because $Q!=P$, so their representative in $AA^(n+2)$ are linearly independent, hence the only equation satisfying $s P+t Q=0$ is $s=t=0$, which is not allowed in $PP^1$). WLOG, define $PP^n := {[x_0,x_1,...,x_(n+1)] in PP^(n+1)|x_0=0}$, then the intersection of $PP^n$ with the line $phi_Q$ happens when $s p_0+t q_0=0$. Which, there are two cases:
    - If $Q in PP^n$ (i.e. $q_0=0$), with $P in.not PP^n$, we have $p_0!=0$. Thn, $s p_0+t q_0=s p_0=0$ implies $s=0$. So, the corresponding point must have $t!=0$, showing that $[s,t]=[0,1] in PP^1$ is the only point satisfying $r_Q ([s,t]) in PP^n$.
    - If $Q in.not PP^n$ (i.e. $q_0!=0$), then notice that the linear functional $k^2 arrow.r k$ by $(s,t) mapsto s p_0+t q_0$ is non-degenerate (ex: $(s,t)=(0,1)$ has output $q_0!=0$), hence this linear map has kernel being dimension $1$ (i.e. kernel is $span{u}$ for some nonzero $u in k^2$). So, given any $[s,t] in PP^1$ satisfying $s p_0+t q_0=0$, we must have $(s,t) in span{u}$, showing that $[s,t]=[u]$ when taking the quotient of $PP^1$ as rays of $k^2$ passing through $0$. So, $[u] in PP^1$ is the unique point where $r_Q ([u]) in PP^n$.

    With the two cases established, each line passing through $P$ and $Q$ must have a unique intersection, so the map $phi(Q) = $ the intersection of the line $r_Q$ with $PP^n$ is well-defined.

    \ 

    To show it's in fact a morphism, notice that the solution to the above intersection (of the line through $P,Q$ and $PP^n$) is given by the solution to $s p_0+t q_0=0$. With $p_0!=0$ (using the assumption that $P in.not PP^n = {[x] in PP^(n+1)|x_0=0}$), we naturally have $s = -(t q_0)/p_0$. Which, we must have $t!=0$ (since if $t=0$, $s=0$, which $[s,t]$ is not well-defined in $PP^1$). Then, WLOG can treat $t=1$. Hence, we have $[s,t]=[-q_0/p_0, 1]$.

    So, the map $phi:PP^(n+1) arrow.r PP^n$ is explicitly given as follow:
    $ phi(Q) &= q_0/p_0 P+Q = [-p_0/p_0 q_0+q_0, -p_1/p_0 q_0+q_1,..., -p_(n+1)/p_0 q_0+q_n] \ 
    &= [0, -p_1/p_0 q_0+q_1,..., -p_(n+1)/p_0 q_0+q_(n+1)] in PP^n $
    Since in terms of the coordinate $[q_0,...,q_(n+1)]$ of $PP^(n+1)$ the above map has all the polynomials in each entry being the same degree, it is a rational map; furthermore, since it's well-defined on $PP^(n+1)\\{P}$, it's in fact a well-defined morphism.

    \ 

  + Given $P=[0,0,1,0]$ and the twisted cubic curve $[x,y,z,w]=[t^3,t^2u,t u^2,u^3]$ for all $[t,u] in PP^1$, and $PP^2:={[x,y,z,w] in PP^3|z=0}$. Then, for each $[t,u] in PP^1$, the corresponding line through $[t^3, t^2u, t u^2, u^3]$ and $P=[0,0,1,0]$ intersects $PP^2$ when $[a,b] in PP^1$ satisfies $a dot 1+b dot t u^2=0$, showing that the point $[a,b] = [-t u^2, 1]$ based on the logic from part (a) (where $b!=0$, so $b=1$ can be chosen).

    Which, the intersection of the line through $P,Q$ and $PP^2$ is given by $a P + b Q$, and it's given as follow:
    $ a P+b Q&=[-t u^2 dot 0+t^3, -t u^2 dot 0+t^2 u, -t u^2 dot 1+t u^2, -t u^2 dot 0+u^3]\ 
    &= [t^3, t^2u, 0, u^3] $
    Now, if consider the curve $[t^3, t^2 u, u^3] in PP^2$ (which is an analogy to the previous curve), using $[x,y,z]$ as coordinates of $PP^2$, every point on the curve satisfies the equation $x^2 z=y^3$ (since we have $(t^3)^2 u^3 = t^6 u^3=(t^2 u)^3 $). However, we can claim something even stronger, that every $[x,y,z]$ satisfying $x^2 z=y^3$ is contained in the curve ${[t^3,t^2u, u^3]}$: 
    
    If $z=0$, then since $y^3 = x^2 z=0$, hence $y=0$. So, for the point $[x,y,z]$ to be well-defined, $x!=0$, hence can choose $x=1$. So, the point is $[x,y,z]=[1,0,0]$, which belongs to the curve by choosint $[t,u]=[1,0]$ (so $[t^3.t^2u,u^3]=[1,0,0]$).

    Else, if $z!=0$, there are two cases:
    - If $x=0$, then one has $y^3=x^2z = 0$, hence $y=0$, showing that $[x,y,z]=[0,0,z]=[0,0,1]$. So, choose $[t,u]=[0,1]$ provides the corresponding point (since $[t^3,t^2u,u^3]=[0,0,1]$).
    - Else if $x!=0$, the $y^3=x^2z!=0$, showing that $y!=0$. So, by scaling the point to get $[x,y,z]=[x/z,y/z,1]$, choose $[t,u] = [x/y,1]$, it satisfies the following:
    $ [t^3,t^2u,u^3]=[x^3/y^3, x^2/y^2, 1]=[x^3,x^2y, y^3]=[x,y,y^3/x^2] = [x,y,z] $
    (Note: recall that $x^2 z=y^3$, so with $x,y,z!=0$, $z=y^3/x^2$).

    Hence, we concluded that $[x,y,z] in {[t^3,t^2u,u^2] in PP^2|[t,u]i PP^1}$ iff $x^2z=y$, this is the equation associated to the curve. And, notice that is the homogenization of the equation $x^2=y^3$ in $AA^2$, which generates the cuspidal cubic curve in $AA^2$, so the curve ${[t^3,t^2u,u^3]}$ in fact is the closure of the cuspidal cubic curve in $PP^2$.
]

#pagebreak()

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

\ 

= ND//3
#problem[
  Hartshorne 4.4:

  A variety $Y$ is #emph[rational] if it is birationally equivalent to $PP^n$ for some $n$ (or, equivalently by (4.5), if $k(Y)$ is a pure transcedental extension of $k$).
  + Any conic in $PP^2$ is a rational curve.
  + The cuspidal cubic $y^2=x^3$ is a rational curve.
  + Let $Y$ be the nodal cubic curve $y^2z=x^2(x+z)$ in $PP^2$. Show that the projection $phi$ from the point $P=(0,0,1)$ to the line $z=0$ (Ex. 3.14) induces a birational map from $Y$ to $PP^1$. Thus $Y$ is a rational curve.
][
  First, since here we're limited to $Y$ that's a variety, so every open subset of the given $Y$ is guaranteed to be dense and irreducible.
  + Let $[x,y,z]$ be the coordinates of $PP^2$, for any conic in $PP^2$ (that's also a varety), it's the algebraic set of the form $Y={a x^2+b y^2+c z^2+d x y+e x z+f y z=0}$, where the polynomial $a x^2+b y^2+c z^2+d x y+e x z+f y z in k[x,y,z]$ is irreducible (so the corresponding ideal is prime). Then, fix $P=[0,0,1] in PP^2$ and consider the projection defined in #text(weight: "bold")[Problem 1/Hartshorne 3.14] from $P$. Which, 

    \

  + Since the cuspidal cubic $y^2=x^3$ can be viewed as an affine variety in $AA^2$, it suffices to show that it's birationally equivalent to $AA^1 subset.eq PP^1$. Here, let $t$ be the coordinate of $AA^1$, and $(x,y)$ be the coordinates of $AA^2$.

    Given any $t in AA^1$, the morphism $phi:AA^1 arrow.r AA^2$ by $phi(t)=(t^2,t^3)$ has the image satisfies the equation $y^2 = (t^3)^2=t^6=(t^2)^3=x^3$, hence belong to the cuspidal cubic.

    Now, restrict the domain to open subsets $AA^1\\{0} subset AA^1$ and $Y\\{x=0} subset AA^2$ (where $Y={(x,y) in AA^2|y^2=x^3}$), notice the map becomes a rational isomorphism:
    
    The map $psi:AA^2 arrow.r.dashed AA^1$ given by $psi(x,y) = y/x$ is well-defined whenever $x!=0$. Hence, it is well-defined on $Y\\{x=0}$ (since all points with $x=0$ is removed). And, for any $t in AA^1\\{0}$ and $(x,y) in Y\\{x=0}$, the following two equations are true:
    $ psi compose phi(t)=psi(t^2,t^3) = t^3/t^2=t $
    $ phi compose psi(x,y)=phi(y/x) = (y^2/x^2, y^3/x^3) = (x^3/x^2, y^3/y^2)=(x,y) $
    The last equality holds because of the equation of $Y$ given by $y^2=x^3$. Hence, we've shown that $Y subset AA^2$ the cuspidal cuvic is birationally equivalent to $AA^1\\{0}$.

    Lastly, if consider $AA^1:= PP^1\\H_0$ (where $H_0:={[u,t] in PP^1|u=0} = {[0,1]}$). Since WLOG can assume $u=1$, each $[u,t] in PP^1\\H_0$ can be identified just by $t$; then, since $0 in AA^1$ is identified by the point $[1,0] in PP^1\\H_0$, the corresponding open set $AA^1\\{0} = (PP^1\\H_0)\\{[1,0]} = PP^1\\(H_0 union {[1,0]})$ is an open subset of $PP^1$. Hence, the cuspidal cubic $Y subset AA^2$ is birationally equivalent to $PP^1$.

      \ 

  + Given any $[x,y,z] in PP^2\\{P}$ where $P=[0,0,1]$, the projection onto $PP^1 := {[x,y,z] in PP^2|z=0}$ is given by a unique $[s,t] in PP^1$ satisfying $s dot 1+t z = 0$ (proved in #text(weight: "bold")[Problem 1, Hartshorne 3.14]). Which, it is given by $s=t z$, where $t$ can be chosen as $1$, so $[s,t]=[z,1] in PP^1$ is the point satisfying the property, which induces the projection of $[x,y,z]$ onto $s P+t [x,y,z] = [0+x,0+y,z-z]=[x,y,0] in PP^1$. So, let $Y={y^2z=x^2(x+z)}$ be the nodal cubic curve (#text(weight: "bold")[Rmk:]$P=[0,0,1] in Y$, but the projection is invalid at this point), then the previous projection when excluding $P$, has $pi:Y arrow.r.dashed PP^1$ by $pi([x,y,z]) = [x,y]$ being a well-defined rational map on $Y\\{P}$ (since the only point when it's not well-defined, is when both $x,y=0$, yet this enforces $[x,y,z]=[0,0,1]=P$, hence excluding $P$ makes $pi$ well-defined).

    \ 

    Now, to find a rational inverse, consider the open subset $PP^1\\{y^2-x^2=0}$ of $PP^1$, and consider the rational map $psi:PP^1 arrow.r.dashed Y$ by $psi([x,y]) = [x(y^2-x^2),y(y^2-x^2),x^3]$. First, on open subset $PP^1\\{y^2-x^2=0}$ this map is well-defined, since any point $[x,y] in PP^1\\{y^2-x^2=0}$ satisfies $y^2-x^2!=0$, and either $x!=0$ or $y!=0$, hence either $x(y^2-x^2)!=0$ or $y(y^2-x^2)!=0$, so $psi([x,y]) in PP^2$; also, since $y^2-x^2!=0$, the output satisfies the following:
    $ psi([x,y])=[x(y^2-x^2),y(y^2-x^2),x^3]=[x,y,x^3/(y^2-x^2)] $
    Which, such point satisfies:
    $ y^2(x^3/(y^2-x^2)) = x^2(x(y^2)/(y^2-x^2)) = x^2((x(y^2-x^2)+x^3)/(y^2-x^2)) = x^2(x+x^3/(y^2-x^2)) $
    So, let $z=x^3/(y^2-x^2)$, $psi([x,y])=[x,y,z]$ satisfies $y^2z=x^2(x+z)$, showing that $psi([x,y]) in Y$. So, $psi:PP^1 arrow.r.dashed Y$ is indeed a well-defined rational map on open subset $PP^1\\{y^2-x^2=0}$.

    \ 

    Finally, given $PP^1\\{y^2-x^2=0} subset PP^1$ as open subset, and $Y\\({P} union {y^2-x^2=0}) subset Y$ as another open subset, one can show $pi,psi$ are indeed mutual inverses: We've already shown that $pi:Y arrow.r.dashed PP^1$ is well-defined on $Y\\{P}$, hence also well-defined on $Y\\({P} union {y^2-x^2=0})$; also, $psi:PP^1 arrow.r.dashed Y$ is well-defined on $PP^1\\{y^2-x^2=0}$. 
    
    Then, given any $[x,y,z] in Y\\({P} union {y^2-x^2=0})$ (satisfying $x!=0$ or $y!=0$, with extra condition $y^2-x^2!=0$), it satisfies:
    $ pi([x,y,z])=[x,y] in PP^1\\{y^2-x^2=0} $
    $ psi compose pi([x,y,z])=psi([x,y])=[x,y,x^3/(y^2-x^2)] $
    Since $y^2-x^2!=0$, then with the point satisfying $y^2z=x^2(x+z)$, we have $(y^2-x^2)z=x^3$, or $z=x^3/(y^2-x^2)$, showing that $psi compose pi([x,y,z])=[x,y,x^3/(y^2-x^2)]=[x,y,z]$, which $psi compose pi = id$ on $Y\\({P} union {y^2-x^2=0})$.

    Similarly, any $[x,y] in PP^1\\{y^2-x^2=0}$ (with $x!=0$ or $y!=0$, together with $y^2-x^2!=0$), it satisfies:
    $ psi([x,y])=[x,y,x^3/(y^2-x^2)] in Y\\({P} union {y^2-x^2=0}) $
    $ pi compose psi([x,y]) = pi([x,y,x^3/(y^2-x^2)])=[x,y] $
    Hence, $pi compose psi = id$ on $PP^1\\{y^2-x^2=0}$ also.
    
    This shows that $pi,psi$ are indeed mutual inverse on these restricted open subsets, hence $Y$ and $PP^1$ are indeed birationally equivalent, $Y$ is a rational curve.
]

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