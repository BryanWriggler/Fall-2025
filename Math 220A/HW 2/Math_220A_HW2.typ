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
  title: "Math 220A HW 2",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Prove that all finite $p$-groups are solvable.
][
  Given any finite $p$-group $G$ (where $p$ is prime), the order $|G| = p^k$ for some $k in NN\\{0}$. Hence, we'll perform induction on the exponent $k$.

  \ 

  For base case $k=1$, if $|G|=p$, then since $p$ is prime then $G tilde.equiv ZZ\/p ZZ$ as group (must be cyclic, hence abelian). Then, since abelian groups are vacuously solvable, $G$ is solvable.

  \ 

  Now, suppose for given $n in NN$, any $p$-group $G$ with $|G|=p^k$ (where $k<n$) is solvable. Then, for the case of any $p$-group $H$ with $|H| = p^n$, we'll consider the following statements:

  + #text(weight: "bold")[$H$ has nontrivial Center:]
    
    If consider the conjugation action of $H$ on itself, then all the singletons among the conjugation classes are precisely the elements in the center (since ${h} subset.eq H$ is a conjugation class $<==>$ $g h g^(-1) = h$ for all $g in H$ $<==>$ $g h=h g$ for all $g in H$, which is characterized as $h in Z(H)$, the center of $H$). Hhen based on the class equation, we get the following:
    $ |H| = |Z(H)| + sum_(j in J)|Conj(h_j)| $
    Where the list of $J$ runs through distinct $h_j in H$, each represent a distinct conjugation class that is not singleton (and $Conj(h_j)$ denotes the conuation class of $h_j$). Then, since by Orbit Stabilizer Theorem, one has $|H| = p^n$ being divisible by $|Conj(h_j)|$ (which is not $1$), then one must have $|Conj(h_j)| = p^(i_j)$ for some integer $i_j >0$, so $|Conj(h_j)|$ is divisible by $p$. Hence, every element in the sum $sum_(j in J)|Conj(h_j)|$ are divisible by $p$, $sum_(j in J)|Conj(h_j)| = p dot k$ for some integer $k in ZZ$. Together with $|H|=p^n$, one has the following:
    $ |Z(H)| = |H|-sum_(j in J)|Conj(h_j)| = p^n-p dot k = p dot (p^(n-1)-k) $
    This shows that $|Z(H)|$ is divisible by $p$, hence $|Z(H)|!=1$, showing the center is nontrivial. 

    \ 

  + #text(weight: "bold")[Preimage of Group Homomorphism preserves Normality:]

    Given a group homomorphism $f:K arrow.r.twohead L$, let $N<= M <= L$ be subgroups such that $N lt.tri.eq M$. If consider their preimage $N' = f^(-1)(N)$ and $M' = f^(-1)(M)$ (where $N' <= M'$), one has $f(N')<=N$ and $f(M')<=M$. Now, given any $r in N'$ and $q in M'$, if consider $q r q^(-1)$, we have the following:
    $ f(q r q^(-1)) = f(q) f(r) f(q)^(-1) in N $
    Since $f(q) in M$ and $f(r) in N$, based on normality $N lt.tri.eq M$ one has $f(q) f(r) f(q)^(-1) in N$. Therefore, $q r q^(-1) in f^(-1)(N) = N'$, showing that $N' lt.tri.eq M'$.

  \ 

  As a consequence of #text(weight: "bold")[1], with $|Z(H)|$ divides $|H|=p^n$, one must have $|Z(H)|=p^k$ for some integer $0<k<=n$; together with $Z(H)$ being abelian, utilizing Cauchy's Theorem, there exists element $l in Z(H)$ such that $|l|=p$, so $angle.l l angle.r subset.eq H$ is a central (hence normal) subgroup of $H$ with order $p$. Then, $H\/angle.l p angle.r$ is a quotient group with $|H\/angle.l l angle.r| = p^k/p = p^(n-1)$ also being a $p$-group (or a trivial group, if $n=1$). Hence, with $(n-1)<n$, by induction $H\/angle.l l angle.r$ is solvable. Hence, there exists chain/tower of subgroups ${e}=K_0 < K_1 < ...< K_m = H\/angle.l l angle.r $, such that for each index $i$, $K_i lt.tri.eq K_(i+1)$, and $K_(i+1)\/K_i$ is abelian.

  Now, using the condition given by #text(weight: "bold")[2], pullback the tower using the projection $pi:H arrow.r.twohead H\/angle.l l angle.r$, let $K'_i := pi^(-1)(K_i)$, it admits the following tower:
  $ {e} < angle.l l angle.r = K'_0 < K'_1 < ... < K'_m = H $
  Since $pi$ is surjective, then $K'_m=pi^(-1)(K_m) = pi^(-1)(H\/angle.l l angle.r)$; also, since $pi^(-1)(K_0)=pi^(-1)({1}) = ker(pi)$, with $pi$ being projection, then $K'_0=pi^(-1)({1})=ker(pi) = angle.l l angle.r$. And, the reason this is a tower, is because $K_i lt.tri.eq K_(i+1)$ implies $K'_i lt.tri.eq K'_(i+1)$ by consequence of #text(weight: "bold")[2].

  \ 

  Finally, to prove that such tower is abelian, for each index $i$, the projection restricts to $pi:K'_i arrow.r.twohead K_i$ (since $pi$ is surjective, so $pi(K'_i)=pi(pi^(-1)(K_i)) = K_i$). Now, given the restriction $pi:K'_(i+1) arrow.r.twohead K_(i+1)$, since $K_i lt.tri.eq K_(i+1)$, and $K_(i+1)\/K_i$ is abelian by assumption, then composing with the projection $rho:K_(i+1) arrow.r.twohead K_(i+1)\/K_i$, one has $rho compose pi:K'_(i+1) arrow.r.twohead K_(i+1)\/K_i$ being an surjective group homomorphism with abelian image, showing that $K'_(i+1)\/ker(rho compose pi) tilde.equiv K_(i+1)\/K_i$ being abelian also.

  Now, notice that $ker(rho compose pi) = K'_i$: Given any $g in K'_(i+1)$, one has $g in ker(rho compose pi) <==> rho(pi(g))=1 in K_(i+1)\/K_i <==> pi(g) in K_i <==> g in pi^(-1)(K_i)=K'_i$. Hence, we in fact has $K'_(i+1)\/K'_i$ also being abelian, concluding that the following tower is abelian:
  $ {e}<K'_0 < K'_1 < ... < K'_m = H $
  (Note: the reason why ${e}< K'_0$ is part of the abelian tower, is simply because $K'_0= angle.l l angle.r$ is central, hence automatically abelian).

  Hence, $H$ (with $|H|=p^n$) is solvable. This finishes the induction.
]

#pagebreak()

= ND (Broken Down to Problem 2, 3)//2
#problem[
  Lang Algebra Chapter 1 \#49:

  \ 

  #text(weight: "bold")[A group as an automorphism group.] Let $G$ be a gruop and let $Set(G)$ be the category of $G$-sets (i.e. sets with a $G$-operation / $G$-action). Let $F:Set(G) arrow.r Set$ be the forgetful functor, which to each $G$-set assigns the set itself. Show that $Aut(F)$ is naturally isomorphic to $G$.
][
  Given that $Aut(F)$ denotes the set of all natural isomorphisms from functor $F$ to itself, to show it can be naturally isomorphic to $G$, we'll first claim some statements. As a side note, here $G in Set(G)$ is identified with its natural left action on itself (i.e. left multiplication), if any other action of $G$ on itself shows up, it'll be specified. 

  \ 

  1. #text(weight: "bold")[ Any $G$-set $X$ satisfies $Hom_(Set(G))(G,X) tilde.equiv X$ as sets:]

    First, for any $f in Hom_(Set(G))(G,X)$ (which preserves left $G$-action), it's uniquely identified by $f(e) in X$. Since given any $g in G$, one has $f(g) = f(g dot e)=g dot f(e)$, so knowing $f(e) in X$ automatically determines the whole map $f$.

    Conversely, for any $x in X$, one can construct such map $f_x in Hom_(Set(G))(G,X)$ such that $f_x (e) = x$, since define $f_x:G arrow.r X$ by $f_x (g):= g dot x$ for all $g in G$, satisfies $f_x (e)=e dot x=x$, and $g dot f_x (e)=g dot x=f_x(g) = f_x (g dot e)$, then $f_x$ is a $G$-equivariant map with $f_x (e)=x$, showing that $f_x in Hom_(Set(G))(G,X)$.

    Hence, consider the map $Hom_(Set(G))(G,X) arrow.r X$ by $f mapsto f(e)$, this defines a natural bijection (since each $x in X$ is endowed with a unique map $f_x in Hom_(Set(G))(G,X)$ such that $f_x (e)=x$).

    \ 

  2. #text(weight: "bold")[Natural Isomorphism on $F$ satisfies $Aut(F) tilde.equiv G$ as sets:]

    Let $eta:F arrow.r.tilde F$ be a natural isomorphism (which, its inverse natural transformation $eta^(-1):F arrow.r.tilde F$ satisfies the property that for al $G$-set $X in Set(G)$, $eta_X:F(X) arrow.r.tilde F(X)$ is invertible, and $(eta_X)^(-1) = eta^(-1)_X$).

    Now, since $F$ is just forgetful functor, as set $F(G)=G$, and for any $X in Set(G)$, all $f in Hom_(Set(G))(G,X)$ has $F f = f in Hom_Set (G,X)$ (which simply forgets the $G$-equivariance structure, as set maps they're the same). Notice that given any $X in Set(G)$, one has $eta_X:F(X) arrow.r.tilde F(X)$ (or $eta_X:X arrow.tilde X$ as set map) being completely determined by $eta_G (e)$ (where $eta_G:F(G) arrow.tilde F(G)$, or $eta_G:G arrow.r.tilde G$ as set maps).

    \ 

    Given any $X in Set(G)$ and any $x in X$, recall that from #text(weight: "bold")[1] there exists a unique map $f_x in Hom_(Set(G))(G,X)$ such that 
    #set align(center)
    #diagram($
              G edge(->, script(f_g)) edge("d",->,script(eta_G)) & G edge("d",->,script(eta_G), #left)\
              G edge(->, script(f_g), #right) & G
            $)
    #set align(left)


]

#problem[
  Lang Algebra Chapter 1 \#53:

  \ 

  Let $H,G,G'$ be groups, and let $f:H arrow.r G$, $g:H arrow.r G'$ be two homomorphisms. Define the notion of coproduct of these two homomorphisms over $H$, and show that it exists.
][]

= ND//3
#problem[
  Construct the fibre product in a category using the notation of product and equalizer. This is a hint that all small limits are built out of small products and equalizers.
][]

= ND//4
#problem[
  Show that, if $F:cat(C) arrow.r cat(D)$ is a natural equivalence between two categories $cat(C)$ and $cat(D)$, then it is both fully faithul and essentially surjective.
][]

= ND//5

= ND//6
#problem[
  Prove that left adjoint preserves colimit. 
][]

= D//7
#problem[
  Give an example that tensor product is not left exact in general.
][
  Consider the $ZZ$-module homomorphism $m:ZZ arrow.r.hook ZZ$ by $m(a) = 2a$ for all $a in ZZ$ (where $m$ is injective). Then, it since $im(m) = 2ZZ$, this indicates that a cokernel of $m$ can be given by $pi:ZZ arrow.r.twohead ZZ\/2ZZ$ via canonical projection. Which, it forms the short exact sequence $0 arrow.r ZZ arrow.r.hook ZZ arrow.r.twohead ZZ\/2ZZ arrow.r 0$ (the second map is $m$, the third map is $pi$).

  \ 

  However, if consider the tensor product of the above ones with $ZZ$-module $ZZ\/2ZZ$, then the form the map $1 times.circle m:ZZ\/2ZZ times.circle ZZ arrow.r ZZ\/2ZZ times.circle ZZ$ by $(1 times.circle m)(a times.circle b)=a times.circle (2 b)$ for all $a in ZZ\/2ZZ$ and $b in ZZ$. Yet, notice that this map is a zero map, since $a times.circle (2 b) = (2 a) times.circle b = 0 times.circle b = 0$ (because $2 a =0 in ZZ\/2ZZ$, where $a$ is arbitrary). This shows that an injective module homomorphism after tensoring with some modules (and the corresponding identity map), it doesn't necessarily preserve injectivity (in this case, it turns $m$ an injective morphism to $1 times.circle m$, a zero map).

  \ 

  Since this tensor product with $ZZ\/2ZZ$ doesn't necessarily preserve injectivity, it doesn't preserve the left side of short exact sequence (since $0 arrow.r ZZ arrow.r.hook ZZ$ by $m$, gets send to $ZZ\/2ZZ times.circle ZZ arrow.r ZZ\/2ZZ times.circle ZZ$ a zero map, which is no longer injective). So, tensor with $ZZ\/2ZZ$ is not left exact, which serves as a counterexample here.
]