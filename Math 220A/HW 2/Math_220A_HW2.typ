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

#pagebreak()

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