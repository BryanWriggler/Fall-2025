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

= ND (Split to Problem 6-12) (12 not done)//5
 
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
    Notice that $h$ is automatically surjective (since the generators of $k[y] times.circle_(k[x])k[z]$ are $f times.circle 1$ and $1 times.circle g$ in $k[y] times.circle_(k[x])k[z]$, and such surjectivity onto the generators are given by $pi_1$ and $pi_2$), hence we have $k[y] times.circle_(k[x]) k[z] tilde.equiv k[x,y,z]\/ker$. 
]

#pagebreak()


= D//6
#problem[
  Prove that left adjoint preserves colimit. 
][
  Given a functor $F:cat(C) arrow.r cat(D)$, and say that $F$ is a left adjoint of functor $G:cat(D) arrow.r cat(C)$. Let's say a diagram $D:I arrow.r cat(C)$ (where $I$ is an indexed set) has colimit $K := lim_(i arrow I)D$ in $cat(C)$. We'll first establish some tools, and gather some statements before proving the main statement:

  \ 

  #text(weight: "bold")[I. Adjoint Properties on Homsets:]
  
  By adjoint property, there exists a natural isomorphism between the two functors $Hom_(cat(D))(F(\_),\_) tilde.equiv Hom_(cat(C))(\_,G(\_))$. That is, for any $X in cat(C)$ and $Y in cat(D)$, the natural isomorphism provides $Hom_(cat(D))(F(X),Y) tilde.equiv Hom_(cat(C))(X, G(Y))$.

  \ 

  #text(weight: "bold")[II. Cocone functor as Limit in Sets:]

  Define the functor $Cocone(\_,D): cat(C) arrow.r Set$ as $Cocone(A,D) = {"Cocones of " D " with tip "A in cat(C)}$ (that is, a set collecting all pairs $(A, {mu_i:D(i) arrow.r A}_(i in I))$, such that any morphism $f:i arrow.r j$ in $I$, satisfies $mu_i = mu_j compose D f: D(i) arrow.r A$). Then, for any morphism $f:A arrow.r B$ in $cat(C)$, it defines a morphism $overline(f):Cocone(A,D) arrow.r Cocone(B,D)$ satisfying $(A, {mu_i:D(i) arrow.r A}_(i in I)) mapsto (B, {f compose mu_i:D(i) arrow.r B}_(i in I))$.

  So, if we consider the functor $Hom_(cat(C))(D(\_), A):I^op arrow.r Set$, since in $Set$ all limit exists, in particular we can consider $lim_(arrow.l\ i in I)Hom_(cat(C))(D(i), A) = {(mu_i:D(i) arrow.r A)_(i in I) | forall f in Hom_(I)(i,j), quad mu_i = mu_j compose D f} = L$, where $L subset.eq product_(i in I)Hom_(cat(C))(D(i),A)$.

  Notice that the set $L$ is precisely all collections of morphisms that's compatible with diagram $D$, and has target at $A$. So, $L = Cocone(A,D)$.

  \ 

  #text(weight: "bold")[III. $Hom_(cat(C))(\_, A)$ Sends Colimit to Limit:]

  Given any diagram $D': J arrow.r cat(C)$ such that colimit exists, then let $K':= lim_(arrow.r \ j in J)D'(j)$ be the colimit (together with morphisms ${k_j:D'(j) arrow.r K'})_(j in J)$), the relation in #text(weight: "bold")[II] provides the following:
  $ Hom_(cat(C))(K', A) tilde.equiv Cocone(A, D') tilde.equiv lim_(arrow.l \ j in J)Hom_(cat(C))(D'(j), A) $
  This first set isomorphism is coming from the fact that for each cocone of $D'$, say $(A, {mu_j:D(j) arrow.r A}_(j in J))$ with tip $A$, there exists a unique morphism $f_(mu):K' arrow.r A$, such that each $mu_j = f_(mu) compose k_j$. So, there is a natural 1-1 correspondance between cocone with tip $A$, and the morphisms from $K'$ to $A$.

  \ 

  Finally, with the above tools, we can prove the statement: Given that $K$ is a colimit of diagram $D:I arrow.r cat(C)$, then we get the following for all $Y in cat(D)$, using the Hom functors:
  $ Hom_(cat(D))(F(K), Y) tilde.equiv Hom_(cat(C))(K, G(Y)) tilde.equiv lim_(arrow.l\ i in I)Hom_(cat(C))(D(i), G(Y)) tilde.equiv lim_(arrow.l\ i in I)Hom_(cat(D))(F compose D(i), Y) $
  Where the first isomorphism is using #text(weight: "bold")[I], the second isomorphism uses #text(weight: "bold")[III], and the third isomorphism uses #text(weight: "bold")[I] again.

  The last step is that $lim_(arrow.l\ i in I)Hom_(cat(D))(F compose D(i),Y) tilde.equiv Cocone(Y, F compose D)$ based on #text(weight: "bold")[II]. Hence, for all $Y in cat(D)$, one has $Hom_(cat(D))(F(K),Y) tilde.equiv Cocone(Y, F compose D)$, which is precisely the characterization of a colimit of $F compose D:I arrow.r cat(D)$ (Since $F(K)$ is a colimit of $F compose D$ $<==>$ every cocone of $F compose D$ of tip $Y$ corresponds to a unique morphism $F(K) arrow.r Y$ $<==>$ $Hom_(cat(D))(F(K)) tilde.equiv Cocone(Y,D)$).

  So, $F(K)$ is a colimit of $F compose D$, this shows that $F$ (as a left adjoint of $G$) preserves colimit.
]
