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
#problem[
  Let $W in Rep_k (H)$ be a finite dimensional representation of $H$. Define a $k$-vector space $W'$ as follow: Let 
  $ W':={phi:G ->W | phi(h g) = h dot phi(g), quad forall h in H, " " g in G} $
  Next, for any $g in G$ and $phi in W'$, let 
  $ g dot phi:G -> W $
  denote the function sending $x mapsto phi(x g)$. Show that $g dot phi in W'$ and show that the association $(g,phi) mapsto g dot phi$ defines a representation of $G$ on $W'$. We shall define $Ind^G_H W=W'$ as a representation of $G$ (at the moment you should take $Ind^G_H$ as a symbol. Later we will justify such a choice by showing this indeed provides the desired right adjoint of $Res^G_H$).
][]

\ 

#problem[
  Let $K<H<G$ be subgroups of $G$. Let $W_0$ be a finite-dimensional representation of $K$. Show that 
  $ Ind^G_K W_0 tilde.equiv Ind^G_H " " Ind^H_K W_0 $
  as $G$-representations.
][]

\ 

#problem[
  Choose representatives ${x_1,...,x_l}$ of $G\/H$, and write $G = union.sq.big_(i=1)^l H x_i$ (we may and will always assume that  $x_1=1$). Let $W^((i)) subset Ind^G_H W$ denote the subspace 
  $ W^((i)):={phi in Ind^G_H W | phi(x) = 0 "if" x in.not H x_i} $
  Show that each $W^((i))$ has dimension equatl to $dim_k W$. Show that as vector spaces, we have 
  $ Ind^G_H W tilde.equiv plus.circle.big_(i=1)^l W^((i)) $
  Conclude that $Ind^G_H W$ has dimension $[G:H] dot dim_k W$ as a vector space over $k$.
][]

\ 

#problem[
  Next, for any $w in W$ and $1<=i<=l$, let us consider the following function 
  $ phi_w^((i)):G -> W $
  which sends an element of the form $h x_i$ (where $h in H$) to $h dot w$ and all other elements (namely ones of the form $h x_j$ for $j!=i$) in $G$ to $0$. Show that $phi^((i))_w in W^((i))$ and in fact we have 
  $ W^((i)) = {phi^((i))_w | w in W} $
  as subspaces of $Ind^G_H W$.
][] 

\ 

#problem[
  Show that for all $phi in Ind^G_H W$, we have 
  $ phi = sum_(i=1)^l phi^((i))_(phi(x_i)) $
][]

\ 

#problem[
  Now let $W in Rep_k H$ and let $V in Rep_k G$. Consider the (evaluation) map 
  $ e:Ind:Ind^G_H W -> W $
  seding $phi mapsto phi(1)$ as a map between vector spaces. Show that $e$ is in fact a map between $H$-representations.
][]

\ 

#problem[
  Use Part (6) to show that $Ind^G_H$ is a right adjoint of $Res^G_H$.
][]

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
][]

\ 

#problem[
  Show that $V=Ind^G_H W$ is irreducible if and only if the following holds:
  - $W$ is irreducible
  - For any $s in G\\H$, we have 
    $ langle rho_s, Res^G_H rho rangle_(H_s) = 0 $
    where $H_s:= s H s^(-1) sect H$ and $rho_s$ denotes the representation of $H_s$ on $W$ given by $rho_s (x) = rho_W (s x s^(-1))$.
][]