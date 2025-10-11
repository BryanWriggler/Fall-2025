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

= ND//4
#problem[
  Lang Chapter 1 \#31:

  Determine all groups of order $<= 10$ up to isomorphism. In particular, show that a non-abelian group of order $6$ is isomorphic to $S_3$.
][
  For $n=1$, the only group of such order is ${e}$ (since by definition a group must need an identity, so it's the only element).

  \ 

  For case $n=2,3,5,7$ (prime numbers $<= 10$), we'll show that all group must be isomorphic to $ZZ\/ n ZZ$: Given a group $G$ with $|G|=n$, since $n!=1$ on our list, then $G$ is nontrivial, hence there exists $g in G$ where $g!=e$. Then, since $|g|$ divides $|G|=n$, while $n$ (in our list) is prime, then with $g!=e$ (implying $|g|!=1$), we must have $|g|=n$, hence the cyclic subgroup $angle.l g angle.r<= G$ satisfies $|angle,l g angle.r| = |g|=n = |G|$, showing that $angle.l g angle.r = G$. Then, since $g$ has order $n$, then $G=angle.l g angle.r tilde.equiv ZZ\/n ZZ$.

  \ 

  For case $n=4,9$ (where $4=2^2$ and $9=3^2$, both prime square), since $n=p^2$ for some prime $p$, we'll show that all such group must be ablian: Suppose the contrary that there exists non-abelian group $G$ with prime square power, let $G$ acts on itself via conjugation action, then by class equation, $|G|=|Z(G)| + |sum_(j in J)[G:G_(x_i)]|$, where $J$ runs through all distinct representatives of group elements with nontrivial conjugation classes.
]

= ND//5
#problem[
  Lang Chapter 1 \#34:

  + Let $n$ be an even positive integer. Show that there exists a group of order $2n$, generated by two elements $sigma, tau$ such that $sigma^n=e=tau^2$, and $sigma tau=tau sigma^(n-1)$. This group is called the #text(weight: "bold")[dihedral group].
  + Let $n$ be an odd positive integer. Let $D_(4n)$ be the group generated by the matrices
  $ mat(0,-1;1,0) "and" mat(zeta,0;0,zeta^(-1)) $
  where $zeta$ is a primitive $n$-th root of unity. Show that $D_(4n)$ has order $4n$, and give the commutation relations between the above generators.
][
]

#pagebreak()

= ND//6
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

  + 
]

= ND//7
#problem[
  Lang Chapter 1 \#51:
  
  + Show that fiber products exist in the category of sets.
  + In any category $cal(C)$, consider the category $cal(C)_(Z)$ of objects over $Z$. Let $h:T arrow.r Z$ be a fixed object in this category. Let $F$ be the functor such that 
  $ F(X)="Mor"_Z (T,X) $
  where $X$ is an object over $Z$, and $"Mor"_Z$ denotes morphisms over $Z$. Show taht $F$ transforms fiber products over $Z$ into products in the category of sets.
][
]