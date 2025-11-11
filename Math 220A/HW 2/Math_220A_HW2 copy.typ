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
  4. Here, let the second entry being $k[z]$ (with the relation $k[x] arrow.r k[z]$ by $x mapsto z^2$), which $k[y] tilde.equiv k[x,y]\/(y^2-x)$, and $k[z] tilde.equiv k[x,z]\/(z^2-x)$ based on proof in part 3. Here, we'll show that $k[x,y,z]\/(y^2-x, z^2-x) tilde.equiv k[y] times.circle_(k[x]) k[z]$.


  
  /*For $k[y] times.circle_(k[x]) k[y]$ (where $k[y]$ is given in the previous part), for less confusion the second one we'll denote as $k[z]$ as $k[x]$-algebra (by the map $k[x] arrow.r k[z]$ through $x mapsto z^2$). Since $k[x,y] := (k[x])[y]$ satisfies $(k[x])[y] times.circle_(k[x])(k[x])[z] tilde.equiv (k[x])[y,z]$ (based on part 1), in $k[x]$-algebra, we have the coproduct of $k[x,y]$ and $k[x,z]$ being $k[x,y,z]$. 
  
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
    Notice that $h$ is automatically surjective (since the generators of $k[y] times.circle_(k[x])k[z]$ are $f times.circle 1$ and $1 times.circle g$ in $k[y] times.circle_(k[x])k[z]$, and such surjectivity onto the generators are given by $pi_1$ and $pi_2$), hence we have $k[y] times.circle_(k[x]) k[z] tilde.equiv k[x,y,z]\/ker$. */


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
