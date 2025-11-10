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

= D (Broken Down to Problem 2, 3)//2
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

    First, we'll show that $eta_G (e) in G$ completely determines the whole natural isomorphism: Given any $X in Set(G)$ and any $x in X$, recall that from #text(weight: "bold")[1] there exists a unique $G$-equivariant map $f_x in Hom_(Set(G))(G,X)$ such that $f_x (e)=x$. Which, $eta$ must satisfy the following:
    #set align(center)
    #diagram($
              G edge(->, script(f_x)) edge("d",->,script(eta_G)) & X edge("d",->,script(eta_X), #left)\
              G edge(->, script(f_x), #right) & X
            $)
    #set align(left)
    Hence, we get thefollowing relation (given that $eta_G (e) in G$):
    $ eta_X (x) = eta_X (f_x (e)) = f_x (eta_G (e)) = f_x (eta_G (e) dot e) = eta_G (e) dot f_x (e) = eta_G (e) dot x $
    Hence, given a natural isomorphism $eta:F arrow.r.tilde F$, it's completely determined by its assignment of $e$, or what $e mapsto eta_G (e)$ is.

    \ 

    Next, given any $g in G$, there exists such natural isomorphism $rho:F arrow.r.tilde F$ such that $rho_G (e)=g$: Given any $X in Set(G)$, define the corresponding morphism $rho_X:X arrow.r.tilde X$ as $eta_X (x) = g dot x$. Since the $G$-action is always invertible, it's clear that $rho_X$ must be set isomorphism. So, the collection $rho = {rho_X:X arrow.r.tilde X | X in Set(G)}$ has an "inverse" collection (since each morphism has an inverse). So, to prove it's a natural isomorphism on $F$, it suffices to prove that $rho$ is a natural transformation (since a natural transformation is an isomorphism iff every morphism is an isomorphism).

    Which, for any $X,Y in Set(G)$, given any $f in Hom_(Set(G))(X,Y)$, any $x in X$ and $h in G$ satisfies $f(h dot x)=h dot f(x) in Y$. Then, the collection of isomorphism $rho$ does the following job:
    $ rho_Y (f(x)) = g dot f(x) = f(g dot x) = f(rho_X (x)) $
    Hence, this demonstrates that $rho_Y compose f = f compose rho_X$. So, the following diagram commutes for any such choice of $X,Y in Set(G)$, and $G$-equivariant map $f in Hom_(Set(G))(X,Y)$:
    #set align(center)
    #diagram($
              X edge(->, script(f)) edge("d",->,script(rho_X)) & Y edge("d",->,script(rho_Y), #left)\
              X edge(->, script(f), #right) & Y
            $)
    #set align(left)
    This shows that $rho$ is in fact a natural transformation on $F$ the forgetful functor, and with every corresponding morphism being an isomorphism, it's a natural isomorphism.

    \ 

    Therefore, the assignment $phi:Aut(F) arrow.r G$ by $eta mapsto eta_G (e)$ defines a bijection (since each $g in G$ has a unique $eta in Aut(F)$ such that $eta_G (e)=g$).

  \ 

  With the map $phi:Aut(F) arrow.r.tilde G$ being a bijection, to prove that $Aut(F) tilde.equiv G$ as groups, it suffices to show that $phi$ is indeed a group homomorphism. However, given any $rho, eta in Aut(F)$, we have $(rho compose eta)_G = rho_G compose eta_G$. Let $g = rho_G (e)$ and $h = eta_G (e)$, the relation proven in #text(weight: "bold")[2] shows that for all $k in G$, one has $rho_G (k) = rho_G (e) dot k = g k$ (recall that here $G$ is using left action on itself). Hence, the following relation is true:
  $ (rho compose eta)_G (e) = rho_G compose eta_G (e)=rho_G(h) = g h $
  Hence, since $phi(rho) = rho_G (e)=g$ and $phi(eta) = eta_G (e) = h$, we have $phi(rho compose eta) = (rho compose eta)_G (e)=g h = phi(rho) phi(eta)$. So, $phi$ is indeed a group homomorphism, hence it's a group isomorphism between $Aut(F)$ and $G$. So, $Aut(F)$ and $G$ are indeed isomorphic.
]

\ 

#problem[
  Lang Algebra Chapter 1 \#53:

  \ 

  Let $H,G,G'$ be groups, and let $f:H arrow.r G$, $g:H arrow.r G'$ be two homomorphisms. Define the notion of coproduct of these two homomorphisms over $H$, and show that it exists.
][
  Here, we'll first define the #emph[Coslice Category] over $H$ (denoted as $Grp^H$). Here, define $Ob(Grp^H)$ to be the collection of all pair $(K, h_K:H arrow.r K)$, where $K$ is a group and $h_K$ is a group homomorphism. Also, given any groups $K,L$ with $h_K:H arrow.r K$ and $h_L: H arrow.r L$, define the set of morphisms $Hom_(Grp^H)(h_K, h_L):= {f: K arrow.r L | h_L = f compose h_K}$, which are all the group homomorphism $f:K arrow.r L$ such that the following diagram commutes:
  #set align(center)
  #diagram($
            & H edge("dl", ->, script(h_K)) edge("dr", ->, script(h_L)) \
            K edge("rr", ->, script(f), #right) &  & L
          $)
  #set align(left)
  To show that such definitions form a category, it suffices to check that composition of morphisms is well-defined, and the endomorphism set contains identity (since associativity naturally follows from the associativity of set function composition).

  First, given  groups $K,L,P$ and $h_K, h_L, h_P$ three morphisms in $Grp^H$, if $f in Hom_(Grp^H)(h_K,h_L)$ and $g in Hom_(Grp^H)(h_L, h_P)$, the following diagram commutes:
  #set align(center)
  #diagram($
            & H edge("dl", ->,script(h_K)) edge("d",->,script(h_L)) edge("dr",->,script(h_P)) \
            K edge(->,script(f),#right) & L edge(->,script(g),#right) & P
          $)
  #set align(left)
  This shows that $g compose f$ is a morphism from $h_K$ to $h_P$, or $g compose f in Hom_(Grp^H)(h_K,h_P)$, hence composition is well-defined.

  Finally, extending from the above notations, the identity $id_L:L arrow.r.tilde L$ satisfies the following:
  #set align(center)
  #diagram($
            & H edge("dl", ->,script(h_K)) edge("d",->,script(h_L)) edge("dr",->,script(h_L)) \
            K edge(->,script(f),#right) & L edge(->,script(id_L),#right) & L
          $) 
  #diagram($
            & H edge("dl", ->,script(h_L)) edge("d",->,script(h_L)) edge("dr",->,script(h_P)) \
            L edge(->,script(id_L),#right) & L edge(->,script(g),#right) & P
          $)
  #set align(left)
  Hence, showing that $id_L in End_(Grp^H)(h_L)$, together with $id_L compose f=f$ and $g compose id_L=g$ (given $f in Hom_(Grp^H)(h_K,h_L)$ and $g in Hom_(Grp^H)(h_L, h_P)$). Hence, identity is well-defined, showing it's indeed a category.

  \ 

  To define a notion of coproduct of $f:H arrow.r G$ and $g: arrow.r G'$ given in the problem, it'll be a group $C$ with group homomorphism $h_C:H arrow.r C$, together with two morphisms $i_f in Hom_(Grp^H)(f,h_C)$ and $i_g in Hom_(Grp^H)(g,h_C)$, such that $i_f compose f=i_g compose g$, and it is initial with this property. 
  
  Which means, given any other $h_D:H arrow.r D$ in the category that's paired up with morphisms $d_f in Hom_(Grp^H)(f,h_D)$ and $d_g in Hom_(Grp^H)(g,h_D)$, there exists a unique morphism $d:C arrow.r D$, such that $d_f = d compose i_f$ and $d_g=d compose i_g$.

  Which, by dsescription one must have $h_C = i_f compose f=i_g compose g$, and $h_D = d_f compose f = d_g compose g$, so one can implicitly assume their existence in the diagram. Which, it becomes the following:
  #set align(center)
  #diagram($
            H edge(->, script(f)) edge("d",->,  script(g)) & G edge("d",->, script(i_f), #left) edge("ddr", ->, script(d_f), bend: #20deg)\ 
            G' edge(->, script(i_g), #right) edge("drr", ->, script(d_g), #right, bend: #(-20deg)) & C edge("dr", "..>", script(exists ! d))\ 
            & & D
          $)
  #set align(left)
  Hence, the object $C$ together with morphism $i_f:G arrow.r C$ and $i_g:G' arrow.r C$ (which are groups together with two group homomorphisms into it) can equivalently be interpreted as fibre coproduct of $f:H arrow.r G$ and $g:H arrow.r G'$.

  \ 

  The last step is to show the existence. Since in $Grp$ one knows the existence of coproduct, a free product of the two groups together with canonical injection. So, given $f:H arrow.r G$ and $g:H arrow.r G'$,consider the free product $G*G'$ and the two canonical injections $i_f:G arrow.r G*G'$ and $i_g:G' arrow.r G*G'$, we have two group homomorphisms $i_f compose f, i_g compose g:H arrow.r G*G'$. 
  
  Then, one can take a coequalizer of the two group homomorphisms: Consider he set $S = {i_f compose f(x) dot (i_g compose g(x))^(-1) | x in H} subset G*G'$ (i.e. elements in image of $i_f compose f$, conjugates with the corresponding image in $i_g compose g$ based on what they get mapped from in $H$). Take the subgroup generated by it, say $A(S) subset.eq G*G'$, and take its normal closure $overline(A(S)) subset.eq G*G'$ (or, the smallest normal subgroup containing $A(S)$). Consider the projection $pi:G*G' arrow.r G*G'\/overline(A(S))$. So, now one has the following diagram (which the left part is not necessarily commutative):
  #set align(center)
  #diagram($
            & G edge("dr",->, script(i_f))\
            H edge("ur",->,script(f)) edge("dr",->,script(g), #right) && G*G' edge(->,script(pi)) & G*G'\/overline(A(S))\
            & G' edge("ur",->, script(i_g), #right)
          $)
  #set align(left)
  
  Now, given the two group homomorphisms $pi compose i_f:G arrow.r G*G'\/overline(A(S))$ and $pi compose i_g:G' arrow.r G*G'\/overline(A(S))$, notice that given any $x in H$, one has the following:s
  $ (pi compose i_f) compose f(x) = overline(i_f compose f(x)) = overline(i_g compose g(x)) = (pi compose i_g) compose g(x) in G*G'\/overline(A(S)) $
  By construction, one has $(i_f compose f(x)) dot (i_g compose g(x))^(-1) in overline(A(S))$, hence $overline(i_f compose f(x)) = overline(i_g compose g(x))$ when taking the quotient. Hence, the relation is true, and reduces to the following diagram:
  #set align(center)
  #diagram($
            H edge(->, script(f)) edge("d",->,  script(g)) & G edge("d",->, script(pi compose i_f), #left) \ 
            G' edge(->, script(pi compose i_g), #right) & G*G'\/overline(A(S))
          $)
  #set align(left)
  Now, given any other group $D$ with two group homomorphisms $d_f:G arrow.r D$ and $d_g:G' arrow.r D$ satisfying $d_g compose g=d_f compose f$, by the definition, since $G*G'$ (together with $i_f:G arrow.r G*G'$ and $i_g:G' arrow.r G*G'$) is a coproduct of $G,G'$, there exists a unique group homomorphis $d:G*G' arrow.r D$, such that $d_f =d compose i_f$ and $d_g = d compose i_g$. Or, the following diagram is true:
  #set align(center)
  #diagram($
            G edge(->, script(i_f)) edge("dr", ->,script(d_f), #right) & G*G' edge("d","..>",script(exists ! d)) & G' edge("l", ->, script(i_g)) edge("dl",->, script(d_g), #left) \ 
            & D
          $)
  #set align(left)
  Then, this indicates that $(d compose i_f) compose f = d_f compose f=d_g compose g=(d compose i_g) compose g$, in other words for all $x in H$, one has $d compose (i_f compose f)(x) = d compose (i_g compose g)(x)$, showing $(i_f compose f(x)) dot (i_g compose g(x))^(-1) in ker(d)$. Hence, we have $A(S) <= ker(d)$ (since all of its generators are), showing that its normal closure $overline(A(S)) <= ker(d)$ also. The, by first isomorphism theorem, $d$ uniquely factors through $G*G'\/overline(A(S))$, or their exists a unique $overline(d):G*G'\/overline(A(S)) arrow.r D$, such that $d=overline(d) compose pi$. Which, we have that $d_f = d compose i_f = overline(d) compose (pi compose i_f)$, and $d_g = d compose i_g= overline(d) compose (pi compose i_g)$, which forms the following diagram:
  #set align(center)
  #diagram($
            H edge(->, script(f)) edge("d",->,  script(g)) & G edge("d",->, script(pi compose i_f), #left) edge("ddr", ->, script(d_f), bend: #20deg) \ 
            G' edge(->, script(pi compose i_g), #right) edge("drr",->,script(d_g), bend: #(-20deg)) & G*G'\/overline(A(S)) edge("dr", ->, script(overline(d)))\ 
            && D
          $)
  #set align(left)
  Also, the uniqueness of $overline(d)$  can be deduced from the uniqueness of $d$ (through the property of coproduct $G*G'$) and First Isomorphism Theorem (the property of quotient $G*G'\/(overline(A(S)))$). Hence, $G*G'\/(overline(A(S)))$ together with $pi compose i_f:G arrow.r G*G'\/(overline(A(S)))$ and $pi compose i_g:G' arrow.r G*G' \/ overline(A(S))$ is indeed a fibre coproduct of $f$ and $g$, showing the existence of "coproduct" between morphism $f,g$, if consider them as an object in the Coslice Category $Grp^H$.
]

\ 

= D//3
#problem[
  Construct the fibre product in a category using the notation of product and equalizer. This is a hint that all small limits are built out of small products and equalizers.
][
  Given a category $cat(C)$ with product and equalizer, we'll explicitly construct small fibre product over arbitrary indexed set $I$.

  Given $Z$, a collection of objects ${X_i}_(i in I)$ contained in $Ob(cat(C))$, and a collection of morphisms ${f_i:X_i arrow.r Z}_(i in I)$. Let $(P, {pi_i:P arrow.r X_i})$ denotes the product of the collection ${X_i}_(i in I)$ (where $pi_i:P arrow.r X_i$ is the corresponding projection to each component). Then, the collection of morphisms ${f_i compose pi_i:P arrow.r Z}_(i in I)$ as an equalizer $(E, e:E arrow.r Z)$ (notice it satisfies the property that given any $i,j in I$, such that $(f_i compose pi_i) compose e = (f_j compose pi_j) compose e$, and for any other pair $(A, a:A arrow.r Z)$ satisfying $(f_i compose pi_i) compose a=(f_j compose pi_j) compose a$ for all $i,j in I$, there exists a unique morphism $overline(a):A arrow.r E$, such that $a = e compose overline(a)$. Diagramatically, we get the following for any $i,j in I$:
  #set align(center)
  #diagram($
            E edge(->, script(e)) edge("d", "<..",script(exists ! overline(a))) & P edge(->, script(f_i compose pi_i), shift: #3pt) edge(->, script(f_j compose pi_j), #right, shift: #(-3pt)) & Z\
            A edge("ur", ->, script(a), #right)
          $)
  #set align(left)

  \ 

  Now, we claim that the collection $(E, {pi_i compose e:E arrow.r X_i}_(i in I))$ in fact forms a fibre product for the collection of morphisms ${f_i:X_i arrow.r Z}_(i in I)$. 

  First, it's clear that for any $i,j in I$, one has $f_i compose (pi_i compose e)=f_j compose (pi_j compose e)$ based on construction. 
  
  Now, given any other pair $(A, {a_i: A arrow.r X_i}_(i in I))$ that satisfies $f_i compose a_i=f_j compose a_j$ for all indices $i,j in I$, notice that there exists a unique morphism $a:A arrow.r P$ such that each $a_i = pi_i compose a$, based on the property of product. Diagramatically, it's as follow for all $i,j in I$:
  #set align(center)
  #diagram($
             & A edge("dl",->, script(a_i)) edge("dr", ->, script(a_j)) edge("d", "..>", script(exists ! a)) \ 
             X_i edge("<-", script(pi_i), #right) & P edge(->, script(pi_j), #right) & X_j
          $)
  #set align(left)
  Then, notice that since each $f_i compose a_i = f_j compose a_j$, with the product map it extends to $f_i compose pi_i compose a = f_j compose pi_j compose a$. Hence, the pair $(A,a:A arrow.r P)$ in fact equalizes all ${f_i compose pi_i:P arrow.r Z}_(i in I)$, showing there must exist a unique morphism $overline(a):A arrow.r E$, such that $a = e compose overline(a)$. diagramatically, it is as follow:
  #set align(center)
  #diagram($
             E edge(->, script(e)) & P edge(->, script(f_i compose pi_i), shift: #3pt) edge(->, script(f_j compose pi_j), #right, shift: #(-3pt)) & Z\
             A edge("ur", ->, script(a), #right) edge("u", "..>", script(exists ! overline(a)), #left)
          $)
  #set align(left)
  Hence, unwrap the diagram, it is presented as follow for all $i,j in I$:
  #set align(center)
  #diagram($
             A edge("drr", ->, script(a_j), bend: #20deg) edge("ddr", ->, script(a_i), #right, bend: #(-20deg)) edge("dr", ->, script(overline(a))) & \
             & E edge(->, script(pi_j compose e), #right) edge("d", ->, script(pi_i compose e), #left) & X_j edge("d",->, script(f_j), #left)\
             & X_i edge(->, script(f_i), #right) & Z
          $)
  #set align(left)
  Finally, such morphism $overline(a)$ is unique, because of $overline(a)':A arrow.r E$ also satisfies such property, then notice that $e compose overline(a)':A arrow.r P$ satisfies $pi_i compose a= a_i = pi_i compose (e compose overline(a)')$ (if put $overline(a)'$ in the diagram above, where $overline(a)$ is), and since $a$ is unique based on the property of product (when gathering the $a_i$s together), we must have $a = e compose overline(a)'$. However, we also know that $overline(a)$ is the unique morphism satisfying $a = e compose overline(a)$ based on the property of equalizer, so it enforces $overline(a)' = overline(a)$.

  Hence, given any pair $(A, {a_i:A arrow.r X_i}_(i in I))$ such that $f_i compose a_i=f_j compose a_j$ for all indices $i,j in I$, one must have a unique morphism $overline(a):A arrow.r E$, such that $a_i = (pi_i compose e) compose overline(a)$. This shows that $(E,{pi_i compose e:E arrow.r X_i}_(i in I))$ indeed satisfies the universal property of fibre product, which also proves that (small) fibre product exists if both products and equalizers exist.
]

\ 

= D//4
#problem[
  Show that, if $F:cat(C) arrow.r cat(D)$ is a natural equivalence between two categories $cat(C)$ and $cat(D)$, then it is both fully faithul and essentially surjective.
][

  #text(weight: "bold")[I. Imlpication:]

  First, suppose $F$ is a natural equivalence between two categories $cat(C)$ and $cat(D)$, then there exists another functor $G:cat(D) arrow.r cat(C)$, paired with two natural isomorphisms $eta:G compose F arrow.r.tilde Id_cat(C)$ and $epsilon:F compose G arrow.tilde Id_cat(D)$. 

  \ 

  To verify it's fully faithful, given any $X,Y in cat(C)$, consider the functor's associated set map $F_(X,Y):Hom_(cat(C))(X,Y) arrow.r Hom_(cat(D))(F(X),F(Y))$ by $F_(X,Y)(f) = F f$, the goal is to prove that this is bijective. 
  
  For injectivity, notice that we also have $G_(F(X),F(Y)):Hom_(cat(D))(F(X),F(Y)) arrow.r Hom_(cat(C))(G compose F(X), G compose F(Y))$. Which, given any $f in Hom_(cat(C))(X,Y)$ (where $G_(F(X),F(Y)) compose F_(X,Y)(f) = (G compose F)f$) satisfies the following diagram with $eta$:
  #set align(center)
  #diagram($
             G compose F(X) edge(->, script((G compose F)f)) edge("d",->, script(eta_X)) & G compose F(Y) edge("d",->, script(eta_Y), #left)\ 
             X edge(->, script(f), #right) & Y
          $)
  #set align(left)
  Which, since $eta$ is a natural isomorphism, both $eta_X, eta_Y$ are invertible. Hence, the map $overline(eta)_(X,Y):Hom_(cat(C))(G compose F(X), G compose F(Y)) arrow Hom_(cat(C))(X,Y)$ by $(G compose F)f mapsto (eta_Y compose (G compose F)f compose eta_X) = f$ is actually an isomorphism. Combining all maps, we get the following $overline(eta)_(X,Y) compose G_(F(X),F(Y)) compose F_(X,Y):Hom_(cat(C))(X,Y) arrow.r Hom_(cat(C))(X,Y)$ satisfies the following:
  $ overline(eta)_(X,Y) compose G_(F(X),F(Y)) compose F_(X,Y)(f) = overline(eta)_(X,Y)((G compose F)f) = f $
  Hence, this map is precisely identity on $Hom_(cat(C))(X,Y)$, showing that it's in particular injective. So, $F_(X,Y)$ is injective.

  For surjectivity instead, let $X'=F(X)$, $Y'=F(Y)$, then for any $f' in Hom_(cat(D))(X',Y')$ (which is the codomain of $F_(X,Y)$), based on the natural isomorphism $epsilon$, we also have the following:
  #set align(center)
  #diagram($
             X' edge(->, script(f')) edge("d",<-, script((epsilon_(X'))^(-1)), #right) & Y' edge("d",<-, script((epsilon_(Y'))^(-1)), #left)\ 
             F compose G(X') edge(->, script((F compose G)f'), #right) & F compose G(Y')
          $)
  #set align(left)
  Hence, define $overline(epsilon)_(X',Y'):Hom_(cat(D))(F compose G(X'), F compose G(Y')) arrow.r Hom_(cat(D))(X',Y')$ by $(F compose G)f' mapsto (epsilon_(Y'))^(-1) compose ((F compose G)f') compose epsilon_(X') = f'$, it is an isomorphism. So, having the maps $G_(X',Y'):Hom_(cat(D))(X',Y') arrow.r Hom_(cat(C))(G(X'),G(Y'))$, $F_(G(X'),G(Y')):Hom_(cat(C))(G(X'),G(Y')) arrow.r Hom_(cat(D))(F compose G(X'), F compose G(Y'))$, the composition $overline(epsilon)_(X',Y') compose F_(G(X'),G(Y')) compose G_(X',Y'):Hom_(cat(D))(X',Y') arrow.r Hom_(cat(D))(X',Y')$ is in fact identity (since $f' mapsto overline(epsilon)(X', Y') ((F compose G)f') = f'$). So, with $overline(epsilon)_(X',Y')$ being an isomorphism, $F_(G(X'),G(Y')) compose G_(X',Y')$ is also an isomorphism, hence $F_(G(X'),G(Y'))$ is surjective.

  Finally, since $Hom_(cat(C))(G(X'),G(Y')) = Hom_(cat(C))(G compose F(X), G compose F(Y))$ is naturally isomorphic to $Hom_(cat(C))(X,Y)$ (via $eta$), then so is $Hom_(cat(D))(F compose G(X'), F compose G(Y'))$ and $Hom_(cat(D))(F(X),F(Y))$ (via $F$ applies to $eta$, since functors preserve isomorphisms). Hence, if $F_(G(X'),G(Y'))$ is surjective (which has codomain $Hom_(cat(D))(F compose G(X'), F compose G(Y'))$), via the natural isomorphism of $eta$, one can also conclude that $F_(X,Y)$ is also surjective (with codomain $Hom_(cat(D))(F(X),F(Y))$).

  \ 

  The last piece is essentially surjective: Given any $Y in cat(D)$, since we have $F compose G(Y) tilde.equiv Y$ (due to the fact that $epsilon:F compose G arrow.tilde Id_(cat(D))$), showing it's essentially surjective.
]

#pagebreak()

= ND (Split to Problem 6-12) (10,12 not done)//5
#problem[
  #definition(1)[
    Let $R$ be a commutative ring. If $S$ is any set, we denote by $L_R(S)$ the set of all finite linear combinations of elements in $S$ over $R$ -- that is, the set of formal sums $sum_(i)a_i dot s_i$ where $a_i in R$ and $s_i in S$, and $i$ runs through a finite set.
  ]
  Define a suitable abelian group structure on $L_R(S)$ and scaling of $R$ on $L_R(S)$. Show that $L_R(S)$ is a module over $R$.
][
  For this purpose, the element $0 in L_R(S)$ needs to first be defined: regardless of the set ${s_1,...,s_n} subset S$, the sume $sum_(i=1)^n 0 dot s_i$ will be defined to be the same, namely the $0 in L_R(S)$. Which, given any list ${s_1,...,s_n} subset S$, if $s_(n+1) in.not {s_1,...,s_n}$, define the expression $sum_(i=1)^(n)a_i dot s_i + 0 dot s_(n+1) = sum_(i=1)^n a_i dot s_i$.

  With the notion of $0$, given any two finite formal sums $sum_(i)a_i dot s_i, sum_(j) b_j dot s_j$, by adding suitable terms with coefficient $0$ to both expressions, WLOG one can say the two expressions are $sum_(i=1)^n a_i dot s_i$ and $sum_(i=1)^n b_i dot s_i$. Which, define the addition as follow:
  $ sum_(i=1)^n a_i dot s_i + sum_(i=1)^n b_i dot s_i := sum_(i=1)^n (a_i+b_i) dot s_i $
  where each $a_i+b_i in R$ uses the addition structure of $R$.

  Finally, for scalar multiplication, given any $r in R$ and $sum_(i) a_i dot s_i in L_R(S)$, define scaling of $r$ as follow:
  $ r dot (sum_(i)a_i dot s_i):= sum_i (r a_i) dot s_i $

  \ 

  To show that $L_R(S)$ forms a left $R$-Module structure, first it is evident that any $v in L_R(S)$ satisfies $v +0=v$ (since $0$ provides no extra components, and add nothing to the existing coefficients); also, addition is associative, since given $u,v,w in L_R(S)$ (WLOG, say $u=sum_(i=1)^n u_i dot s_i$, $v=sum_(i=1)^n v_i dot s_i$, and $w=sum_(i=1)^n w_i dot s_i$), then we have the following:
  $ (u+v)+w &= (sum_(i=1)^n u_i dot s_i+sum_(i=1)^n v_i dot s_i)+sum_(i=1)^n w_i dot s_i = sum_(i=1)^n (u_i+v_i) dot s_i+sum_(i=1)^n w_i dot s_i\ 
  &= sum_(i=1)^n (u_i+v_i+w_i) dot s_i = sum_(i=1)^n u_i dot s_i+(sum_(i=1)^n v_i dot s_i+sum_(i=1)^n w_i dot s_i)\ 
  &= u+(v+w) $
  Which proves the associativity.

  Now, about scalar multiplication, given any $v = sum_i a_i dot s_i in L_R(S)$, $0,1 in R$ satisfy the following:
  $ 0 dot v=0 dot (sum_i a_i dot s_i)=sum_i (0 dot a_i) dot s_i = 0 $
  $ 1 dot v= 1 dot (sum_i a_i dot s_i)=sum_i (1 dot a_i) dot s_i = v $  
  Finally, about distributivity, given any $r,t in R$ and $u,v in L_R(S)$ (say $u=sum_(i) u_i dot s_i$ and $v=sum_i v_i dot s_i$), the following two equations are true:
  $ (r+t) dot (u+v) &= (r+t) dot (sum_(i) u_i dot s_i +sum_i v_i dot s_i)\
  &= (r+t) dot sum_i (u_i+v_i) dot s_i = sum_i (r u_i+r v_i+t u_i+t v_i) dot s_i\ 
  &= sum_i (r u_i) dot s_i+sum_i (r v_i)dot s_i+sum_i (t u_i)dot s_i+sum_i (t v_i)dot s_i\ 
  &= r dot (sum_i u_i dot s_i)+r dot (sum_i v_i dot s_i)+t dot (sum_i u_i dot s_i)+t dot (sum_i v_i dot s_i)\ 
  &= r dot u+r dot v+t dot u+t dot v $
  $ (r t) dot v&= (r t) dot (sum_i u_i dot s_i) = sum_i(r t u_i) dot s_i  = r dot (sum_i (t u_i) dot s_i)\ 
  &= r dot (t dot (sum_i u_i dot s_i)) = r dot (t dot v) $
  Hence, $L_R(S)$ under such addition / multiplication structure forms a left $R$-module.
]

\ 

#problem[
  Suppose that $R=RR$ is the ring/field of real numbers and let $S=NN$ denote the set of natural numbers, what is the $RR$-vector space $L_RR (NN)$? Can you find a better way to write this vector space?
][
  The vector space $L_RR (NN)$ can also be characterized as the direct sum $plus.circle.big_(n in NN)RR$ (since there are countable generators, defined with finite sums, and in between any two generators there is no relations).

  Another way of characterizing it can be thought as follow: Consider the set of functions $F={f:NN arrow.r RR | f(n)!=0 "for finite "n in NN}$, which because the codomain is $RR$ (which has a natural addition / scalar multiplication structure on itself)m then this automaticaly forms $F$ into an $RR$-vector space.

  Now, for each $n in NN$, let $e_n:NN arrow.r RR$ denotes the function satisfying $e_n(m) = delta_(n m)$ (the kronecker delta). Then, notice that for each function $f in F$, if $n_1,...,n_k in NN$ are the only natural numbers being evaluated to have nonzero ouput, then $f = sum_(i=1)^k f(n_i) dot e_(n_i)$:
  $ m in.not {n_1,...,n_k}==> (sum_(i=1)^k f(n_i) dot e_(n_i))(m) = 0 $
  $ forall j in {1,...,k}, quad (sum_(i=1)^k f(n_i) dot e_(n_i))(n_j) = sum_(i=1)^k f(n_i) dot delta_(n_i n_j) = f(n_j) dot 1=f(n_j) $
  Hence, $f = sum_(i=1)^k f(n_i) dot e_(n_i)$, showing the list ${e_n}_(n in NN)$ in fact generates $F$.

  Also, it is evident that each $e_n$ has no relation with each other (which can be shown through linear independence): Given any list $e_(n_1),...,e_(n_k)$, suppose $a_1,...,a_k in RR$ satisfies $sum_(i=1)^k a_i dot e_(n_i)=0$, then for each $j in {1,...,k}$, the following is true:
  $ 0=(sum_(i=1)^k a_i dot e_(n_i))(n_j) = sum_(i=1)^k a_i dot delta_(n_i n_j) = a_j dot 1 = a_j $
  Hence, each $a_j=0$, showing that the list is linearly independent. This shows that ${e_n}_(n in NN)$ forms a basis of the vector space $F$ (which they're linearly independent, and their finite $RR$-linear combinations generate the whole $F$). So, this is another way of identifying $L_RR (NN)$.
]

\ 

#problem[
  #definition(2)[
    Consider the module $L_R (M times N)$ and define a submodule $L' subset L_R (M times N)$ generated by all elements of the following form:
    - $r(x,y)-(r x,y)$
    - $r(x,y) - (x,r y)$
    - $(x_1+x_2,y) - ((x_1,y)+(x_2,y))$
    - $(x,y_1+y_2) - ((x,y_1)+(x,y_2))$
    where $r in R$, $x,x_1,x_2 in M$, and $y,y_1,y_2 in N$. We then define the quotient module 
    $ M times.circle_R N := L_R (M times N)\/ L' $ 
    and call it the tensor product of $M$ and $N$.
  ]
  #definition(3)[
    If $P$ is another $R$-module, a bilinear map is a map $B:M times N arrow.r P$ that is linear with respect to both entries -- that is, for all $x_0 in M$ the map $B(x_0,\_):N arrow.r P$ is linear and for all $y_0 in N$ the map $B(\_,y_0):M arrow.r P$ is linear.
  ]

  Construct a natural bilinear map $pi:M times N arrow.r M times.circle_R N$ and show that it is universal in the following sense: for any bilinear map $B:M times N arrow.r P$, there is a unique #emph[linear] map $h:M times.circle_R N arrow.r P$ such that $B = h compose pi$. Conclude that for any $R$-module $P$, we have a canonical identification 
  $ Hom_R (M times_R N, P) tilde.equiv Bil(M times N, P) $
  between the set of $R$-module homomorphisms from $M times.circle_R N$ to $P$, and the set of bilinear maps from $M times N$ to $P$.
][

  #text(weight: "bold")[I. The Bilinear ap $pi$:]

  For simplicity, given any $m in M$ and $n in N$, we'll denote $m times.circle n := overline((m,n)) in M times.circle_R N = L_R (M times N)\/L'$ (the quotient of $(m,n)$ in $M times.circle_R N$). Then, given the relation of $L'$, we get the following relation:
  - $r (x times.circle y) = (r x) times.circle y$, and $r (x times.circle y)= x times.circle (r y)$.
  - $(x_1+x_2) times.circle y = x_1 times.circle y+ x_2 times.circle y$.
  - $x times.circle (y_1+y_2)=x times.circle y_1+x times.circle y_2$.
  Where $r in R$, $x,x_1,x_2 in M$ and $y,y_1,y_2 in N$.

  Hence, define the map $pi:M times N arrow.r M times.circle_R N$ by $pi(m,n) = m times.circle n$, this map is well-defined (since each $(m,n) in M times N$ corresponds to a unique representative in $M times.circle_R N:=L_R (M times N)\/L'$). Then, by the property of tensor products, one gets the following for any $r,t in R$, $m,m_1,m_2 in M$, and $n,n_1,n_2 in N$:
  $ pi(r m_1+t m_2,n) &= (r m_1 + t m_2) times.circle n = (r m_1) times.circle n+(t m_2) times.circle n\  
  &= r (m_1 times.circle n)+t (m_2 times.circle n) = r dot pi(m_1,n)+t dot pi(m_2,n) $
  $ pi(m,r n_1+t n_2)&=m times.circle (r n_1+t n_2)= m times.circle (r n_1)+m times.circle (t n_2)\ 
  &= r(m times.circle n_1)+t(m times.circle n_2)=r dot pi(m,n_1)+t dot pi(m,n_2) $
  The above two equations show that $pi$ is naturally bilinear.

  \ 

  #text(weight: "bold")[II. Universal Property of $pi$:]

  Given any $R$-module $P$ together with a bilinear map $B:M times N arrow.r P$, suppose for the moment that there exists an $R$-linear map $h:M times.circle_R N arrow.r P$ satisfies $B = h compose pi$, then for all $m in M$ and $n in N$, we have the following:
  $ B(m,n)=h compose pi(m,n)=h(m times.circle n) $
  Now, notice that since $L_R (M times N)$ is generated by finite formal linear combination of $(m,n) in M times N$, then $M times.circle_R N = L_R(M times N)\/L'$ is instead generated by finite linear combination of the quotient $overline((m,n)) = m times.circle n$. Then, since $h$ above must satisfy $h(m times.circle n) = B(m,n)$, then $h$ fixes where the generators of $M times.circle_R N$ goes, hence fixes the whole $R$-linear map $h$. This implies that $h$ is uniquely determined by $B$.
  
  Then, to show that $h$ exists, it suffices to show that it's well-defined on the generators (since the definition of being an $R$-linear map automatically extends it to be well-defined on any finite $R$-linear combinations of $m times.circle n in M times.circle_R N$). To show that any possible representatives eventually gets send to the same element via $h$, consider any $a,b,c,d in R$, $m_1,m_2 in M$, and $n_1,n_2 in N$. Which, the following is true:
  $ B(a m_1+b m_2,c n_1+d n_2) =& (a c) dot B(m_1,n_1)+(a d) dot B(m_1,n_2)\ 
    &+(b c) dot B(m_2,n_1)+(b d) dot B(m_2,n_2) $
  The above is based on the bilinearity of $B$. Which, notice that on the tensor product level, the following is true:
  $ (a m_1+b m_2) times.circle (c n_1+d n_2) =& (a c) dot (m_1 times.circle n_1)+(a d) dot (m_1 times.circle n_2)\ 
    &+(b c) dot (m_2 times.circle n_1)+(b d) dot (m_2 times.circle n_2) $
  Hence, this shows the following: 
  $ h((a m_1+b m_2) times.circle (c n_1+d n_2)) =& B(a m_1+b m_2,c n_1+d n_2)\ 
  =& (a c) dot B(m_1,n_1)+(a d) dot B(m_1,n_2)\ 
    &+(b c) dot B(m_2,n_1)+(b d) dot B(m_2,n_2)\ \ 
  =& (a c) dot h(m_1 times.circle n_1)+(a d) dot h(m_1 times.circle n_2)\ 
    &+(b c) dot h(m_2 times.circle n_1)+(b d) dot h(m_2 times.circle n_2)\ \ 
    =& h((a c) dot (m_1 times.circle n_1)+(a d) dot (m_1 times.circle n_2)\ 
    &+(b c) dot (m_2 times.circle n_1)+(b d) dot (m_2 times.circle n_2)) $
  Which, it implies that the definition $h(m times.circle n)= B(m,n)$ (together with $h$ being an $R$-linear map) is well-defined (since under different representatives of the same element, $h$ still acts the same). Hence, as an $R$-linear map $h:M times.circle_R N arrow.r P$ by $h(m times.circle n) = B(m,n)$ is well-defined.

  This finishes the proof about the unversal property, that every bilinear map $B:M times N arrow.r P$ admits a unique $R$-linear map $h:M times.circle_R N arrow.r P$ with $B=h compose pi$.

  \ 

  #text(weight: "bold")[III. Isomorphism between $Hom_R (M times.circle_R N, P)$ and $Bil(M times N, P)$:]

  First, notice that linear combinations of $R$-linear maps (respectively, $R$-Bilinear maps) are still $R$-linear map (respectively, $R$-Bilinear map). Hence, $Hom_R (M times.circle_R N, P), Bil(M times N,P) $ are both $R$-modules also.

  Now, notice that the map $\_ compose pi:Hom_R (M times.circle_R N,P) arrow.r Bil(M times N,P)$ is a module homomorphism:
  - First, given any $R$-linear map $h:M times.circle_R N arrow.r P$, we have the following for any $r,t in R$, $m,m_1,m_2 in M$, and $n,n_1,n_2 in N$:
  $ h compose pi(r m_1+t m_2,n)&=h((r m_1+t m_2) times.circle n)=h(r(m_1 times.circle n)+t (m_2 times.circle n))\ 
  &= r dot h(m_1 times.circle n)+t dot h(m_2 times.circle n)\ 
  &= r dot h compose pi(m_1,n)+t dot h compose pi(m_2,n) $
  $ h compose pi(m,r n_1+t n_2)&=h(m times.circle (r n_1+t n_2))=h(r(m times.circle n_1)+t (m times.circle n_2))\ 
  &= r dot h(m times.circle n_1)+t dot h(m times.circle n_2)\ 
  &= r dot h compose pi(m,n_1)+t dot h compose pi(m,n_2) $
  The two equalities show that $h compose pi$ is a bilinear map, henc $h compose pi in Bil(M times N, P)$, the map $\_ compose pi$ is well-defined.

  The reason it's an $R$-linear map, is because given any $f,g in Hom_R (M times.circle N,P)$, $a,b in R$, and any $m in M$ and $n in N$, the following is true:
  $ (a dot f+b dot g) compose pi(m,n) &= (a dot f+b dot g)(m times.circle n)\  
  &= a dot f(m times.circle n)+ b dot g(m times.circle n)\ 
  &= a dot f compose pi(m,n)+b dot g compose pi(m,n) $
  Hence, $(a dot f+b dot g) compose pi=a dot (f compose pi)+b dot (g compose pi)$, showing $\_ compose pi$ is an $R$-linear map.

  Finally, it's a bijection, because for any bilinear map $B in Bil(M times N, P)$, the universal property states there exists $h in Hom_R (M times.circle N_R, P)$ such that $B=h compose pi$, showing $\_ compose pi$ is surjective; and, it's injective is because if $h,h' in Hom_R (M times.circle_R N, P)$ satisfies $B=h compose pi=h' compose pi in Bil(M times N,P)$, since both $h,h'$ satisfies $B=h compose pi=h' compose pi$, the universal property again states $h=h'$, hence $\_ compose pi$ is injective.

  So, this identifies that $Hom_R(M times.circle_R N,P) tilde.equiv Bil(M times N,P)$.
]

#pagebreak()

#problem[
  Is $M times.circle_R N$ the categorical pushout of $M$ and $N$ in the category $RMod$ of $R$-modules? If so, prove it. If not, what is the pushout of $M$ and $N$?
][
  We'll first construct the pushout (or coproduct) of any $R$-module $M$ and $N$, and show that in general it's different from $M times.circle_R N$ by providing a counterexample.

  \ 

  #text(weight: "bold")[I. Coproduct in $RMod$:]

  Given arbitrary $R$-modules $M,N$, consider the direct sum $M plus.circle N$ together with the two canonical injection $iota_1:M arrow.r M plus.circle N$ and $iota_2:N arrow.r M plus.circle N$. It is evident that it satisfies the first property of coproduct (which are two maps from $M,N$ respectively into the $R$-module). 
  
  Then, to show its universality, given any other $R$-module $P$ together with two maps $h_1:M arrow.r P$ and $h_2:N arrow.r P$, the map $h:M plus.circle N arrow.r P$ by $h(m,n) = h_1(m)+h_2(n)$ satisfies the following:
  - First,  given any $(m,n), (m',n') in M plus.circle N$,  and $a,b in R$, the following is true:
    $ h(a(m,n)+b(m',n')) &= h(a m+b m', a n+b n')=h_1(a m+b m')+h_2(a n+b_n')\ 
    &= a h_1(m) + b h_1(m')+a h_2(n)+b h_2(n')\ 
    &= a(h_1(m)+h_2(n))+b(h_1(m')+h_2(n'))\ 
    &= a dot h(m,n)+b dot h(m',n') $
    Hence, $h$ is a Module homomorphism.

  - For any $m in M$ and $n in N$, we have the following two equality:
    $ h compose iota_1(m) = h(m,0) = h_1(m)+h_2(0)=h_1(m) $
    $ h compose iota_2(n)=h(0,n)+h_1(0)+h_2(n)=h_2(n) $
    Hence, $h compose iota_1 = h_1$ and $h compose iota_2 = h_2$.

  - $h$ is the unique morphism with such property: Suppose given $h':M plus.circle N arrow.r P$ also satisfies such property, then we must have $h' compose iota_1=h_1$ and $h' compose iota_2 = h_2$. Then, for all $m in M$ and $n in N$, we must have $h_1(m)=h' compose iota_1(m)=h'(m,0)$, and $h_2(n)=h' compose iota_2(n)=h'(0,n)$. So, $h'(m,n) = h'(m,0)+h'(0,n)=h_1(m)+h_2(n)$, showing that $h'=h$.

  These conditions show that $M plus.circle N$ together with the two canonical injections $iota_1:M arrow.r M plus.circle N$ and $iota_2:N arrow.r M plus.circle N$, is initial with such property. Meaning given the pair $(P, h_1:M arrow.r P, h_2:N arrow.r P)$, there exists unique $h:M plus.circle N arrow.r P$, such that the following diagram commutes:
  #set align(center)
  #diagram($
             M edge(->, script(iota_1)) edge("dr", ->, script(h_1), #right) & M plus.circle N edge("d", "..>", script(exists ! h)) & N edge("l", ->, script(iota_2)) edge("dl", ->, script(h_2), #left) \ 
             & P
          $)
  #set align(left)
  Hence, $M plus.circle N$ with conanical injection $iota_1, iota_2$ forms the coproduct of $M,N$ in $RMod$.

  \ 

  #text(weight: "bold")[II. Counterexample to $M times.circle_R N$ being Pushout/Coproduct:]

  Here's a simple one: Consider $0 times.circle_ZZ ZZ$, since everything is in the form $0 times.circle n$ for some $n in ZZ$; then by the property of tensor product, $2 dot (0 times.circle n)=(n dot 0) times.circle n = 0 times.circle n$, hence $0 times.circle n = 0$, or $0 times.circle_ZZ ZZ = 0$. However, the actual coproduct is $0 plus.circle ZZ tilde.equiv ZZ != 0$, showing that $0 times.circle_ZZ ZZ$ is actually not a coproduct in $ZZ$-$Mod$.
]

#pagebreak()

#problem[
  Given $A,B$ two commutative rings with ring homomorphisms $R arrow.r A$ and $R arrow.r B$, this makes $A,B$ into $R$-modules. Let $A times.circle_R B$ denote the tensor product of $A$ and $B$ as $R$-modules.

  In this setup, show that $A times.circle_R B$ is again a (commutative) $R$-algebra.
][
  Here, assume we know that tensor product (of multiple $R$-modules) is associative (up to isomorphism), and the property that any multilinear map uniquely factors through tensor products. Then, since $A,B$ both have their own ring structure, then consider the following $R$-multilinear map $Q:A times B times A times B arrow.r A times.circle_R B$:
  $ Q(a,b,a',b') = (a a') times.circle (b b') $
  This is multilinear, because both ring multiplication and tensor products are bilinaer. Then, the property of tensor product implies that it unique factors through $(A times.circle_R B) times.circle_R (A times.circle_R B)$, say through an $R$-linear map $overline(Q):(A times.circle_R B) times.circle_R (A times.circle_R B) arrow.r A times.circle_R B$ as follow:
  $ overline(Q)((a times.circle b) times.circle (a' times.circle b')) = (a a') times.circle (b b') $
  Also, if we consider the bilinear projection $pi:(A times.circle_R B) times (A times.circle_R B) arrow.r (A times.circle_R B) times.circle_R (A times.circle_R B)$ by $pi(a times.circle b, a' times.circle b') = (a times.circle b) times.circle (a' times.circle b')$, then the bilinear map $M = overline(Q) compose pi: (A times.circle_R B) times (A times.circle_R B) arrow.r A times.circle_R B$ as follow:
  $ M(a times.circle b, a' times.circle b') = overline(Q)((a times.circle b) times.circle (a' times.circle b')) = (a a') times.circle (b b') $
  Which, $M$ (as an $R$-bilinear map) can also be viewed as a multiplication on $A times.circle_R B$, since it satisfies associativity as follow:
  $ M(a times.circle b, M(a' times.circle b', a'' times.circle b'')) &= M(a times.circle b, (a' a'') times.circle (b' b'')) = (a (a' a'')) times.circle (b (b' b''))\ 
  &= ((a a') a'') times.circle ((b b') b'') = M((a a') times.circle (b b'), a'' times.circle b'')\ 
  &= M(M(a times.circle b, a' times.circle b'), a'' times.circle b'') $
  Also, distributivity naturally follows from the fact that $M$ is bilinear. Hence, this makes $A times.circle_R B$ into an $R$-algebra, with multiplication $M$.
  /*
  Let $m_A:R arrow.r A$ and $m_B:R arrow.r B$ be the two ring homomorphisms. Then, $A$ can be viewed as an $R$-module, such that for any $r in R$ and $a in A$, one has $r dot a := m_A (r) a$ (similar definition for making $B$ into an $R$-module). So, given any $r in R$, $a in A$ and $b in B$, the property is given as follow:
  $ (m_A (r) a) times.circle b = (r dot a) times.circle b = r dot (a times.circle b) = a times.circle (r dot b)=a times.circle (m_B (r) b) $
  Hence, if view $R$ itself as an $R$-module generated by $1 in R$, the map $phi:R arrow.r A times.circle_R B$ by $phi(1) = 1_A times.circle 1_B$ is a well-defined $R$-module homomorphism. As a result, for all $r, r' in R$, one has the following: 
  $ phi(r dot r') = (m_A (r) dot m_A (r')) times.circle 1_B = 1_A times.circle (m_B (r) dot m_B (r')) $
  Which, if desire to make $phi$ into a ring homomorphism also, we aim to define multiplication on $A times.circle_R B$ so that $phi(r dot r') = phi(r) dot phi(r')$. Hence, it suggests the following:
  $ (m_A (r) times.circle 1_B) dot (m_A (r') times.circle 1_B) = phi(r) dot phi(r') = phi(r r') = (m_A (r) dot m_A (r')) times.circle 1_B $
  $ (1_A times.circle m_B (r)) dot (1_A times.circle m_B (r')) = phi(r) dot phi(r') = phi(r r')=1_A times.circle (m_B (r) dot m_B (r')) $
  Which, if put in products with more than $2$ elements (and arrange them in different entries of the tensor product), one of the most natural guess for multiplication is given by: 
  $ (a times.circle b) dot (a' times.circle b'):= (a a') times.circle (b b') $
  */
]

\ 

#problem[
  Prove that $A times.circle_R B$ is the pushout (coproduct) of $A$ and $B$ in the category $RAlg$ of $R$-algebras.
][
  First, it's clear that given $A times.circle_R B$, there are natural $R$-algebra homomorphisms $i_1:A arrow.r A times.circle_R B$ and $i_2:B arrow.r A times.circle_R B$ by $i_1 (a) = a times.circle 1$ and $i_2 (b)=1 times.circle b$ (which since $i_1( r dot a) = (m_A (r) a) times.circle 1 = r dot (a times.circle 1) = r dot i_1 (a)$, it's an $R$-module homomorphism together with the additive property; also, we have $i_1 (a a') = (a a') times.circle 1 = (a times.circle 1)(a' times.circle 1)=i_1 (a) dot i_1 (a')$, which is also an $R$-algebra homomorphism. Similar logic applies to $i_2$).

  \ 

  Now, given any other $R$-algebra $C$, and suppose two $R$-algebra homomorphisms $f:A arrow.r C$ and $g:B arrow.r C$ are given. Then, if we consider the map $B:A times B arrow.r C$ by $B(a,b) = f(a)g(b)$, notice that this map is $R$-bilinear. Given any $r,t in R$, $a,a' in A$, and $b,b' in B$, we have the following:
  $ B(r dot a+t dot a', b) &= f(r dot a+t dot a')g(b) = (r dot f(a)+t dot f(a')) g(b)\  
  &= r dot (f(a)g(b))+t dot (f(a')g(b)) = r dot B(a,b)+t dot B(a',b) $
  $ B(a, r dot b+t dot b')&=f(a) g(r dot b+t dot b')=f(a) (r dot g(b)+t dot g(b'))\ 
  &= r dot (f(a)g(b)) + t dot (f(a) g(b')) = r dot B(a,b)+t dot B(a,b') $
  This shows that $B$ is $R$-bilinear, hence it uniquely factors through the tensor product, say by the $R$-module homomorphism $h:A times.circle_R B arrow.r C$ by $h(a times.circle b) = f(a)g(b)$.

  However, this also turns $h$ into a ring homomorphism, since we have the following:
  $ h((a times.circle b) dot (a' times.circle b')) &= h((a a') times.circle (b b')) = f(a a')g(b b') = f(a)f(a')g(b)g(b')\ 
  &= (f(a)g(b)) dot (f(a')g(b')) = h(a times.circle b) dot h(a' times.circle b') $
  Since it's both an $R$-module homomorphism and a commutative ring homomorphism, $h$ is in fact an $R$-algebra homomorphism. And, it satisfies the following, for all $a in A$ and $b in B$:
  $ f(a)=f(a)g(1)=h(a times.circle 1) = h compose i_1 (a) $
  $ g(b)=f(1)g(b)=h(1 times.circle b)=h compose i_2 (b) $
  Hence, $f = h compose i_1$ and $g=h compose i_2$.

  \ 

  Finally, to show uniqueness of such map $h$, suppose some $R$-algebra homomorphism $h':A times.circle_R B arrow.r C$ satisfies $f = h' compose i_1$ and $g = h' compose i_2$ also, then for all $a in A$ and $b in B$, we have the following:
  $ h'(a times.circle b) &= h'((a times.circle 1)(1 times.circle b)) = h'(a times.circle 1) dot h' (1 times.circle b)\ 
  &= (h' compose i_1 (a)) dot (h' compose i_2 (b)) = f(a) g(b) = h(a times.circle b) $
  This shows that $h' = h$, proving the uniqueness. Hence, $A times.circle_R B$, $i_1:A arrow.r A times.circle_R B$, and $i_2:B arrow.r A times.circle_R B$ satisfies the following commutative diagram (given some other $R$-algebra $C$ with $f:A arrow.r C$ and $g:B arrow.r C$ being $R$-algebra homomorphisms):
  #set align(center)
  #diagram($
             A edge(->, script(i_1)) edge("dr", ->, script(f), #right) & A times.circle_R B edge("d", "..>", script(exists ! h)) & B edge("l", ->, script(i_2)) edge("dl", ->, script(g), #left) \ 
             & C
          $)
  #set align(left)
  So, $A times.circle_R B$ serves as a coproduct in $RAlg$, category of commutative $R$-algebra.
]

\ 

#problem[
  Compute the following tensor products:
  - $k[x] times.circle_k k[x]$.
  - $k[x] times.circle_(k[x]) k[x]$ where both $k[x]$ are biewed as $k[x]$-algebras via the identity map.
  - $k[x] times.circle_(k[x])k[y]$, where $k[x]$ is a $k[x]$-algebra via the identity map and $k[y]$ is viewed as a $k[x]$-algebra via the map $k[x] arrow.r k[y]$ sending $x mapsto y^2$.
  - $k[y] times.circle_(k[x]) k[y]$, where $k[y]$ is viewed as a $k[x]$-algebra via the map $k[x] arrow.r k[y]$ sending $x mapsto y^2$.
][
  1. For any $k$-algebra $A$, given any two $k$-algebra homomorphism $f,g:k[x] arrow.r A$, since one must have $f(l) = l dot f(1)= l dot 1 in A$ (so is $g(l) = l dot g(1)= l dot 1 in A$) for all $l in k$. Hence, knowing $f(x)$ and $g(x)$ uniquely determines the whole map $f,g$.

    For simplicity, the second map we'll use $y$ instead of $x$, or $g:k[y] arrow.r A$ to prevent confusion. Then, notice that given the polynomial ring $k[x,y]$, $f$ and $g$ uniquely determins a ring homomorphism $h:k[x,y] arrow.r A$ by $h(x)=f(x)$ and $h(y)=g(y)$. Such map is well-defined, since $A$ is commutative, and the fact that $f(l) = g(l)$ for all $l in k$ (so for everything inside $k$, where $k[x]$ and $k[y]$ intersects, $h$ is a well-defined map). Also, $h$ is a ring homomorphism because $A$ is commutative, while $f,g$ are both ring homomorphism (so act on individual components of any polynomial in $k[x,y]$ makes sense).

    Now, if consider the canonical inclusion $iota_x:k[x] arrow.r.hook k[x,y]$ and $iota_y:k[y] arrow.r.hook k[x,y]$, one has the following:
    $ f(p(x)) = f(p(x)) dot g(1) = h(p(x) dot 1) = h(iota_x (p(x))) $
    $ g(q(y)) = f(1) dot g(q(y)) = h(1 dot q(y)) = h(iota_y (q(y))) $
    Hence, $f = h compose iota_x$ and $g = h compose iota_y$, so the following diagram commutes:
    #set align(center)
    #diagram($
              k[x] edge(->, script(iota_x)) edge("dr", ->, script(f), #right) & k[x,y] edge("d", "->", script(h)) & k[y] edge("l", ->, script(iota_y)) edge("dl", ->, script(g), #left) \ 
              & A
            $)
    #set align(left)
    Also, notice the map $h$ is unique, since if $h':k[x,y] arrow.r A$ as a $k$-algebra homomorphism also satisfies the above properties, then $h'(x) = h' compose iota_x(x) = f(x)$ and $h'(y) = h' compose iota_y(y) = g(y)$. This shows that $h'(x)=h(x)$ and $h'(y)=h(y)$, hence $h'=h$ (since they're the same on the generators, while must agree on $k$ due to the property of $k$-algebra homomorphism). Hence, $k[x,y]$ with $iota_x, iota_y$ is indeed a coproduct of $k[x], k[y]$ in the category of commutative $k$-algebra, showing that $k[x,y] tilde.equiv k[x] times.circle_k k[y]$ (here, if view $y$ as $x$ again, it's $k[x] times.circle_k k[x]$).

    \ 

    \ 

  2. For this, we'll prove a following lemma:
    #lemma[
      Given any commutative ring $R$, any $R$-module $M$ satisfies $M tilde.equiv R times.circle_R M$. This in particular is true for commutative $R$-algebra also.
    ][
      For any element in $R times.circle_R M$ is a finite linear combination of $r times.circle m$, where $r in R$ and $m in M$. Using the property of tensor product, $r times.circle m = 1 times.circle (r dot m)$. 
      
      Hence, define the $R$-module homomorphism $phi:M arrow.r R times.circle_R M$ by $phi(m) = 1 times.circle m$ (can also be thought of as the bilinear projection map $pi:R times M arrow.r R times.circle_R M$ by restricting the first entry to be $1$). On the other hand, if consider the scalar multiplication map $s:R times M arrow.r M$ by $s(r, m) = r dot m$, $s$ is also a bilinear map, hence it uniquely factors through the tensor product, say having $R$-module homomorphism $overline(s):R times.circle_R M arrow.r M$ by $s = overline(s) compose pi$ (so we have $overline(s)(r times.circle m) = overline(s) compose pi(r,m) = s(r,m) = r dot m$).

      Notice that $phi$ and $overline(s)$ are mutual inverse: Given any $r in R$ and $m in M$, the following are true:
      $ overline(s) compose phi(m) = overline(s)(1 times.circle m) = s(1, m) =1 dot m=m $
      $ phi compose overline(s)(r times.circle m) = phi(r dot m) = 1 times.circle (r dot m) = r times.circle m $
      Hence, this shows that $M tilde.equiv R times.circle_R M$ as $R$-modules.
    ]
    As a result of the lemma, since $k[x]$ is a $k[x]$-module (with natural left multiplication on itself), then $k[x] times.circle_(k[x]) k[x] tilde.equiv k[x]$ as $k[x]$-modules (via the map $overline(s):k[x] times.circle_(k[x]) k[x] arrow.r k[x]$ that's defined as $f(x) times.circle g(x) mapsto f(x) dot g(x)$).

    However, notice that this is also multaplicative, since the following is true:
    $ overline(s)((f(x) times.circle g(x)) dot (h(x) times.circle k(x))) &= overline(s)((f dot h)(x) times.circle (g dot k)(x))\ 
    &= (f dot h dot g dot k)(x) = (f dot g)(x) dot (h dot k)(x)\ 
    &= overline(s)(f(x) times.circle g(x)) dot overline(s)(h(x) times.circle k(x)) $
    Hence, the two are actually isomorphic as rings, which is isomorphic as $k[x]$-algebras. 

    So, $k[x] times.circle_(k[x]) k[x] tilde.equiv k[x]$. 

    \ 

    \ 

  3. Similar in this case, using the previous lemma we know $k[x] times.circle_(k[x]) k[y] tilde.equiv k[y]$ via the map $overline(s)(f(x) times.circle g(y)) = f(x) dot g(y) = f(y^2) g(y)$ (Note: Since $k[y]$ is now a $k[x]$-algebra via the map $x mapsto y^2$, so $f(x) dot g(y) = f(y^2)g(y)$). This is also true on the level of $k[x]$-algebra homomorphism, since the following is true:
    $ overline(s)((f(x) times.circle g(y)) dot (h(x) times.circle k(y))) &= overline(s)((f dot h)(x) times.circle (g dot k)(y))\ 
    &= (f dot h)(y^2) (g dot k)(y) = (f(y^2) g(y)) dot (h(y^2) k(y))\ 
    &= overline(s)(f(x) times.circle g(y)) dot overline(s)(h(x) times.circle k(y)) $
    So, $k[x] times.circle_(k[x]) k[y] tilde.equiv k[y]$ as $k[x]$-algebra also. 
    
    Now, notice that if we consider the ring homomorphism $phi:k[x,y] arrow.r k[y]$ by $phi(f(x,y)) = f(y^2,y)$, this is surjective (since for any $f(y) in k[y] subset k[x,y]$, it has $phi(f)= f(y)$), so $k[y] tilde.equiv k[x,y]\/ker(phi)$. Which, given the polynomial $y^2-x$, we have $phi(y^2-x) = y^2-y^2=0$, so $y^2-x in ker(phi)$. 
    
    Also, if consider any $f(x,y) in ker(phi)$ (i.e. $f(y^2,y)=0$), to prove that $f(x,y) in (y^2-x)$, we'll induct on the degree of $x$:
    - For $deg_(x)(f) = 1$, since $f(x,y) = f_1(y) dot x+f_0(y)$ for some $f_1,f_0 in k[y]$, then $0=phi(f) = f_1(y) dot y^2 + f_0(y)$. If $f_1(y)!=0$, then it has degree at least $2$, so in case for the whole thing to be $0$, $f_0(y)$ cannot have degree $0$ and degree $1$ terms (since these two terms only appear in $f_0(y)$). 
    
      Hence, $f_0(y) = y^2 dot g_0(y)$ for some $g_0 in k[y]$. So, $f_1(y) dot y^2+g_0(y) dot y^2 = f_1(y) dot y^2+f_0(y)=0$, showing that $y^2(f_1(y) + g_0(y))=0$. With $k[y]$ being an integral domain, $f_1(y)+g_0(y)=0$, so $f_1(y)=-g_0(y)$, showing the following:
      $ f(x,y) = f_1(y) dot x+f_0(y) = -g_0(y) dot x + g_0(y) dot y^2 = g_0(y) dot (y^2-x) $
      Hence, $f(x,y) in (y^2-x)$.

    - Now, suppose for degree $deg_x (f)=k < n$, we always have $f(x,y) in ker(phi) ==> f(x,y) in (y^2-x)$. Then, if $deg_x (f) = n$, we again decompose $f(x,y) = f_1(x,y) dot x+f_0(y)$, where $deg_x (f_1) = n-1<n$. Then, do the following modification, we get:
      $ f(x,y) = f_1(x,y) dot x+f_0(y) = f_1(x,y) dot (x-y^2) + f_1(x,y) dot y^2+f_0(y) $
      Now, it's evident that $f_1(x,y) dot (x-y^2) in (y^2-x)$ (since it has a factor); also, if consider $g(x,y) = f_1(x,y) dot y^2+f_0(y)$, since $f_1(x,y)$ is the only component including $x$, then $deg_x (h) = deg_x (f_1) = n-1 < n$. Then, since $h in ker(phi)$ (since $h(x,y) = f(x,y) - f_1(x,y)(x-y^2)$, which are both in $ker(phi)$), and $deg_x (h)<n$, by induction hypothesis one must have $h in (y^2-x)$ also.

      Hence, $f(x,y) = f_1(x,y)dot (x-y^2)+h(x,y) in (y^2-x)$. This completes the induction.

    So, eventually we get that $f(x,y) in ker(phi) ==> f(x,y) in (y^2-x)$, showing $ker(phi) subset.eq (y^2-x)$. Hence, $ker(phi) = (y^2-x)$, which we concluded the following: 
    $ k[x] times.circle_(k[x]) k[y] tilde.equiv k[y] tilde.equiv k[x,y]\/ker(phi) = k[x,y]\/(y^2-x) $

    \ 

    \ 

  4. For $k[y] times.circle_(k[x]) k[y]$ (where $k[y]$ is given in the previous part), for less confusion the second one we'll denote as $k[z]$ as $k[x]$-algebra (by the map $k[x] arrow.r k[z]$ through $x mapsto z^2$). Since $k[x,y] := (k[x])[y]$ satisfies $(k[x])[y] times.circle_(k[x])(k[x])[z] tilde.equiv (k[x])[y,z]$ (based on part 1), in $k[x]$-algebra, we have the coproduct of $k[x,y]$ and $k[x,z]$ being $k[x,y,z]$. 
  
    Now, based on part 3, we know that $k[y] tilde.equiv k[x,y]\/(y^2-x)$ and $k[w]tilde.equiv k[x,w]\/(w^2-x)$. So, based on the property of tensor product (as coproduct in $k[x]$-algebra), with the following maps: 
    - inclusion map $i_1:k[x,y] arrow.r.hook k[x,y,z]$, $i_2:k[x,z] arrow.r.hook k[x,y,z]$;
    - quotient map $pi_1:k[x,y] arrow.r.twohead k[x,y]\/(y^2-x)$, $pi_2:k[x,z] arrow.r.twohead k[x,y]\/(z^2-x)$;
    - injection to tensor product $iota_1:k[x,y]\/(y^2-x) arrow.r k[y] times.circle_(k[x])k[z]$ and $iota_2:k[x,z]\/(z^2-x) arrow.r k[y] times.circle_(k[x])k[z]$, 
    
    we get the following commutative diagram:
    #set align(center)
    #diagram($
              k[x,y] edge(->, script(i_1)) edge("d", ->, script(pi_1), #right) & k[x,y,z] edge("dd", "..>", script(exists ! h)) & k[x,z] edge("l",->, script(i_2)) edge("d", ->, script(pi_2), #left)\ 
              k[x,y]\/(y^2-x) edge("dr", ->, script(iota_1), #right) & & k[x,z]\/(z^2-x) edge("dl", ->, script(iota_2), #left)\ 
              & k[y] times.circle_(k[x]) k[z]
            $)
    #set align(left)
    Notice that $h$ is automatically surjective (since the generators of $k[y] times.circle_(k[x])k[z]$ are $f times.circle 1$ and $1 times.circle g$ in $k[y] times.circle_(k[x])k[z]$, and such surjectivity onto the generators are given by $pi_1$ and $pi_2$), hence we have $k[y] times.circle_(k[x]) k[z] tilde.equiv k[x,y,z]\/ker(h)$.

    Now, notice that 
]

#pagebreak()

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