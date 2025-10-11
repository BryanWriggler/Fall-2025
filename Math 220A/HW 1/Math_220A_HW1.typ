#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.1.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: "bootstrap",  
    headers: "classic", //"tab" for upper bar, classic for the one I used, sidebar for the emphasis on the left
    all-breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 220A HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering:"(a)")

= D//1
#problem[
  Lang Chapter 1 \#11:

  Let $G$ be a group, and $A$ a normal abelian subgroup, show that $G\/A$ operates on $A$ by conjugation, and in this manner get a homomorphism of $G\/A$ into $Aut(A)$.
][
  For all $overline(g) in G\/A$ (with representative $g in G$) and $a in A$, define a map $mu:G\/A times A arrow.r A$ by $mu(overline(g),a) = g a g^(-1)$.

  First, one needs to show the map is well-defined: Suppose $g,g'$ both are representatives of $overline(g) in G\/A$, then there exists $h in A$, such that $g'=g h$ (since they're representing the same left coset), then consider the conjugation of $g,g'$ on any $a in A$, based on the assumption that $A$ is abelian, we get:
  $ g a g^(-1) = g(h h^(-1) a)g^(-1) = g(h a h^(-1))g^(-1) = (g h) a(g h)^(-1)=g' a (g')^(-1) $
  Hence, $g,g'$ both act on $a$ in the same manner, hence there's no ambiguity defining $mu(overline(g),a)=g a g^(-1)$ (since every element in the same left coset acts on $a$ the same).

  \ 

  Then, to show it's indeed an action, it follows from the below equality, for all $overline(g),overline(h) in G\/A$, and $a in A$:
  $ mu(overline(g), mu(overline(h),a)) = mu(h a h^(-1)) = g (h a h^(-1))g^(-1) = (g h) a (g h)^(-1)=mu(g h, a) $
  So, $mu$ is indeed a well-defined left action, hence generating a group homomorphism $pi:G\/A arrow.r Aut(A)$, by $pi(overline(g))(\_)=mu(overline(g),\_)$.
]

= D//2
#problem[
  Lang Chapter 1 \#12:

  Let $G$ be a group and let $H,N$ be subgropus with $N$ normal. Let $gamma_x$ be conjugation by an element $x in G$.
  + Show that $x mapsto gamma_x$ induces a homomorphism $f:H arrow.r Aut(N)$.
  + If $H sect N={e}$, show that the map $H times N arrow.r H N$ given by $(x,y) mapsto x y$ is a bijection, and that this map is an isomorphism if and only if $f$ is trivial, i.e. $f(x)=id_N$ for all $x in H$.

  We define $G$ to be the #text(weight: "bold")[semidirect product] of $H$ and $N$ if $G=H N$ and $H sect N={e}$.

  (c) Conversely, let $N,H$ be groups, and let $psi:H arrow.r Aut(N)$ be a given homomorphism. Construct a semidirect product as follows: Let $G$ be the set of pairs $(x,h)$ with $x in N$ and $h in H$. Define the composition law:
  $ (x_1,h_1)(x_2,h_2)=(x_1 psi(h_1)x_2, h_1 h_2) $
  Show that this is a group law, and yields a semidrect product of $N$ and $H$, identifying $N$ with the set of elements $(x,1)$ and $H$ with the set of elements $(1,h)$.
][
  + For all $x,y in H$, if consider $gamma_(x y)$, it satisfies the following:
    $ forall n in N, quad gamma_(x y) (n) = (x y)n(x y)^(-1)=x y n y^(-1) x^(-1) = x gamma_y(n) x^(-1) = gamma_x (gamma_y (n)) $
    Hence, the equality demonstrates that $gamma_(x y) = gamma_x compose gamma_y $, showing that $f:H arrow.r Aut(N)$ by $f(x y) = gamma_(x y)=gamma_x compose gamma_y$, which is a group homomorphism.

    \ 

  + Given $H sect N={e}$, first regardless of this condition, it's clear that $H times N arrow.r H N$ by $(x,y) mapsto x y$ is surjective (since by definition $H N$ collects all $x y$, where $x in H$ and $y in N$). 
  
    To prove that it's injective, suppose $(x,y), (x',y') in H times N$ satisfies $x y=x' y'$, then it satisfies $(x')^(-1) x y=y'$, or $(x')^(-1) x=y' y^(-1)$. Notice this expression is both in $H$ and $N$ (since $x,x' in H$ and $y,y' in N$), hence $(x')^(-1) x = y' y^(-1)=e$, showing $x=x'$ and $y=y'$, hence the map is injective. This shows that set wise, $H sect N ={e}$ implies $H times N$ and $H N$ are set isomorphic.

    \ 

    Now, to prove the equivalence statement for the two groups above being group isomorphic, consider the following:

    $==>:$ Suppose $H times N arrow.r H N$ by $(x,y) mapsto x y$ is an isomorphism, in particular it's a group homomorphism, then for all $(x,y), (x',y') in H times N$, it satisfies the following:
    $ (x,y) mapsto x y, quad (x',y') mapsto x' y' $
    $ (x,y) dot (x',y')=(x x',y y') mapsto (x x')(y y')=(x y)(x' y') $
    Hence, then equality shows $x' y=y x'$ (by canceling $x$ and $y'$ on the sides). Since $(x,y), (x',y') in H times N$ are arbitrary (which $x' in H$, $y in N$ are arbitrary also), then $gamma_(x')(y) = x' y (x')^(-1) = y$, showing that $gamma_(x')=id_N$. So, all $x' in H$ satisfies $gamma_(x')=id_N$.

    $<==:$ Suppose all $x in H$ satisfies $gamma_x = id_N in Aut(N)$, we'll show the map $H times N arrow.r H N$ by $(x,y) mapsto x y$ is a group homomorphism (since it's a bijection with assumption $H sect N={e}$, being a group homomorphism implies it's an isomorphism). Since for all $x in H$ and $n in N$ satisfies $x n x^(-1)=gamma_x(n)=n$, hence $x n=n x$ (or all eleements in $H$ and $N$ commutes). Hence, given any $(x,y), (x',y') in H times N$, they satisfy:
    $ (x,y) dot (x',y') = (x x',y y') mapsto (x x')(y y') = (x y)(x' y') $
    $ (x,y) mapsto x y, quad (x',y') mapsto x' y' $
    Hence, $(x,y) dot (x',y')$ gets mapped to the product of the image of $(x,y)$ and $(x',y')$, hence the map $H times N arrow.r H N$ is indeed a group homomorphism, which is an isomorphism (given that it's a bijection).

    \ 

  + To show the given law satisfies group property, we'll first show it's associative: Given any $(x_1,h_1), (x_2,h_2), (x_3,h_3) in G$, they satisfy:
    $ ((x_1,h_1) (x_2,h_2) )(x_3,h_3) = (x_1 psi(h_1)x_2, h_1 h_2)(x_3, h_3) = (x_1 (psi(h_1)x_2) (psi(h_1 h_2)x_3),h_1 h_2 h_3) $
    $ (x_1,h_1) ((x_2,h_2) (x_3,h_3)) = (x_1,h_1)(x_2 psi(h_2) x_3, h_2 h_3) = (x_1 psi(h_1)(x_2 psi(h_2) x_3), h_1 h_2 h_3) $
    Notice that the second equation's first entry can be rewrite as follow:
    $ x_1 psi(h_1)(x_2 psi(h_2)x_3) = psi(h_1)(x_2) dot psi(h_1)(psi(h_2)x_3) = psi(h_1)(x_2) dot psi(h_1 h_2)(x_3) $
    Where the second equality is formed by the fact that $psi$ is a group homomorphism.
    Hence, one can conclude that $((x_1, h_1)(x_2,h_2))(x_3,h_3) = (x_1,h_1)((x_2,h_2)(x_3,h_3))$, which the given law is associative.

    \ 

    Then, we'll explicitly show that $(e,e) in G$ serves as an identity: Given any $(x,h) in G$, the following is satisfied:
    $ (e_N,e_H)(x,h) = (e_N psi(e_H)(x), e_H h)= (e_N id_N(x), h) = (e_N x, h)=(x,h) $
    $ (x,h)(e_N, e_H)=(x psi(h)(e_N), h e_H) = (x e_N, h)=(x,h) $
    Which, $(e,e)$ is indeed an identity under this law.

    \ 

    Now, to compute the inverse, given any $(x,h) in G$, consider the element $(psi(h^(-1))(x^(-1)), h^(-1))$, which satisfies the following:
    $ (x,h)(psi(h^(-1))(x^(-1)), h^(-1)) = x (psi(h)psi(h^(-1))(x^(-1)), h h^(-1)) $
    $ = (x dot psi(e_H)(x^(-1)), e) = (x id_N(x^(-1)), e) = (x x^(-1),e)=(e,e) $

    \ 

    $ (psi(h^(-1))(x^(-1)), h^(-1))(x,h).= (psi(h^(-1))(x^(-1)) dot psi(h^(-1))(x), h^(-1) h) $
    $ = (psi(h^(-1))(x^(-1) x), e_H)=(psi(h^(-1))(e_N),e_H)=(e_N,e_H) $

    Hence, this shows the existence of inverse for every element. So, under this rule, $G$ forms a group.

    //if reviewing this, try and identify why it forms a semidirect product
]

#pagebreak()

= D//3
#problem[
  Lang Chapter 1 \#20:

  Let $P$ be a $p$-group. Let $A$ be a normal subgroup of order $p$. Prove that $A$ is contained in the center of $P$.
][
  First, since $|A|=p$ where $p$ is a prime, then $A$ is automatically cyclic, or there exists $a in A$ (which $|a|=p$), with $A=angle.l a angle.r$.

  Also, since $A lt.tri.eq G$, then for all $g in G$ and $a^k in angle.l a angle.r = A$, $g a^k g^(-1) in A$. Hence, one can consider the conjugation action $G arrow.cw.half A$.

  \ 

  To prove that $A$ belongs to the center of $G$, it suffices to show that every nontrivial element $a^k in A$ has the same stabilizer, or for all integer $0<k<p$, we have $G_(a^k)=G_(a)$ under conjugation action.

  Suppose the contrary that $A$ is not contained in the center of $G$, while every of its nontrivial element has the same stabilizer. Then, there exists $a in A$ and $g in G$, such that $a g != g a$, or $g a g^(-1)!=a$. Notice that $g a g^(-1)!=e$, since if $g a g^(-1)=e$, then $a = e$, which $g a g^(-1)=a$; so, since $g a g^(-1)$ is nontrivial in $A$, there exists integer $0<k<p$, such that $g a g^(-1) = a^k$, where $k!=1$ because $g a g^(-1)!=a$ by assumption. However, recall that under a left group action, if $g dot a=b$, then the stabilizer $G_b = g G_a g^(-1)$. So, we get that $G_(a^k) = g G_a g^(-1)$, while $G_(a^k)=G_a$ by assumption, hence $g in g G_a g^(-1) = G_a$. Yet, this implies that $g a g^(-1) = a$, which contradicts the assumption that $g a g^(-1)!=a$. Hence, we derived that $A$ must be contained in the center of $G$ (if assuming all nontrivial element of $A$ has the same stabilizer, under $G$'s conjugation action).

  \ 

  Then, to prove the main lemma, for all integer $0<k<p$ (where $a^k in A$ is nontrivial), we'll show that $G_a = G_(a^k)$:
  
  $subset.eq$: Given any $g in G_a$, since $g a g^(-1)=a$, then $a^k=(g a g^(-1))^k = g a^k g^(-1)$ by internal cancellation, showing that $g in G_(a^k)$, or $G_a subset.eq G_(a^k)$.

  $supset.eq$: Given any $h in G_(a^k)$, notice that since $a^k in A=angle.l a angle.r$ is not trivial, then $|a^k| = p$ (since $|A|=p$, if $|a^k|!=1$ due to the fact that $a^k!=e$, then $|a^k|=p$ is enforced). Hence, $a^k$ also generates $A$ (since $|angle.l a^k angle.r| = p = |A|$), so there exists $r in ZZ$, such that $(a^k)^r = a$. Then, $a = (a^k)^r = (h a^k h^(-1))^r = h (a^k)^r h^(-1) = h a h^(-1)$, again by internal cancellation. Hence, $h in G_a$, or $G_(a^k) subset.eq G_a$.

  The two inclusion concludes that $G_a=G_(a^k)$, hence all nontrivial elements in $A$ has the same stabilizer. Together with the claim beforehand, $A$ must be contained in the center.
]

#pagebreak()

= D//4
#problem[
  Lang Chapter 1 \#31:

  Determine all groups of order $<= 10$ up to isomorphism. In particular, show that a non-abelian group of order $6$ is isomorphic to $S_3$.
][
  For $n=1$, the only group of such order is ${e}$ (since by definition a group must need an identity, so it's the only element).

  \ 

  \ 

  For case $n=2,3,5,7$ (prime numbers $<= 10$), we'll show that all group must be isomorphic to $ZZ\/ n ZZ$: Given a group $G$ with $|G|=n$, since $n!=1$ on our list, then $G$ is nontrivial, hence there exists $g in G$ where $g!=e$. Then, since $|g|$ divides $|G|=n$, while $n$ (in our list) is prime, then with $g!=e$ (implying $|g|!=1$), we must have $|g|=n$, hence the cyclic subgroup $angle.l g angle.r<= G$ satisfies $|angle,l g angle.r| = |g|=n = |G|$, showing that $angle.l g angle.r = G$. Then, since $g$ has order $n$, then $G=angle.l g angle.r tilde.equiv ZZ\/n ZZ$.

  \ 

  \ 

  For case $n=4,9$ (where $4=2^2$ and $9=3^2$, both prime square), since $n=p^2$ for some prime $p$, we'll show that all such group must be ablian: Suppose the contrary that there exists non-abelian group $G$ with prime square power, let $G$ acts on itself via conjugation action, then by class equation, $|G|=|Z(G)| + |sum_(j in J)[G:G_(x_i)]|$, where $J$ runs through all distinct representatives of group elements with nontrivial conjugation classes. 

  Since each of the nontrivial conjugation class must be proper (due to the fact that ${e}$ itself forms a conjugation class), then $[G:G_(x_i)]!=1,p^2$ (since they're asumed to not be central, which has nontrivial conjugation class; while the conjugation class is proper, therefore its stabilizer can't be the whole group). In case for $[G:G_(x_i)]$ to divide $|G|=p^2$, it enforces $[G:G_(x_i)]=p$. So, in the class equation, since $|G|=p^2$ is divisible by $p$, similarly $|sum_(j in J)[G:G_(x_i)]$ is also divisible by $p$ (since each term is), then so is $|Z(G)|$, showing that $|Z(G)|!=1$, or $Z(G)!={e}$. Then, by the assumption that it's non-abelian, $Z(G) != G$, hence $|Z(G)|!=p^2$ either, showing that $|Z(G)|=p$ (the only order that still divides $p^2$), or it's cyclic. Which, there exists $g in Z(G)$ (with $|g|=p$), such that $angle.l g angle.r=Z(G)$.

  Finally, recall that $Z(G) lt.tri.eq G$, hence $G\/Z(G)$ has a natural quotient group structure, and $|G\/Z(G)| = [G:Z(G)] = |G|/|Z(G)| = p^2/p=p$,hence $G\/Z(G)$ is also cyclic, there exists $h in G$, such that $overline(h) in G\/Z(G)$ satisfies $angle.l overline(h) angle.r = G\/Z(G)$. Which, every $k in G$, since $overline(k) = overline(h)^i$ for some $i in ZZ$, then $k = h^i dot g^j$ for some $j in ZZ$ (since $k in h Z(G) = h angle.l g angle.r$). So, for every $k,k' in G$, the followign is true:
  $ k k'= (h^i g^j)(h^(i')g^(j')) = (h^i h^(i'))(g^j g^(j')) = (h^(i')h^(i))(g^(j')g^j) = (h^(i')g^(j'))(h^i g^j) = k'k $
  Where the qbove equation uses the fact that $g$ is in the center, and $h$ commutes with itself. Yet, this shows that $k k'=k'k$ for arbitrary $k,k' in G$, which $G$ is abelian, contradicting our initial assumption. Hence, the assumption is wfalse, $G$ with prime square power must be abelian.

  Back to the classification, for $n=4$ by Classification Theorem of Finite Abelian Group, $|G|=4$ implies it's abelian, hence $G tilde.equiv ZZ\/4ZZ$ or $G tilde.equiv ZZ\/2ZZ times ZZ\/2ZZ$. Similarly, for $|G|=9$, since it's also abelian, $G tilde.equiv ZZ\/9ZZ$ or $G tilde.equiv ZZ\/3ZZ times Z\/3ZZ$.

  \ 

  \ 

  For $n=8$, there are two cases: If $G$ is abelian, then again by fundamental theorem of finite abelian group, $G tilde.equiv ZZ\/8ZZ, ZZ\/4ZZ times ZZ\/2ZZ$, or $ZZ\/2ZZ times ZZ\/2ZZ times ZZ\/2ZZ$.

  Else, if it's non-abelian, then there doesn't have any element with order $8$ (or else $G$ is cyclic), and must have an element with order $4$ (or else all nontrivial element with order $2$ is abelian, since $(a b)^2 = e ==> a b a b = e=e^2=a^2 b^2$, so $b a=a b$).

  Now, let $sigma in G$ be an element of order $4$, the cyclic subgroup $H=angle.l sigma angle.r$ is an order $4$ subgroup of $G$ (where $|G|=8$), hence with index $2$, which is normal (since any $tau in.not H$ satisfies $tau H union.sq H = H tau union.sq H$, or $tau H=H tau$). Then, if $tau in.not H$, notice that $overline(tau) in G\/H$ must have order $2$ (since $G\/H$ has order $2$), then $tau^2 in H$.

  Notice that $tau^2!= sigma, sigma^3$. If not, with $sigma, sigma^3$ both are order $4$, w getheyerate $H=angle.l sigma angle.r$. Since $G = H union.sq tau H$, every element in $G$ is of the form $tau^i sigma^j$ (or $tau^i (sigma^3)^(j')$), which can be generated by $tau$ (by swapping $sigma$ or $sigma^3$ with $tau^2$). So, we are left with two cases:
  - If $tau^2=e$, then $G = D_8$ the dihedral group of regular $4$-gon: Given $(tau sigma) in tau H$, then $(tau sigma)^2 in (tau H)^2=H$. However, $(tau sigma)^2 != sigma$ (or else $tau sigma tau=e$, showing $sigma = e$, a contradiction), $(tau sigma)^2 != sigma^2$ (or else $tau sigma tau=sigma$, showing $tau sigma=sigma tau$, then the generator of $H$ and the generator of $G\/H$ commutes, showing $G$ is abelian, again a contradiction), and $(tau sigma)^2 != sigma^3$ (since then $(tau sigma)^2$ has order $4$, and $(tau sigma)$ has order $8$, which would have order $8$ and generates everything, again a contradiction). So, it enforces $(tau sigma)^2 = e$, showing $tau sigma tau = sigma^(-1)$, the dihedral group relation.
  - Else if $tau^2=sigma^2$, then notice that $tau^3=tau sigma^2 in tau H$ is nontrivial, while $tau^4=sigma^4=e$, so $|tau|=4$. We'll relable $1:=e$, $i:= sigma$, $-1:= i^2=sigma^2$ and $j:= tau$ for this case.

    Then, notice that now $G=H union.sq j H$ (with $H=angle.l i angle.r$) is as follow:
    $ G = {1,i,-1,i^3 = (-1)dot i} union.sq {j, j i, j(-1), j(-1)i} $
    Now, notice that $(-1)^2 = (i^2)^2 = i^4=1$, and the fact that $(-1)=i^2=j^2$ shows that $(-1)i = i^3 = i(-1)$, and $(-1)j= j^3=j(-1)$, showing that $(-1)$ commutes with the generators of $G$, hence $(-1)$ is central with order $2$.
    Also, if consider the fact that $G$ is non-abelian, the $i,j$ cannot commute (since $i,j$ generates the whole $G$, if they commute everything commutes). So, with $i j in H j = j H$ (by the fact that $j in.not H$), the $i j = j,j i, j(-1)$, or $j(-1)i$. However, $i j != j^(-1) = j^3$ (or else $i = j^2=i^2$ is a contradiction), $i j != j i$ by the statement that $i,j$ cannot commute, and $i j != j$ simply because $i!=e$. So, it enforces $i j = j (-1) i = (-1)j i$. Which also shows that $(i j)^2 = (i j)(-1)(j i) = (-1)(i j^2 i) = (-1)i (-1)i = i^6 = i^2 = -1$. Hence, we get the following relation:
    $ i^2=j^2=(i j)^2 = -1, quad j (i j) = j (-1)j i = j^4 i= i $ 
    $ (i j) i = (-1)(j i)i = (-1)j(-1) = (-1)^2 j= j, quad (-1)^2=1 $
    Hence, relable $k:= (i j)$, we get:
    $ i^2=j^2=k^2=-1, quad (-1)^2=1, quad i j=k, j k=i, k i=j $
    $ i j = (-1)j i, quad k j=(i j) j = i(-1) = (-1)i = (-1)j k $
    $ i k = i(i j) = (-1)j = (-1)k i $
    Hence, it's a quaternion group relation.
  So, for non-abelian group of order $8$, it's either dihedral group $D_8$, or the quaternion group (formed by multiplication of $1,i,j,k$).

  \ 

  \ 

  Finally, for $n=6,10$, since $6=2 dot 3$ and $10=2 dot 5$, both are the case of $n=2 p$ for some prime $p$. 

  If the given group $G$ of order $2p$ is abelian, then $G tilde.equiv ZZ\/(2p)ZZ$ or $G tilde.equiv ZZ\/2ZZ times ZZ\/p ZZ$ by Fundamental Theorem of Finite Abelian group.

  Else, if the group is non-abelian, we claim that it's in fact dihedral group $D_(2p)$: If $G$ is non-abelian, it cannot have any order $2p$ elements, hence all elements are either order $1,2,$ or $p$. But, we've proven that all nontrivial element has order $2$ implies it's abelian, so there must have nontrivial element $sigma in G$ with order $p$.

  Now, since $H=angle.l sigma angle.r$ is order $p$, with $|G|=2p$, $H$ is an index $2$ subgroup, which is normal. Hence, $G\/H$ is a group of order $2$, so for all $tau in.not H$, we have $overline(tau) in G\/H$ with order $2$, hence $tau^2 in H$. But notice that if $tau^2 != e$ (i.e. $tau^2 = sigma ^k$ for some integer $0<k<p$), then since $sigma^k$ has order $p$ (since $k,p$ are coprime), then $sigma^k$ generates $H$ also. Hence, because $G = H union.sq tau H$, hence every element is in the form $tau^i (sigma^k)^j = tau^i dot tau^(2 j)$, showing $tau$ generates the whole group, yet this is a contradiction (since then $G$ is abelian). So, it enforces $tau^2=e$.

  Finally, given $(tau sigma) in tau H$, since $(tau H)^2 = H$, then $(tau sigma)^2 = sigma^k$ for some integer $0<=k<p$. However, if $(tau sigma)^2 != e$ (or $(tau sigma)^2 = sigma^k$ for some integer $0<k<p$, where $sigma^k$ generates $H$), since $tau sigma in.not H$, then $G = H union.sq (tau sigma)H$. So, every element is in the form $(tau sigma)^k (sigma^k)^j = (tau sigma)^(k+2j)$, showing again that $tau sigma$ generates $G$, which is a contradiction. So, $(tau sigma)^2 = e$, showing that $tau sigma tau = sigma^(-1)=sigma^(p-1)$, hence $tau, sigma$ satisfies the dihedral group relation, or $G$ is group isomorphic to a dihedral group.

  So, if $G$ has order $2p$, and not abelian, then $G tilde.equiv D_(2p)$.

  In particular, since $p=3$ has $D_(6) = S_3$, then any non-abelian group of order $6$ must be $S_3$.
]

= D//5
#problem[
  Lang Chapter 1 \#34:

  + Let $n$ be an even positive integer. Show that there exists a group of order $2n$, generated by two elements $sigma, tau$ such that $sigma^n=e=tau^2$, and $sigma tau=tau sigma^(n-1)$. This group is called the #text(weight: "bold")[dihedral group].
  + Let $n$ be an odd positive integer. Let $D_(4n)$ be the group generated by the matrices
    $ mat(0,-1;1,0) "and" mat(zeta,0;0,zeta^(-1)) $
    where $zeta$ is a primitive $n$-th root of unity. Show that $D_(4n)$ has order $4n$, and give the commutation relations between the above generators.
][
  + Here, assume we know dihedral group, then we're done (since the whole geometric construction is way too tedious).

  + Given that $mat(0,-1;1,0)^2=-id$, then $mat(0,-1;1,0)$ has order $4$; also, since $zeta$ is a primitive $n$-th root of unity, then $zeta^n =  zeta^(-n)=1$ (while any integer $0<k<n$ doesn't satisfy this relation). Hence, $mat(zeta,0;0,zeta^(-1))$ has order $n$ since its power $k$ has the form $mat(zeta^k,0;0,zeta^(-k))$). So, if $D_(4n)$ is finite, then $4$ and $n$ (order of the two generators) must divide $|D_(4n)|$, hence $lcm(4,n)=4n$ divides $|D_(4n)|$ (since $n$ is odd).

    The reason why $D_(4n)$ is finite, since if consider the multiplication of the two generators, we get:
    $ mat(0,-1;1,0)mat(zeta,0;0,zeta^(-1))=mat(0,-zeta^(-1);zeta,0) = mat(zeta^(-1),0;0,zeta)mat(0,-1;1,0)=mat(zeta,0;0,zeta^(-1))^(-1)mat(0,-1;1,0) $
    if consider the subgroup $H$ generated by $mat(zeta,0;0,zeta^(-1))$, the above relation shows tha it's normal (since both generators has the conjugation of elements in $H$ staying in $H$). Also, since it provides that the two generators can swap position, with the cost that the one with primite $n$-th root is inverted), then every group element $sigma in D_(4n)$ in fact can be written as $mat(zeta,0;0,zeta^(-1))^k mat(0,-1;1,0)^l$ for some $k,l in ZZ$. Since there are at most $n$ distinct elements for $mat(zeta,0;0,zeta^(-1))^k$ and there are at most $4$ distinct elements for $mat(0,-1;1,0)^l$, then there are at most $4n$ distinct elements in $D_(4n)$.

    Hence, this enforces that $|D_(4n)|=4n$ (since $4n$ divides the order, and the order is at most $4n$).
]

\ 

= D//6
#problem[
  Lang Chapter 1 \#50:

  + Show that fiber products exist in the category of abelian groups. In fact, if $X,Y$ are abelian groups with homomorphisms $f:X arrow.r Z$ and $g:Y arrow.r Z$ show that $X times_Z Y$ is the set of all pairs $(x,y)$ with $x in X$ and $y in Y$ such that $f(x)=g(y)$. The maps $p_1,p_2$ are the projections on the first and second factor respectively.
  + Show that the pull-back of a surjective homomorphism is surjective.
][
  + First, recall that product in $Grp$ and $Ab$ (category of groups and abelian groups respectively) is the direct product with the associated group structure. Which, given $f:X arrow.r Z$ and $g:Y arrow.r Z$ two abelian group homomorphisms, let $X times Y$ denotes the product, and $pi_X:X times Y arrow.r X$ and $pi_Y:X times Y arrow.r Y$ denote the two projections respectively. Then, $f compose pi_X, g compose pi_Y:X times Y arrow.r Z$ are two group homomorphisms. 
  
    Since $Z$ is an abelian group, the inversion map $iota:Z arrow.r.tilde Z$ is in fact a group homomorphism (since for all $a,b in Z$, $iota(a b) = (a b)^(-1)=b^(-1) a^(-1)=a^(-1) b^(-1)=iota(a) iota(b)$), consider the map $h:X times Y arrow.r Z$, defined as follow:
    $ h(x,y) = (iota compose f compose pi_X (x,y)) dot (g compose pi_Y (x,y)) = (f(x))^(-1) g(y) $
    since $iota compose f compose pi_X$ and $g compose pi_Y$ are both group homomorphisms with codomain $Z$, while $Z$ is abelian, then the above $h$ is also a group homomorphism. Then, it's valid to consider $ker(h) <= X times Y$.

    \ 

    Now, define $p_1:ker(h) arrow.r X$ as restriction of $pi_X:X times Y arrow.r X$, similarly $p_2:ker(h) arrow.r Y$ as restriction of $pi_Y:X times Y arrow.r Y$. We claim that $ker(h)$ together with $p_1,p_2$ forms a fiber product of $f$ and $g$.

    First, to show it "equalizes" $f$ and $g$, for all $(x,y) in ker(h)$, since $h(x,y) = (f(x))^(-1) g(y) = e$ in $Z$, then $g(y)=f(x)$. Hence:
    $ forall (x,y) in ker(h), quad f compose p_1(x,y) = f(x) = g(y) = g compose p_2(x,y) $
    This shows that $f compose p_1=g compose p_2$.

    Now, to prove it's universal with fiber product property. Given any abelian group $G$, together with $q_1:G arrow.r X$ and $q_2:G arrow.r Y$ that satisfies $f compose q_1 = g compose q_2$, by the universal property of product $X times Y$, there exists a unique group homomorphism $(q_1,q_2):G arrow.r X times Y$ such that $q_1=pi_X compose (q_1,q_2)$ and $q_2=pi_Y compose (q_1,q_2)$. However, notice that $(q_1,q_2)$ satisfies $(q_1,q_2)(a) = (q_1(a),q_2(a)) in X times Y$ satisfies $f(q_1(a)) = g(q_2(a))$ by definition, hence:
    $ h(q_1(a),q_2(a)) = (f(q_1(a)))^(-1) g(q_2(a)) = e in Z $
    Hence, $(q_1(a),q_2(a))=(q_1,q_2)(a) in ker(h)$, showing that $im (q_1,q_2) subset.eq ker(h) subset.eq X times Y$, hence it restricts to a group homomorphism $(q_1,q_2):G arrow.r ker(h)$ that satisfies $p_1 compose (q_1,q_2)=pi_X compose (q_1,q_2)=q_1$, and $p_2 compose (q_1,q_2)=pi_Y compose (q_1,q_2)=q_2$, this shows the existence of a group homomorphism $G arrow.r ker(h)$.

    Finally, to show this map is indeed unique, suppose $l:G arrow.r ker(h)$ is another group homomorphism such that $p_1 compose l=q_1$ and $p_2 compose l=q_2$. Then, for all $a in G$, $p_1 compose l(a) = pi_X (l(a)) = q_1(a)$ and $p_2 compose l(a)=pi_Y (l(a))=q_2(a)$, hence $l(a)=(q_1(a),q_2(a)) = (q_1,q_2)(a) in ker(h) <= X times Y$, showing $l=(q_1,q_2)$. Hence, such map $G arrow.r ker(h)$ is unique.

    This shows that $ker(h)$ together with $p_1:ker(h) arrow.r X$ and $p_2:ker(h) arrow.r Y$ is indeed a fiber product of $f:X arrow.r Z$ and $g:Y arrow.r Z$, showing fiber product exists in $Ab$.

    \ 

    Now, recall that $(x,y) in ker(h)$ iff $h(x,y) = (f(x))^(-1) g(y) = e$, which is equivalent to $f(x)=g(y)$. Hence, $ker(h)$ is also characterized by all $(x,y) in X times Y$, such that $f(x)=g(y)$.

    \ 

    \ 

  + For definiteness, given $f:X arrow.r Z$ and $g:Y arrow.r Z$ two abelian group homomorphisms, and say $g$ is surjective. Then, let the fiber product $X times_Z Y <= X times Y$ collect all the element $(x,y) in X times Y$ satisfying $f(x)=g(y)$ (together with $p_1:X times_Z Y arrow.r X$ and $p_2:X times_Z Y arrow.r Y$ be the two projections). 

    To show that $p_1$ (the pull-back of $g$) is also surjective, consider the following: For all $x in X$, since $f(x) in Z$ and $g$ is surjective, there exists $y in Y$, such that $g(y)=f(x)$. Hence, the pair $(x,y) in X times_Z Y$, and $p_1(x,y) = x$, this shows that $x in im(p_1)$, or $X = im(p_1)$. Hence, $p_1$ (the pull-back of $g$) is also surjective.
]

= ND//7
#problem[
  Lang Chapter 1 \#51:
  
  + Show that fiber products exist in the category of sets.
  + In any category $cal(C)$, consider the category $cal(C)_(Z)$ of objects over $Z$. Let $h:T arrow.r Z$ be a fixed object in this category. Let $F$ be the functor such that 
    $ F(X)="Mor"_Z (T,X) $
    where $X$ is an object over $Z$, and $"Mor"_Z$ denotes morphisms over $Z$. Show taht $F$ transforms fiber products over $Z$ into products in the category of sets.
][
  + Given any $f:X arrow.r Z$ and $g:Y arrow.r Z$ as set functions, let $X times Y$ denote the product of the two sets, $pi_1:X times Y arrow.r X$ and $pi_2:X times Y arrow.r Y$ denote the two projections, while $H subset.eq X times Y$ collects all $(x,y) in X times Y$, such that $f(x)=g(y)$. We claim that $H$ together with the restriction of $pi_1,pi_2$ onto $H$ forms a fiber product of $f,g$ in the category of sets.

    First, for all $(x,y) in H$, we have $f compose pi_1(x,y) = f(x) = g(y)=g compose pi_2(x,y)$, hence $f compose pi_1=g compose pi_2:H arrow.r Z$, showing that it satisfies the basic properties a fiber product needs.

    Then, to show its universality, suppose set $A$ together with $q_1:A arrow.r X$ and $q_2:A arrow.r Y$ satisfies $f compose q_1=g compose q_2$. Since it maps from $A$ to both $X$ and $Y$, by the universality of direct product in sets, there exists a unique map $(q_1,q_2):A arrow.r X times Y$, such that $pi_1 compose (q_1,q_2)=q_1$, and $pi_2 compose (q_1,q_2)=q_2$ (without restricting the domain of $pi_1,pi_2$). Now, notice that for all $a in A$, since $f compose q_1(a)=g compose q_2(a)$, then $(q_1,q_2)(a) = (q_1(a),q_2(a)) in H$ by definition, hence $(q_1,q_2):A arrow.r H$ is a well-defined function after restriction.

    Also, notice that $(q_1,q_2):A arrow.r H$ must necessarily be unique: Suppose some other $h:A arrow.r H$ satisfies $pi_1 compose h=q_1$ and $pi_2 compose h=q_2$, then $pi_1(h(a)) = q_1(a)$ and $pi_2(h(a))=q_2(a)$, showing that $h(a)=(q_1(a),q_2(a))=(q_1,q_2)(a)$, hence $h=(q_1,q_2)$.

    So, this proves that given set $A$ with $q_1:A arrow.r X$ and $q_2:A arrow.r Y$ satisfying $f compose q_1=g compose q_2$, then this pair $(A,q_1,q_2)$ necessarily factors through the pair $(H,pi_1,pi_2)$ (where $pi_i$ are restricted to $H$), hence $(H,pi_1,pi_2)$ does serve as a fiber product of $f,g$, inside the category of sets.

    \ 

  + IDK
]