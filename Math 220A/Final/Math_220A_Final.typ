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
    styles: ergo-styles.sidebar2, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 220A Final",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Setup: Induced Representations
Let $H < G$ be a subgroup of a finite group $G$. In the recording of the last lecture, we have defined the functor 
  $ Ind^G_H:Rep_k G-> Rep_k H $
  from (finite dimensional) representations of $H$ to representations of $G$ as the #text(weight: "bold")[right adjoint] of the restriction functor $Res^G_H:Rep_k G-> Rep_k H$. The first part of this problem is to prove that this right adjoint exists and study some of its properties.

\ 

= Problems:
#set enum(numbering: "(1)")
== D//1
#problem[
  Let $W in Rep_k (H)$ be a finite dimensional representation of $H$. Define a $k$-vector space $W'$ as follow: Let 
  $ W':={phi:G ->W | phi(h g) = h dot phi(g), quad forall h in H, " " g in G} $
  Next, for any $g in G$ and $phi in W'$, let 
  $ g dot phi:G -> W $
  denote the function sending $x mapsto phi(x g)$. Show that $g dot phi in W'$ and show that the association $(g,phi) mapsto g dot phi$ defines a representation of $G$ on $W'$. We shall define $Ind^G_H W=W'$ as a representation of $G$ (at the moment you should take $Ind^G_H$ as a symbol. Later we will justify such a choice by showing this indeed provides the desired right adjoint of $Res^G_H$).
][
  First, given any $phi in W'$ and $g, x in G$, one has $(g dot phi)(x) = phi(x g)$. Which, for all $h in H$, one has the following:
  $ (g dot phi)(h x) = phi(h x g)=h dot phi(x g) = h dot (g dot phi)(x) $
  Hence, this relation shows that $g dot phi in W'$.

  Now, to prove that the association $(g, phi) mapsto g dot phi$ defines a representation, first we show it's a linear map: Given any $a,b in k$, $phi, psi in W'$, and any $g,x in G$, one has the following:
  $ (g, a phi+b psi)(x) &= g dot (a phi+b psi)(x) = a phi(x g)+b psi(x g) = a(g dot phi)(x) + b(g dot psi)(x)\ 
  &= (a (g,phi)+b (g,psi))(x) $
  So, $(g, a phi+b psi)=a(g,phi)+b(g,psi)$, showing such association is a linear map.

  Then, to show it's a group action, for any $g,g',x in G$ and $phi in W'$, one has the following:
  $ (g, (g', phi))(x) &= (g dot (g' dot phi))(x) = (g dot phi)(x g) = phi(x g g') = (g g' dot phi)(x) = (g g', phi)(x) $
  So, $(g,(g',phi)) = (g g', phi)$, showing such association forms a group action. Hence, this defines a group representation of $G$ (since it's a group action, which is a group homomorphism into the automorphism group of $W'$; and, it's verified that all such automorphism is a linear operator of $W'$, hence results in a group homomorphism $G -> GL(W')$).
]

\ 

== D//2
#problem[
  Let $K<H<G$ be subgroups of $G$. Let $W_0$ be a finite-dimensional representation of $K$. Show that 
  $ Ind^G_K W_0 tilde.equiv Ind^G_H " " Ind^H_K W_0 $
  as $G$-representations.
][

  #text(weight: "bold")[I. The Linear Map $T: Ind^G_K W_0 -> Ind^G_H(Ind^H_K W_0)$:]

  First, notice that for all $phi:G->W_0$ in $Ind^G_K W_0$, its restriction onto $H$ has $phi eval(#200%)_H in Ind^H_K W_0$, since for all $y in H$ and $k in K < H$, one has $k y in H$, hence $phi eval(#200%)_H (k y) = phi(k y) = k dot phi(y) = k dot (phi eval(#200%)_H (y))$. 

  Which, based on this property, one can define a map $T_phi:G -> Ind^H_K G$ by $T_(phi)(g) = (g dot phi) eval(#200%)_H$. Notice that $T_phi in Ind^G_H (Ind^H_K W_0)$: For any $h,y in H$ and $g in G$, one has the following result:
  $ T_(phi)(h g)(y) &= ((h g) dot phi)eval(#200%)_H (y) = ((h g) dot phi)(y) = (h dot (g dot phi))(y)  = (g dot phi)(y h) $
  Which, since $y,h in H$, then $y h in H$ also. So, one results in the following:
  $ T_(phi)(h g)(y) = (g dot phi)(y h) = (g dot phi)eval(#200%)_H (y h) = h dot ((g dot phi)eval(#200%)_H)(y) = h dot T_phi (g)(y) $
  Hence, one deduces that $T_phi (h g) = h dot T_phi (g)$, which satisfies the property of $Ind^G_H (Ind^H_K W_0)$.

  Finally, based on this property, define the map $T:Ind^G_K W_0 -> Ind^G_H (Ind^H_K W_0)$ by $T(phi):= T_phi$. Which, for all $a,b in k$, and $phi, psi in Ind^G_K W_0$, it satisfies the following for all $g in G$:
  $ T(a phi+b psi)(g) &= T_(a phi+b psi)(g) = (g dot (a phi+b psi)) eval(#200%)_H = (a (g dot phi) + b (g dot psi))eval(#200%)_H\ 
  &= a((g dot phi)eval(#200%)_H) + b((g dot psi)eval(#200%)_H) = a T_phi (g)+b T_psi (g) = (a T(phi)+b T(psi))(g)  $
  Hence, we conclude that $T(a phi+b psi) = a T(phi)+b T(psi)$ as maps in $Ind^G_H (Ind^H_K W_0)$, showing $T$ is indeed a linear map.

  \ 

  #text(weight: "bold")[II. $T$ is a Linear Isomorphism:]

  For this, we'll define an inverse. Given any map $Phi in Ind^G_H (Ind^H_K W_0)$, it is an association $Phi(g)=  phi_g in Ind^H_K W_0$, such that for all $h in H$, one has $Phi(h g)= phi_(h g) = h dot (phi_g) = h dot Phi(g)$ (by the definition of $Ind^G_H$). Which, for observation purpose, suppose there exists $phi in Ind^G_K W_0$, such that $T(phi) = T_phi$ matches such association $Phi$ (i.e. for all $g in G$, one has $T_phi (g) = (g dot phi)eval(#200%)_H = phi_g = Phi(g)$), then $phi$ must satisfy $phi(g) = phi(1 g) = (g dot phi)(1) = phi_g (1) = Phi(g)(1)$ (here $1 in G$ is the identity, also in $H$). 
  
  So, define the map $phi:G -> W_0$, by $phi(g) := phi_g (1)$. We claim that $phi in Ind^G_K W_0$: Given any $g in G$ and $k in K$, one has the following (Note: Since $k in K < H$, so the above property of $phi_g$ can be used):
  $ phi(k g) = phi_(k g)(1) = (k dot phi_g)(1) = phi_g (k) = k dot (phi_g (1)) = k dot phi(g) $
  (Note the third equality is based on the fact that $phi_g in Ind^H_K W_0$). Which, $phi$ satisfies the property of elements in $Ind^G_K W_0$. Also, notice that $T_phi$ satisfies the following for all $g in G$ and $h in H$:
  $ (T_phi (g)) (h) = (g dot phi)eval(#200%)_H (h) = (g dot phi)(h) = phi(h g) = phi_(h g)(1) = (h dot phi_g)(1) = phi_g (h) $
  This shows that $T_phi (g) = phi_g = Phi(g)$ for all $g in G$, achieving the fact that $T_phi = Phi$.

  \ 

  Now, we define the map $S:Ind^G_H (Ind^H_K W_0) -> Ind^G_K W_0$, by $S(Phi):= phi$ that is defined above, and claim that $S = T^(-1)$: Given any $phi in Ind^G_K W_0$, one has the following:
  $ S compose T(phi) = S(T_phi), quad forall g in G, " " S(T_phi)(g) = T_phi (g)(1) = (g dot phi)eval(#200%)_H (1) = (g dot phi) (1) = phi(g) $
  This shows that $S compose T(phi) = phi in Ind^G_K W_0$. Also, Based on the result proven before, any $Phi in Ind^G_H (Ind^H_K W_0)$ has $phi = S(Phi)$ satisfies $T(phi) = T_phi = Phi$. Hence, these two equaltiy shows that $S compose T = id_(Ind^G_K W_0)$, while $T compose S = id_(Ind^G_H (Ind^H_K W_0))$, showing $S$ is the inverse of $T$. Hence, $Ind^G_K W_0 tilde.equiv Ind^G_H (Ind^H_K W_0)$ as $k$-vector spaces.

  \ 

  #text(weight: "bold")[III. $T$ is a $G$-representation Isomorphism:]

  It suffices to show that $T$ is a $G$-representation morphism. Given any $g,g' in G$ and any $phi in Ind^G_K W_0$, one has the following action on $h in H$:
  $ &(T(g dot phi))(g') = T_(g dot phi)(g') = (g' dot (g dot phi))eval(#200%)_H =((g' g) dot phi)eval(#200%)_H\ 
  &(g dot T(phi))(g') = (g dot T_phi)(g') = T_phi (g' g) = ((g' g) dot phi)|_H  $
  This shows that $T(g dot phi) = g dot T(phi)$ as map in $Ind^G_H (Ind^H_K W_0)$. Hence, $T$ is a $G$-representation morphism, hence a $G$-representation isomorphism.

  As a consequence, $Ind^G_K W_0 tilde.equiv Ind^G_H (Ind^H_K W_0)$ as $G$-representations.
]

#pagebreak()

== D//3
#problem[
  Choose representatives ${x_1,...,x_l}$ of $G\/H$, and write $G = union.sq.big_(i=1)^l H x_i$ (we may and will always assume that  $x_1=1$). Let $W^((i)) subset Ind^G_H W$ denote the subspace 
  $ W^((i)):={phi in Ind^G_H W | phi(x) = 0 "if" x in.not H x_i} $
  Show that each $W^((i))$ has dimension equal to $dim_k W$. Show that as vector spaces, we have 
  $ Ind^G_H W tilde.equiv plus.circle.big_(i=1)^l W^((i)) $
  Conclude that $Ind^G_H W$ has dimension $[G:H] dot dim_k W$ as a vector space over $k$.
][

  #text(weight: "bold")[I. Dimension of $W^((i))$:]

  First fix an arbitrary representative $x_j$. Let $n = dim_k W$, choose a basis $w_1,...,w_n in W$, and for each $i in {1,...,n}$, define $phi_i:G -> W$ as follow:
  $ phi_i (x) = cases(
    h dot w_i\, quad x = h x_j in H x_j,
    0\, quad quad quad "otherwise"
  ) $
  Notice that given any $g in G$ and $h in H$, there are two cases:
  - If $g in H x_j$ (say $g = h' x_j$), then $h g in H x_j$, so $phi_i (h g) = (h g) dot w_i = h dot (h' dot w_i) = h dot (phi_i (g))$.
  - Else if $g in.not H x_j$, then $h g in.not H x_j$, showing $phi_i (h g) = 0 = h dot 0 = h dot (phi_i (g))$.

  Hence, regardless of the case one has $phi_i (h g) = h dot phi_i (g)$ for all $g in G$ and $h in H$, showing $phi_i in Ind^G_H W$ (in particular in $W^((i))$).

  Now, we claim that $phi_1,...,phi_n$ forms a basis for $W^((j))$:
  - For spanning property, given any $phi in W^((j))$, let $phi(x_j) = sum_(i=1)^n a_i w_i$, which we claim that $phi = sum_(i=1)^n a_i phi_i$: For all $g in G$, if $g in.not H x_j$, it's clear that $phi(g) = 0 = sum_(i=1)^n a_i phi_i (g)$; else if $g in H x_j$, there exists $h in H$ such that $g = h x_j$. Hence, it satisfies the following:
    $ phi(g) = phi(h x_j) = h dot phi(x_j) = sum_(i=1)^n a_i (h dot w_i) = sum_(i=1)^n a_i phi_i (g) $
    So, one concludes that $phi = sum_(i=1)^n a_i phi_i$, showing ${phi_1,...,phi_n}$ form a spanning set.

  - For linear independence, suppose $sum_(i=1)^n a_i phi_i = 0$, plugin $x_j$, one has $sum_(i=1)^n a_i phi_i (x_j) = sum_(i=1)^n a_i w_i = 0$, so by linear independence of ${w_1,...,w_n}$, it enforces all $a_i=0$. Hence, the list ${phi_1,...,phi_n}$ is linearly independent.

  This shows that ${phi_1,...,phi_n}$ indeed forms a basis for $W^((j))$, hence $dim_k W^((j)) = n =  dim_k W$.

  \ 

  #text(weight: "bold")[II. Direct Sum Decomposition of $Ind^G_H W$:]

  For all $phi in Ind^G_H W$, let each $j in {1,...,l}$ corresponds to a map $phi^((j)):G -> W$ as follow:
  $ phi^((j))(x) = cases(
    phi(x)\, quad x in H x_j,
    0\, quad quad "otherwise"
   ) $
  Which, for all $g in G$ and $h in H$, if $g in H x_j$, one has $h g in H x_j$, hence $phi^((j))(h g) = phi(h g) = h dot phi(g) = h dot phi^((j))(g)$; else if $g in.not H x_j$, then $h g in.not H x_j$, showing $phi^((j))(h g)=0 = h dot 0 = h dot phi^((j))(g)$. So, one has $phi^((j)) in Ind^G_H W$, in particular $phi^((j)) in W^((j))$ by definition.

  \ 

  Notice that $phi = sum_(j=1)^l phi^((j))$, since for all $g in G$, there exists a unique $i in {1,...,l}$, such that $g in H x_i$. So, one has $phi^((j))(g) = delta_(i j) phi(g)$ (since for $i!=j$ its $0$, for $i=j$ it's $phi(g)$). Hence, $phi(g) = sum_(j=1)^l delta_(i j)phi(g) = sum_(j=1)^l phi^((j))(g)$, showing $phi = sum_(j=1)^l phi^((j))$ (since $g in G$ is arbitrary). This proves that $Ind^G_H W = sum_(j=1)^l W^((j))$ (since each $phi in Ind^G_H W$ can be expressed as sums of elements in each $W^((j))$).

  \ 

  Now, to show it's indeed a direct sum, suppose for each $j in {1,...,l}$, the corresponding $phi^((j)) in W^((j))$ satisfies $sum_(j=1)^l phi^((j))=0$, then fix any representative $x_i$, any $g in H x_i$ has $phi^((j))(g) = 0$ (if $i!=j$), so one has the following:
  $ sum_(j=1)^l phi^((j))(g) = phi^((i))(g) = 0 $
  Then, since $g in H x_i$ is arbitrary, this shows that $phi^((i)) = 0$ (since the only possible nonzero values are from $H x_i$, but now they're all zero). So, each component must be zero, showin that the $W^((j))$ does form a direct sum. Hence, $Ind^G_H W = plus.circle.big_(i=1)^l W^((i))$.

  As a result, since each $dim_k W^((i)) = dim_k W$, and the number of representatives $l = [G:H]$, one has $dim_k (Ind^G_H W) = sum_(i=1)^l dim_k W^((i)) = l dot dim_k W = [G:H] dot dim_k W$.
]

\ 

== D//4
#problem[
  Next, for any $w in W$ and $1<=i<=l$, let us consider the following function 
  $ phi_w^((i)):G -> W $
  which sends an element of the form $h x_i$ (where $h in H$) to $h dot w$ and all other elements (namely ones of the form $h x_j$ for $j!=i$) in $G$ to $0$. Show that $phi^((i))_w in W^((i))$ and in fact we have 
  $ W^((i)) = {phi^((i))_w | w in W} $
  as subspaces of $Ind^G_H W$.
][
  First, to show that $phi^((i))_w in W^((i))$, it suffices to show that $phi^((i))_w in Ind^G_H W$ (since by description it already satisfies the requirement that $phi(g)=0$ for $g in.not H x_i$, so it just needs to be in the space). Given any $g in G$ and $h in H$, if $g in H x_i$, there exists $h' in H$ where $g = h' x_i$, then one has $phi^((i))_w (h g) = phi^((i)) = ((h h') x_i) = (h h') dot w = h dot (h' dot w) = h dot phi^((i))_w (g)$, showing that $phi^((i))_w$ satisfies the property for being in the space, hence $phi^((i))_w in Ind^G_H W$, which is also in $W^((i))$.

  \ 

  Now, for every $phi in W^((i))$, soncider the vector $w = phi(x_i)$: For any $g in H x_i$, there exists $h in H$ such that $g = h x_i$, hence one has the following:
  $ phi(g) = phi(h x_i) = h dot phi(x_i) = h dot w = phi^((i))_w (x_i) $
  Else if $g in.not H x_i$, it's clear that $phi(g) = 0 = phi^((i)_w (x_i))$. So, one has $phi = phi^((i))_w$, where $w = phi(x_i)$. 

  This shows that $W^((i)) = {phi^((i))_w | w in W}$ for each index $i$. 
]

#pagebreak()

== D//5
#problem[
  Show that for all $phi in Ind^G_H W$, we have 
  $ phi = sum_(i=1)^l phi^((i))_(phi(x_i)) $
][
  For all $g in G$, there exists a unique index $i in {1,...,l}$, such that $g in H x_j$, hence one has a unique $h in H$ also such that $g = h x_j$. Which, for all index $i!=j$, one has $phi^((i))_(phi(x_i))(g) = 0$ (since $g in.not H x_i$), and for $i=j$, one has the following:
  $ phi^((j))_(phi(x_j))(g) = phi^((j))_(phi(x_j))(h x_j) = h dot phi(x_j) = phi(h x_j) = phi(g) $
  So, one concludes that $phi(g) = phi^((j))_(phi(x_j))(g) = sum_(i=1)^l phi^((i))_(phi(x_i))(g)$. Hence, with $g in G$ being arbitrary, $phi = sum_(i=1)^l phi^((i))_(phi(x_i))$ being the unique decomposition for the previous direct sums.
]

\ 

== D//6
#problem[
  Now let $W in Rep_k H$ and let $V in Rep_k G$. Consider the (evaluation) map 
  $ e:Ind^G_H W -> W $
  seding $phi mapsto phi(1)$ as a map between vector spaces. Show that $e$ is in fact a map between $H$-representations.
][
  First, let's verify that $e$ is a linear map: For any $a,b in k$ and $phi, psi in Ind^G_H W$, one has the following:
  $ e(a phi+b psi) = (a phi+b psi)(1) = a phi(1)+b psi(1) = a dot e(phi) + b dot e(psi) $
  So, it's a linear map. Now, for all $h in H$ and $phi in Ind^G_H W$, one has the following:
  $ e(h dot phi) = (h dot phi)(1) = phi(1 h) = h dot (phi(1)) = h dot (e(phi)) $
  This shows that $e$ is an $H$-representation morphism.
]

\ 

== D//7
#problem[
  Use Part (6) to show that $Ind^G_H$ is a right adjoint of $Res^G_H$.
][
  Given any $V in Rep_k (G)$ and $W in Rep_k (H)$, notice that the evaluation map $e:Ind^G_H W -> W$ in #text(weight: "bold")[Problem 6]. Then, for any $G$-representation morphism $T in Hom_G (V, Ind^G_H W)$ (which is also an $H$-representation morphism by restricting to only the $H$-action), then $e compose T:V -> W$ is in fact a $H$-representation morphism (here denote $Res^G_H V:= V$ as vector space, with only the $H$-representation structure). Hence, the map $e compose \_:Hom_G (V, Ind^G_H W)-> Hom_H (Res^G_H V, W)$ by $T mapsto e compose T$ is a well-defined map (in fact a $k$-linear map).

  \ 

  Now, the goal is to show that $e compose \_$ is a bijection by constructing an inverse: Given any $H$-representation morphism $S in Hom_H (Res^G_H V, W)$, for all $v in V$, define a map $phi_v: G -> W$, by $phi_v (x) := S(x dot v)$. Notice that for any $x in G$, $h in H$, this map satisfies the following:
  $ phi_v (h x) = S((h x)dot v)= S(h dot (x dot v)) = h dot S(x dot v) = h dot phi_v (x) $
  Hence, this implies $phi_v in Ind^G_H W$. Which, define a map $I_S:V -> Ind^G_H W$ by $I_S (v) := phi_v$, we can show it's in fact a $G$-representation morphism:
  - First, given any $a,b in k$ and $u,v in V$, the map satisfies the following:
    $ forall x in G, I_S (a u+b v)(x) &= phi_(a u+b v)(x) = S(x dot (a u+b v)) = a S(x dot u)+b S(x dot v)\ 
    &= a phi_u (x) + b phi_v (x) = (a I_S (u)+b I_S (v))(x) $
    Hence, $I_S (a u+b v)= a I_S (u)+b I_S (v)$, showing it's a linear map.
  - Given any $g, x in G$ and $v in V$, one has the map satisfies the following:
    $ I_S (g dot v)(x) &= phi_(g dot v)(x) = S(x dot (g dot v)) = S((x g) dot v) \ 
    &= phi_(v)(x g) = (g dot phi_v)(x) = (g dot I_T (v))(x) $
    This shows that $I_S (g dot v) =g dot I_S (v)$, showing $I_S$ is a $G$-representation morphism,

  \ 

  With these properties, define a map $f:Hom_H (Res^G_H V, W)-> Hom_G (V, Ind^G_H W)$ by $f(S):= I_S$ defined above. Which, we claim that $e compose \_$ and $f$ are mutual inverse.

  - Given any $T in Hom_G (V, Ind^G_H W)$, any $v in V$ has $T(v) in Ind^G_H W$, which for all $x in G$, one hasthe following:
    $ T(v)(x) = T(v) (1 x) = (x dot T(v))(1) = e(x dot T(v)) $
    Also, $f(e compose T) = I_(e compose T)$ has all $v in V$ satisfies the following for all $x in G$:
    $ I_(e compose T)(v)(x) = e compose T(x dot v) = e(x dot T(v)) $
    Hence, one gets that $T(v) = I_(e compose T)(v)$, showing $T = I_(e compose T) = f(e compose T)$. Hence, $f compose (e compose\_)$ is identity on $Hom_G (V, Ind^G_H W)$.

  - Given any $S in Hom_H (Res^G_H V, W)$, one has $f(S) = I_S in Hom_G (V, Ind^G_H W)$. Which, for any $v in V$, $e compose I_S$ satisfies the following:
    $ e compose I_S (v) = e(phi_v) = phi_v (1) = S(1 dot v) = S(v) $
    Hence, this shows that $e compose (f(S)) = e compose I_S = S$, showing that $(e compose \_) compose f$ is identity on $Hom_H (Res^G_H V, W)$.

  Hence, these two properties show that $e compose \_:Hom_G (V, Ind^G_H W)-> Hom_H (Res^G_H V, W)$ and $f: Hom_H (Res^G_H V, W)-> Hom_G (V, Ind^G_H W)$ are mutual inverse, hence $Ind^G_H$ is a right adjoint of $Res^G_H$. 
]

#pagebreak()

== ND//8
#problem[
  Consider the following special example: Let $V_upright(s t)$ denote the irreducible $2$-dimensional representation of $S_3$. Compute the character of $Ind^(S_4)_(S_3) V_(s t)$, compute the character table of $S_4$, then decompose $Ind^(S_4)_(S_3)V_(s t)$ as direct sums of irreducible representations of $S_4$.
][
  Let's establish all the tools needed for this problem:

  \ 

  #text(weight: "bold")[I. Cosets of $S_3$ in $S_4$:]

  Let $S_3$ represents the permutation of ${1,2,3} subset {1,2,3,4}$, then one has $S_4$ being decomposed into the following:
  $ &S_3 = {e, (12),(13),(23),(123),(132)}\ 
  &S_3 (14) = {(14),(142), (143), (14)(23), (1423), (1432)}\ 
  &S_3 (24) = {(24),(124), (13)(24), (243), (1243), (1324)}\ 
  &S_3 (34) = {(34),(12)(34),(134),(234),(1234),(1342)} $
  With $S_4 = union.sq.big_(i=1)^3 S_3 (i 4)$.

  \ 

  \ 

  #text(weight: "bold")[II. Representation $V_upright(s t)$, and its character $chi_(V_upright(s t))$:]

  Consider the natural action of $S_3$ on $CC^3$ by permuting the standard basis. Which, the $2$-dimensional subspace $V = {(x,y,z) in CC^3 | x+y+z=0}$ is a subrepresentation (since permuting the coordinates leaves the coordinate sum invariant). Notice that it's an irreducible representation: Suppose the contrary that it's not irreducible, meaning there exists a nontrivial proper subrepresentation. With $dim V=2$, the proper subrepresentation must be dimension $1$, which is a common eigenvector for all elements in $S_3$. Yet, if $(x,y,z) in V$ is a common eigenvecor, one has the following: 
  $ lambda (x,y,z) = (12) dot (x,y,z) = (y,x,z), quad mu (x,y,z) = (123) dot (x,y,z) = (z,x,y) $
  where $lambda, mu$ are eigenvalues of $(12),(123)$ acting on $(x,y,z)$. This shows $z = lambda z$, so either $z=0$ or $lambda = 1$; and, $x = mu y$, $y = mu z$, and $z = mu x$.
  - If $lambda_(12) = 1$, the above indicates $x = y$ (hence $x = mu y$ implies $mu=1$ or $x=y=0$). But, it can't be $x=y=0$ (since then $z = mu x=0$, contradicting the fact that $(x,y,z)$ is nonzero eigenvector), so $mu=1$. As a result, $z=u x=x$, showing that $(x,y,z)=(x,x,x)$. Yet, since $x+x+x=0$, one has $x=0$, which is also a contradiction.
  - Else if $z = 0$, then one has $y = mu z = 0$ and $x = mu y = 0$, which is a contradiction since $(x,y,z)$ is an eigenvector (nonzero).
  So, since eventually we always reaches a contradiction, there can't be a nontrivial proper subrepresentation, showing $V$ is irreducible, hence $V tilde.equiv V_upright(s t)$, the only $2$-dimensional irreducible representation of $S_3$ over $CC$ (up to isomorphism).

  \ 

  Now, pick a basis ${f_1 = (1,-1,0), f_2 = (1,0,-1)} subset V$, one has the following actions (including the matrices under this basis):
  $ &(12) dot f_1 = (-1,1,0) = -f_1, quad (12) dot f_2 = (0,1,-1) = f_2 - f_1, quad cal(M)(12) = mat(-1,-1;0,1)\ 
  &(13) dot f_1 = (0,-1,1)=f_1-f_2, quad (13) dot f_2 = (-1,0,1)=-f_2, quad cal(M)(13)= mat(1,0;-1,-1)\ 
  &(23) dot f_1 = (1,0,-1) = f_2, quad (23) dot f_2 = (1,-1,0) = f_1,quad cal(M)(23) = mat(0,1;1,0) \
  &(123) dot f_1=(0,1,-1) = f_2-f_1, quad (123) dot f_2 = (-1,1,0) = -f_1, quad cal(M)(123) = mat(-1,-1;1,0) \ 
  &(132) dot f_1=(-1,0,1) = -f_2, quad (132) dot f_2 = (0,-1,1) = f_1-f_2, quad cal(M)(132) = mat(0,1;-1,-1)
   $
  
  Which, the character of $V_upright(s t)$ is as follow (using Conjugacy Classes):
  $ &chi_(V_upright(s t))(e) = dim V_upright(s t)= 2\ 
  &chi_(V_upright(s t))({(12),(13),(23)}) = tr((12)) = tr mat(-1,-1;0,1)=0\ 
  &chi_(V_upright(s t))({(123),(132)}) = tr((123)) = tr mat(-1,-1;1,0) = -1 $

  \
  
  \ 

  #text(weight: "bold")[III. Characters of Irreducible Representations of $S_4$ over $CC$:]

  The conjugacy classes of $S_4$ is determined by its cycle types (which is also equivalent to the ways of partitioning $4$ into positive integers). Which, $4 = 1+1+1+1$ (all $1$-cycle, or identity) $= 2+1+1$ (all $2$-cycles, or transpositions) $= 2+2$ (all disjoint $2$-cycles) $=3+1$ (all $3$-cycles) $= 4$ (all $4$-cycles). Here are the detailed conjugacy classes:
  $ &C_(1111) = {e}\ 
  &C_(211) = {(12),(13),(14),(23),(24),(34)}\ 
  &C_(22) = {(12)(34),(13)(24),(14)(23)}\ 
  &C_(31) = {(123),(132),(124),(142), (134),(143),(234),(243)}\ 
  &C_4 = {(1234),(1243),(1324),(1342),(1423),(1432)} $
  Which, there are $5$ distinct conjugacy classes, showing that $|S_4| = 24$ when representing as sum of dimension square irreducible representations, it's consists of $5$ perfect squares. Then, since $24 = 1+1+2^2+3^2+3^2$ is the only way of expressing it as sum of five perfect squares, this indicates that the irreducible representations must have dimension $1,1,2,3,3$ respectively. Here, we'll use $chi_t, chi_s, chi_2, chi_(3,1), chi_(3,2)$ denote the respective irreducible characters.

  Which, for $1$-dimensional representations, since $rho:S_4 -> GL_1 (CC) = CC^times$ has $tr(rho(sigma)) = rho(sigma)$, its character is the group homomorphism itself. And, $S_4$ has two common group homomorphisms into $CC^times$, namely the trivial representation $rho_t:S_4 -> CC^times$ by $rho_t (sigma) = 1$, and the sign representation $rho_s: S_4 -> CC^times$ by $rho_s (sigma) = sign(sigma)$. With $rho_t = chi_t$ and $rho_s = chi_s$, they have the following action:

  \ 

  #set align(center)
    #table(
    columns: 6,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1111)$],[$C_(211)$],[$C_(22)$],[$C_(31)$], [$C_4$],
    [$chi_t$], [$1$], [$1$], [$1$],[$1$],[$1$],
    [$chi_s$],[$1$],[$-1$], [$1$],[$1$],[$-1$]
    )
  #set align(left)

  \ 

  For the $2$-dimensional representation, with the Klein-4 group $K_4 = {e,(12)(34),(13)(24),(14)(23)}$ being normal in $S_4$, one has $S_4\/K_4$ being a group of order $(|S_4|)/ (|K_4|) = 24/4 = 6$; also, it's not abelian (since $overline((12))overline((23)) != overline((23))overline((12))$, due to the fact that $overline((12)(23)(12)^(-1)(23)^(-1)) = overline((132)) != overline(e)$ under the quotient), hence it has $S_4\/K_4 tilde.equiv S_3$ (the only non-abelian order 6 group, we've done this in #text(weight: "bold")[HW 1]). 
  
  More explicitly, a map $S_4\/K_4 -> S_3$ can be done on the generators, by $overline((12))mapsto (12)$, $overline((13)) mapsto (13)$, and $overline((23)) mapsto (23)$ (which as a result, $overline((34))= overline((12)) mapsto (12)$, $overline((24))=overline((13))mapsto (13)$, and $overline((14)) = overline((23)) mapsto (23)$. So, one also has $overline((124)) = overline((14)(12)) mapsto (23)(12) = (132)$ as a demonstration of permutations involving $4$). Hence, this pulls back the $2$-dimensional irreducible representation of $S_3$ (namely $V_upright(s t)$) to $S_4$, by $rho compose pi:S_4 -> GL(V_upright(s t))$ (where $rho:S_3 -> GL(V_upright(s t))$ is the $2$-dimensional irreducible representation of $S_3$, and $pi:S_4 -> S_3$ is the projection onto the quotient $S_4\/K_4 tilde.equiv S_3$). Then, $chi_2$ (the $2$-dimensional irreducible representation) must be this one (since $S_4 -> S_3$ is surjective, so if it's irreducible as $S_3$-representation, it's also irreducible as $S_4$-representation), so one has the following:
  #set align(center)
    #table(
    columns: 6,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1111)$],[$C_(211)$],[$C_(22)$],[$C_(31)$], [$C_4$],
    [$chi_2$], [$2$], [$0$], [$2$],[$-1$],[$0$]
    )
  #set align(left)

  (Note: Here uses the fact that the projection $pi:S_4 -> S_3$ has $(12)(34) mapsto (12)^2 = e$, $(1234) = (12)(13)(14) mapsto (12)(13)(23) = (13)$; so, with $(12),(13)$ having trace $0$ using the computation in #text(weight: "bold")[II], then $C_(211), C_(4)$ are evaluated to be $0$; $C_(22)$ is evaluated to be $2$ since its projection is down to identity; and, $C_(31)$ is evaluated to be $-1$, due to the projection $(123) mapsto (123)$).

  \ 

  Finally, for the $3$-dimensional representations, we'll explicitly calculate one of the representations (then the last one will be deduced from orthonormality), which we denote this one as $V_(3,1)$. Consider the natural action of $S_4$ on $CC^4$ by permuting the coordinates, and consider the subrepresentation $H = {(x,y,z,w) in CC^4 | x+y+z+w=0}$ (similar to $V_upright(s t)$ constructed in #text(weight: "bold")[II], permuting the coordinates leave the coordinates sum invariant). 
  
  Notice that it's also irreducible: if it's not irreducible, by complete reducibility over $CC$, it must be decomposed into direct sums of smaller irreducible representations, and one must have dimension $1$ (since $3 = 2+1 = 1+1+1$ are the only way it can decompose into direct sums of smaller dimensional subspaces). Which, take $(x,y,z,w)$ from that $1$-dimensional subrepresentation, it has the following (as eigenvectors of all $S_4$-actions):
  $ lambda (x,y,z,w) = (12) dot (x,y,z,w) = (y,x,z,w), quad mu (x,y,z,w) = (1234) dot (x,y,z,w ) = (w,x,y,z) $
  This insists that $lambda z=z$ (either $lambda= 1$ or $z=0$), and $w = mu x = mu^2 y= mu^3 z=mu^4 w$.
  - If $lambda = 1$, this indicates $y = lambda x=x$, so $mu x= mu^2 y ==> x = mu y$, or $mu=1$ (since  $mu!=0$, as it's an eigenvalue of $(1234)$ as linear operator, which is invertible). However, this implies $x=y=z=w$, resulting in $0=x+y+z+w=4x$, or $x=0$, which contradicts the fact that $(x,y,z,w)=(x,x,x,x)$ is an eigenvector (which is nonzero).
  - If $z=0$, then we automatically have $w = mu^3 z=0$ and $y = mu z = 0$, so $x = mu y=0$ also, which again contradicts the fact that $(x,y,z,w)$ is an eigenvector (nonzero).

  So, $H$ must be irreducible, and $dim H = 3$, which we'll define $V_(3,1):= H$. Pick a basis ${g_1=(1,-1,0,0), g_2 = (0,1,-1,0), g_3 = (0,0,1,-1)} subset V_(3,1)$, then the representatives of $S_4$'s conjugacy classes $(12) in C_(211)$, $(12)(34) in C_(22), (123) in C_(31)$, $(1234) in C_4$ have the following action (and written in matrix form):
  $ &(12) dot g_1 = (-1,1,0,0) = -g_1, quad (12) dot g_2 = (1,0,-1,0) = g_1+g_2\
  &(12) dot g_3 = (0,0,1,-1) = g_3, quad cal(M)(12) = mat(-1,1,0;0,1,0;0,0,1) $
  $ &(12)(34) dot g_1 = (-1,1,0,0)=-g_1, quad (12)(34) dot g_2=(1,0,0,-1) = g_1+g_2+g_3\ 
  &(12)(34) dot g_3 = (0,0,-1,1) = -g_3, quad cal(M)((12)(34)) = mat(-1,1,0;0,1,0;0,1,-1) $
  $ &(123) dot g_1 = (0,1,-1,0) = g_2, quad (123) dot g_2 = (-1,0,1,0) = -g_1-g_2\ 
  &(123) dot g_3 = (1,0,0,-1) = g_1+g_2+g_3, quad cal(M)(123) = mat(0,-1,1;1,-1,1;0,0,1) $
  $ &(1234) dot g_1 = (0,1,-1,0)=g_2, quad (1234) dot g_2 = (0,0,1,-1)=g_3\ 
  &(1234) dot g_3 = (-1,0,0,1) = -g_1-g_2-g_3, quad cal(M)(1234) = mat(0,0,-1;1,0,-1;0,1,-1) $
  So, the character is as follow (with $chi_(3,1)(e) = dim V_(3,1) = 3$, and the rest computed using the trace of the above matrices):

  \ 

  #set align(center)
    #table(
    columns: 6,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1111)$],[$C_(211)$],[$C_(22)$],[$C_(31)$], [$C_4$],
    [$chi_(3,1)$], [$3$], [$1$], [$-1$],[$0$],[$-1$]
    )
  #set align(left)

  \ 

  Finally, using orthonormality of irreducible characters to solve for $chi_(3,2)$ (and the fact that $chi_(3,2)(e) = dim V_(3,2) = 3$, where $V_(3,2)$ is the last $3$-dimensional irreducible representation), we have the following character table for $S_4$:

  \ 

  #set align(center)
    #table(
    columns: 6,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1111)$],[$C_(211)$],[$C_(22)$],[$C_(31)$], [$C_4$],
    [$chi_t$], [$1$], [$1$], [$1$],[$1$],[$1$],
    [$chi_s$],[$1$],[$-1$], [$1$],[$1$],[$-1$],
    [$chi_2$], [$2$], [$0$], [$2$],[$-1$],[$0$],
    [$chi_(3,1)$], [$3$], [$1$], [$-1$],[$0$],[$-1$],
    [$chi_(3,2)$],[$3$],[$-1$],[$-1$],[$0$],[$1$]
    )
  #set align(left)


  \ 

  \ 

  #text(weight: "bold")[IV. Representation $Ind^(S_4)_(S_3) V_upright(s t)$, and its character $chi_(Ind^G_H V_upright(s t))$:]

  First, let's consider a basis for $Ind^G_H W$ (where $W in Rep_k (H)$): in #text(weight: "bold")[Problem 5] it has been verified that all $phi in Ind^G_H W$ has decomposition $phi = sum_(i=1)^l phi^((i))_(phi(x_i))$, each $phi^((i))_(phi(x_i)) in W^((i))$ has $phi^((i))_(phi(x_i))(h x_i) = h dot phi(x_i)$ for all $h in H$ (this decomposition is based on $W = plus.circle_(i=1)^l W^((i))$, each $W^((i))$ associates to the coset $H x_i$).

  On the other hand, for each $a,b in k$ and $u,w in W$, the element $phi^((i))_(a u+b w)(h x_i) = h dot (a u+b w) = a (h dot u)+b (h dot w) = a phi^((i))_u (h x_i)+b phi^((i))_(w)(h x_i)$ for all $h in H$ (with $phi^((i))_(a u+b v)(h x_j)=0 = a phi^((i))_u (h x_j)+b phi^((i))_(w)(h x_j)$ for $j!=i$), showing that $phi^((i))_(a u+b w)=a phi^((i))_u + b phi^((i))_w$.

  So, pick a basis $w_,...,w_n in W$, then ${phi^((i))_(w_j)}_(1<=i<=l\ 1<=j<=n)$ is a basis for $Ind^G_H W$, since each $phi in W$ has $phi(x_i) = sum_(j=1)^n a_(i j)w_j$ for unique collections of $a_(i j) in k$, hence one has $phi = sum_(i=1)^l phi^((i))_(phi(x_i)) = sum_(i=1)^l sum_(j=1)^n a_(i j)phi^((i))_(w_j)$, with each coefficient $a_(i j)$ being uniquely determined by each $phi(x_i)$.

  \ 

  Which, let $x_1:= e$, $x_2:= (14)$, $x_3 := (24)$, and $x_4 := (34)$ (use the cosets developed in #text(weight: "bold")[I]), and use $V_upright(s t) := {(x,y,z) in CC^3 | x+y+z=0}$, and with basis $f_1 := (1,-1,0), f_2 := (0,1,-1)$ establshed in #text(weight: "bold")[II], a basis for $Ind^(S_4)_(S_3)V_upright(s t)$ is ${phi^((i))_(f_j)}_(1<=i<=4\ j=1,2)$.

  Again, pick representatives of each $S_4$'s conjugacy classes as $(12) in C_(211)$, $(12)(34) in C_(22)$, $(123) in C_(31)$, and $(1234) in C_(4)$, their actions on each basis elements have the following "evaluation":
  $ &((12) dot phi^((i))_(f_j))(x_1) = phi^((i))_(f_j)((12))\
  &((12) dot phi^((i))_(f_j))(x_2) = phi^((i))_(f_j)((14)(12)) =  $ hello

]

#pagebreak()

== HD (calculate example for S3 induce S4)//9
#problem[
  For any function $f:H -> CC$, let us define a function $tilde(f):G -> CC$ by 
  $ tilde(f)(x) = cases(
    f(x) quad "if" x in H,
    0 quad quad "  otherwise"
  ) $
  (Without using Part (7)). Show that the character of $Ind^G_H W$ is given by 
  $ chi_(Ind^G_H W)(x) = 1/(\# H) sum_(g in G)tilde(chi)_W (g x g^(-1)) $
  Compute the character of $Ind^(S_4)_(S_3)V_upright(s t)$ one more time using this formula.
][

  #text(weight: "bold")[I. Choose a Basis for $Ind^G_H W$ (Also mentioned in Problem 8):]

  In #text(weight: "bold")[Problem 5] it has been verified that all $phi in Ind^G_H W$ has decomposition $phi = sum_(i=1)^l phi^((i))_(phi(x_i))$, each $phi^((i))_(phi(x_i)) in W^((i))$ has $phi^((i))_(phi(x_i))(h x_i) = h dot phi(x_i)$ for all $h in H$ (this decomposition is based on $W = plus.circle_(i=1)^l W^((i))$, each $W^((i))$ associates to the coset $H x_i$).

  On the other hand, for each $a,b in k$ and $u,w in W$, the element $phi^((i))_(a u+b w)(h x_i) = h dot (a u+b w) = a (h dot u)+b (h dot w) = a phi^((i))_u (h x_i)+b phi^((i))_(w)(h x_i)$ for all $h in H$ (with $phi^((i))_(a u+b v)(h x_j)=0 = a phi^((i))_u (h x_j)+b phi^((i))_(w)(h x_j)$ for $j!=i$), showing that $phi^((i))_(a u+b w)=a phi^((i))_u + b phi^((i))_w$.

  So, pick a basis $w_,...,w_n in W$, then ${phi^((i))_(w_j)}_(1<=i<=l\ 1<=j<=n)$ is a basis for $Ind^G_H W$, since each $phi in W$ has $phi(x_i) = sum_(j=1)^n a_(i j)w_j$ for unique collections of $a_(i j) in k$, hence one has $phi = sum_(i=1)^l phi^((i))_(phi(x_i)) = sum_(i=1)^l sum_(j=1)^n a_(i j)phi^((i))_(w_j)$, with each coefficient $a_(i j)$ being uniquely determined by each $phi(x_i)$.

  \ 

  #text(weight: "bold")[II. $G$-Action on the Basis:]

  Given any $x in G$, it induces a permutation on the right cosets ${H x_i}_(1<=i <=l)$, say $sigma in S_l$ has $H (x_i x) = H x_(sigma(i))$. In particular each $x_i x = h_i x_(sigma(i))$ for some fixed $h_i in H$. Then, for each basis element $phi^((i))_(w_j)$, the action of $x$ is as follow:
  $ forall x_r in G, quad (x dot phi^((i))_(w_j))(x_r) &= phi^((i))_(w_j)(x_r x) = phi^((i))_(w_j)(h_r x_(sigma(r))) = delta_(i, sigma(r))(h_r dot w_j) $
  So, this indicates that $x dot phi^((i))_(w_j) = sum_(r=1)^l phi^((r))_(delta_(i, sigma(r))(h_r dot w_j))$, hence the $phi^((i))_(w_j)$-component in this expression is $delta_(i, sigma(i))a^((i))_(j j)$, with each $h_i$ (as a linear operator on $W$) has matrix $(a^((i))_(j k))_(1<=j,k<=n)$ (since within $phi^((i))_(delta_(i,sigma(i))(h_i dot w_j))$, the $phi^((i))_(w_j)$-component is the $w_j$-component of $delta_(i,sigma(i))(h_i dot w_j)$, given by $delta_(i,sigma(i)) a^((i))_(j j)$). As a result, one has the following:
  $ chi_(Ind^G_H W)(x) = sum_(i=1)^l sum_(j=1)^n delta_(i, sigma(i))a^((i))_(j j) = sum_(i=1)^l delta_(i, sigma(i)) tr(a^((i))_(j k)) = sum_(i=1)^l delta_(i, sigma(i)) chi_W (h_i) $

  \ 

  #text(weight: "bold")[III. Rewrite of the Character:]

  Finally, consider the term $sum_(g in G)tilde(chi)_W (g x g^(-1))$: Since $G = union.sq.big_(i=1)^l H x_i$, then $sum_(g in G)tilde(chi)_W (g x g^(-1)) = sum_(i=1)^l sum_(h in H)tilde(chi)((h x_i)x(x_i^(-1)h^(-1))) = sum_(i=1)^l sum_(h in H)tilde(chi)_W (h h_i x_(sigma(i)) x_i^(-1)h^(-1))$ (Note: by our definition $x_i x = h_i x_(sigma(i))$). Which, $h h_i x_(sigma(i)) x_i^(-1) h^(-1) in H$ iff $x_(sigma(i))x_i^(-1) in H$ iff $H x_(sigma(i))=  H x_i$ as coset (which by the property of each $x_i$ being distinct representative, $H x_(sigma(i))= H x_i$ enforces $sigma(i)=i$), hence one gets the following:
  $ tilde(chi)_W (h h_i x_(sigma(i))x_i^(-1) h^(-1)) = cases(
    chi_W (h h_i x_i x_i^(-1) h^(-1)) = chi_W (h h_i h^(-1)) = chi_W (h_i) quad sigma(i)=i,
    0 quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad "  otherwise"
  ) $
  Hence, we hend up with the following:
  $ sum_(g in G)tilde(chi)_W (g x g^(-1)) = sum_(i=1)^l sum_(h in H)tilde(chi)_W (h h_i chi_(sigma(i))chi_i^(-1) h^(-1)) = (\# H) sum_(i=1)^l delta_(i, sigma(i))chi_W (h_i) $
  Substituting into the term we got from #text(weight: "bold")[II], we get the desired formula:
  $ chi_(Ind^G_H W)(x) = sum_(i=1)^l delta_(i,sigma(i)) chi_W (h_i) = 1/(\# H)sum_(g in G)tilde(chi)_W (g x g^(-1))  $

  \ 

  #text(weight: "bold")[IV. Special Case $Ind^(S_4)_(S_3) V_upright(s t)$:]
]

#pagebreak()

== D//10
#problem[
  Let $chi:H -> CC$ be any class function on $H$, #text(weight: "bold")[define] a new class function 
  $Ind chi:G -> CC$
  on $G$ by 
  $ Ind_chi (x):= 1/(\# H)sum_(g in G)tilde(chi)(g x g^(-1)) $
  Show that for any class function $chi$ on $H$ and $psi$ on $G$, we have 
  $ langle Res psi, chi rangle_H= langle psi, Ind_chi rangle_G $
][
  First, notice that the left side satisfies the following:
  $ langle Res psi, chi rangle_H = 1/(\# H)sum_(h in H)Res psi(h) overline(chi(h)) = 1/(\# H)sum_(h in H)psi(h) overline(chi(h)) $
  Then, based on the definition of $Ind_chi$, it satisfies the following:
  $ langle psi, Ind_chi rangle_G = 1/(\# G)sum_(x in G)psi(x) overline(Ind_chi (x)) = 1/(\# G)sum_(x in G) dot 1/(\# H)sum_(g in G)psi(x) overline(tilde(chi)(g x g^(-1))) $

  Notice that since $psi$ is a class function, any $x,g in G$ satisfies $psi(x) = psi(g x g^(-1))$. Hence, one has the following:
  $ langle psi, Ind_chi rangle_G = 1/(\# G)sum_(g in G)1/(\# H)sum_(x in G)psi(g x g^(-1)) overline(tilde(chi)(g x g^(-1))) $
  Since fixing $g in G$, when running through $x in G$, the collection $g x g^(-1)$ includes all elements of $G$ (exactly once), and if $g x g^(-1) in.not H$, one has $tilde(chi)(g x g^(-1))=0$, hence the above reduces to:
  $ langle psi, Ind_chi rangle_G &= 1/(\# G)sum_(g in G)1/(\# H)sum_(x in G\ g x g^(-1) in H)psi(g x g^(-1))overline(tilde(chi)(g x g^(-1))) = 1/(\# G)sum_(g in G)1/(\# H)sum_(h in H)psi(h) overline(chi(h))\ 
  &= 1/(\# G)sum_(g in G)langle Res psi, chi rangle_H = langle Res psi, chi rangle_H $
  So, this concludes that $langle psi, Ind_chi rangle_G = langle Res psi, chi rangle_H$.
]

#pagebreak()

== D//11
#problem[
  Use the previous parts to give another proof of the adjunction in (7).
][
  Here we'll discuss the case over $k=CC$ for the proper use of the inner product in (10).

  \ 

  First, based on the definition in #text(weight: "bold")[Problem 10], notice that give $chi_W$ as the character of $W$ (as $H$-representations), one has the following:
  $ Ind_(chi_W)(x) = 1/(\#)sum_(g in G)tilde(chi)_W (g x g^(-1)) = chi_(Ind^G_H W)(x) $
  Hence, for any $V in Rep_CC (G)$ and $W in Rep_CC (H)$, the formula in #text(weight: "bold")[Problem 10] provides $langle chi_V, chi_(Ind^G_H W) rangle_G = langle chi_V, chi_(Ind^G_H W), Ind_(chi_W) rangle_G = langle Res^G_H chi_V, chi_W rangle_H = langle chi_(Res^G_H V), chi_W rangle_H$.

  \ 
  
  Now, let $V_i$ denotes the (finite dimensional) irreducible $G$-representations over $CC$, and $W_j$ denotes the (finite dimensional) irreducible $H$-representations over $CC$. Then, given $V tilde.equiv plus.circle.big_i V_i^(k_i)$ and $W tilde.equiv plus.circle.big_j W_j^(l_j)$ as representations of $G$ and $H$ respectively, one has the following:
  $ Hom_G (V, Ind^G_H W) &tilde.equiv Hom_G (plus.circle.big_i V_i^(k_i), plus.circle.big_j Ind^G_H W_j^(l_j))tilde.equiv plus.circle.big_i (plus.circle.big_j Hom_G (V_i, Ind^G_H W_j)^(k_i l_j)) $
  $ Hom_H (Res^G_H V, W) tilde.equiv Hom_H (plus.circle.big_i Res^G_H V_i, plus.circle.big_j W_j^(l_j)) tilde.equiv plus.circle.big_i (plus.circle.big_j Hom_H (Res^G_H V_i, W_j)^(k_i l_j)) $
  Here, it uses the following two observations:
  - $Res^G_H (V_i plus.circle V_j) tilde.equiv Res^G_H V_i plus.circle Res^G_H V_j$, since $g dot (v_i, v_j) = (g dot v_i, g dot v_j)$ for all $g in G$, $v_i in V_i$ and $v_j in V_j$, by definition.
  - $Ind^G_H (W_i plus.circle W_j) = {phi:G -> W_i plus.circle W_j | phi(h g) = h dot phi(g), forall h in H, g in G}$. Which, let $phi_i (g) in W_i$, $phi_j (g) in W_j$ be the unique decomposition of $phi(g)$, say $phi(g) = phi_i (g)+phi_j (g)$, then one has $phi_i (h g)+phi_j (h g)=phi(h g) = h dot phi(g) = h dot phi_i (g)+ h dot phi_j (g)$, with $phi_i (h g), h dot phi_i (g) in W_i$ and $phi_j (h g), h dot phi_j (g) in W_j$.
  
    This demonstrates that $phi_i (h g) = h dot phi_i (g)$ and $phi_j (h g) = h dot phi_j (g)$ (by the property of direct sum), showing $phi_i in Ind^G_H W_i$ and $phi_j in Ind^G_H W_j$. Which, $phi = phi_i + phi_j$ for unique $phi_i in Ind^G_H W_i$ and $phi_j in Ind^G_H W_j$ (since by direct sum each $phi(g) = phi_i (g)+phi_j (g)$ must be unique), and each $phi in Ind^G_H W_i$ and $psi in Ind^G_H W_j$ has $phi + psi in Ind^G_H (W_i plus.circle W_j)$ by definition (since $im(phi) subset W_i arrow.hook W_i plus.circle W_j$, and $im(psi) subset W_j arrow.hook W_i plus.circle W_j$). Which, this concludes that $Ind^G_H (W_i plus.circle W_j) tilde.equiv Ind^G_H W_i plus.circle Ind^G_H W_j$.

  Then, using induction one can show that $Res^G_H plus.circle.big_i V_i^(k_i) tilde.equiv plus.circle.big_i (Res^G_H V_i)^(k_i)$, and $Ind^G_H plus.circle.big_j W_j^(l_j) tilde.equiv plus.circle.big_j (Ind^G_H W_j)^(l_j)$.

  \ 

  Hence, to prove $Hom_G (V, Ind^G_H W) tilde.equiv Hom_H (Res^G_H V, W)$ (as $k$-vector spaces, which also proves the adjunction), it suffices to show $Hom_G (V_i, Res^G_H W_j) tilde.equiv Hom_H (Res^G_H V_i, W_j)$.

  Let $Res^G_H V_i tilde.equiv plus.circle.big_r W_r^(p_r)$ as $H$-representations, and $Ind^G_H W_j tilde.equiv plus.circle.big_s V_s^(q_s)$ as $G$-representations, then using the orthonormality of the character (together with the fact that direct sum representation has character, being the sum of the direct summands' characters), one can deduce that each $p_r = langle chi_(Res V_i), chi_(W_r) rangle_H$, and $q_s = langle chi_(Ind^G_H W_j), chi_(V_s)rangle_G$ (with $p_r, q_s in NN$). Hence, one has the following, based on Schur's Lemma:
  $ &Hom_G (V_i, Ind^G_H W_j) tilde.equiv Hom_G (V_i, plus.circle.big_s V_s^(q_s)) tilde.equiv plus.circle.big_s Hom_G (V_i, V_s)^(q_s) tilde.equiv Hom_G (V_i,V_i)^(q_i) tilde.equiv CC^(q_i)\ 
  &Hom_H (Res^G_H V_i, W_j) tilde.equiv Hom_H (plus.circle.big_r W_r^(p_r), W_j) tilde.equiv plus.circle.big_(r)Hom_H (W_r, W_j)^(p_r) tilde.equiv Hom_H (W_j,W_j)^(p_j) tilde.equiv CC^(p_j) $
  Finally, using the inner product formula (relating $Res$ and $Ind$), one has the following:
  $ q_i &= langle chi_(Ind^G_H W_j), chi_(V_i) rangle_G = langle chi_(V_i), chi_(Ind^G_H W_j) rangle_G = langle chi_(Res^G_H V_i), chi_(W_j) rangle_H = p_j $
  Hence, $Hom_G (V_i, Ind^G_H W_j) tilde.equiv CC^(q_i) = CC^(p_j) tilde.equiv Hom_H (Res^G_H V_i, V_j)$, this finishes the proof.
]

#pagebreak()

= Bonus:

As of an apology, the last several question (Problem 8-11) took me a long while to finish, so the answer for these may not be complete.
#problem[
  Continue to let $W in Rep_k (H)$ and let $V in Rep_k (G)$. Let $f:W->V$ be a map of $H$-representations. Let us define a map of vector spaces $g^((i))_f:W^((i))->V$ as follow: we define 
  $ g^((i))_(f)(phi^((i))_w):= x_i dot f(w) in V $
  where the action by $x_i$ is given using the $G$-representation structure on $V$. This way (by Part (3)) we obtain a map $g_f:Ind^G_H W->V$ as vector spaces. Show that $g_f$ is in fact a map between $G$-representations. Use this to show that $Ind^G_H$ is also a left adjoint of $Res^G_H$ when $G$ is finite. 
][
]

\ 

#problem[
  Show that $V=Ind^G_H W$ is irreducible if and only if the following holds:
  - $W$ is irreducible
  - For any $s in G\\H$, we have 
    $ langle rho_s, Res^G_H rho rangle_(H_s) = 0 $
    where $H_s:= s H s^(-1) sect H$ and $rho_s$ denotes the representation of $H_s$ on $W$ given by $rho_s (x) = rho_W (s x s^(-1))$.
][]