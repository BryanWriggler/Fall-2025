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
  $ phi^((j))_(phi(x_j))(g) = phi^((j))_(phi(x_j))(h x_i) = h dot phi(x_i) = phi(h x_j) = phi(g) $
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

#pagebreak()

== ND//7
#problem[
  Use Part (6) to show that $Ind^G_H$ is a right adjoint of $Res^G_H$.
][
  Given any $V in Rep_k (G)$ and $W in Rep_k (H)$, notice that the evaluation map $e:Ind^G_H W -> W$ in #text(weight: "bold")[Problem 6]. Then, for any $G$-representation morphism $T in Hom_G (V, Ind^G_H W)$ (which is also an $H$-representation morphism by restricting to only the $H$-action), then $e compose T:V -> W$ is in fact a $H$-representation morphism (here denote $Res^G_H V:= V$ as vector space, with only the $H$-representation structure). Hence, the map $e compose \_:Hom_G (V, Ind^G_H W)-> Hom_H (Res^G_H V, W)$ by $T mapsto e compose T$ is a well-defined map (in fact a $k$-linear map).

  \ 

  Now, the goal is to show that $e compose \_$ is an isomorphism: Suppose $T in ker(e compose \_)$, then $e compose T = 0$, hence for any $v in V$, one has $e compose T(v) = 0$. However, Let $phi_v := T(v) in Ind^G_H W$
]

\ 

#problem[
  Consider the following special example: Let $V_upright(s t)$ denote the irreducible $2$-dimensional representation of $S_3$. Compute the character of $Ind^(S_4)_(S_3) V_(s t)$, compute the character table of $S_4$, then decompose $Ind^(S_4)_(S_3)V_(s t)$ as direct sums of irreducible representations of $S_4$.
][]

\

#problem[
  For any function $f:H -> CC$, let us define a function $tilde(f):G -> H$ by 
  $ tilde(f)(x) = cases(
    f(x) quad "if" x in H,
    0 quad quad "  otherwise"
  ) $
  (Without using Part (7)). Show that the character of $Ind^G_H W$ is given by 
  $ chi_(Ind^G_H W)(x) = 1/(\# H) sum_(g in G)tilde(chi)_W (g x g^(-1)) $
  Compute the character of $Ind^(S_4)_(S_3)V_upright(s t)$ one more time using this formula.
][]

\ 

#problem[
  Let $chi:H -> CC$ be any class function on $H$, #text(weight: "bold")[define] a new class function 
  $Ind chi:G -> CC$
  on $G$ by 
  $ Ind_chi (x):= 1/(\# H)sum_(g in G)tilde(chi)(g x g^(-1)) $
  Show that for any class function $chi$ on $H$ and $psi$ on $G$, we have 
  $ langle Res psi, chi rangle_H= langle psi, Ind_chi rangle_G $
][]

\ 

#problem[
  Use the previous part (10) to give another proof of the adjunction in (7).
][]

#pagebreak()

= Bonus:
#problem[
  Continue to let $W in Rep_k H$ and let $V in Rep_k G$. Let $f:W->V$ be a map of $H$-representations. Let us define a map of vector spaces $g^((i))_f:W^((i))->V$ as follow: we define 
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