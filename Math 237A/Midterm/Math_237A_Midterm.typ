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
    colors: ergo-colors.bootstrap,  
    styles: ergo-styles.sidebar2, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 237A Midterm",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Setup:
Let $GG=GG(2,4)$ be the Grassmannian variety parametrizing 2-dimensional subspaces in a 4-dimensional vector space, or equivalently, parametrizing $PP^1$ in a given $PP^3$. Recall that the Pl$accent(u, dot.double)$cker embedding identifies $GG$ with a quadric hypersurface in $PP^5$.

\ 

= Notations \& Tools:

Let $k^4$ be the standard $4$-dimensional $k$-vector space. If view $PP^3 := (k^4\\{0})\/tilde$, where any nonzero vector $v,u in k^4$, $v tilde u$ iff $u = lambda v$ for some $lambda in k$, then it defines a quotient map $pi:k^4\/{0} arrow.r.twohead PP^3$. Here are some things we're assuming:

\

#text(weight: "bold")[(1) Line $ell subset PP^3$ as 2-dimensional subspace $tilde(ell) subset k^4$:]

For each line $ell subset PP^3$, there exists $p,q in PP^3$ (where $p!=q$) such that $ell = {s p+t q|[s,t] in PP^1}$ (where given $p=[p_0,p_1,p_2,p_3], q=[q_0,q_1,q_2,q_3]$, $s p+t q=[s p_i+t q_i]_(0<=i<=3) in PP^3$). Then, notice that let $p'=(p_0,p_1,p_2,p_3)$ and $q' = (q_0,q_1,q_2,q_3)$ in $k^4$, one has $pi^(-1)(ell) union {0} = span{p',q'}$: 

Since any $pi(p')=p$, $pi(q')=q$, with $p!=q$, this shows that $p,q$ are not scalar multiples of each other, hence linearly independet. Then, for any nonzero $(s,t) in AA^2$ (correspond to a point $[s,t] in PP^1$), where at least one of $s,t$ is nonzero, then $s p+t q!=0$ due to linear independence. Hence, one has $pi(s p'+t q') = [s p_i+t q_i]_(0<=i<=3) in ell$, showing that $pi(span{p',q'}\\{0}) = ell$. Hence, WLOG can say $ell$ is identified with a $2$-dimensional subspace (here it's $span{p',q'}$) in $k^4$, which we'll denote as $tilde(ell) subset.eq k^4$.

\ 

#text(weight: "bold")[(2) Plane $H subset PP^3$ as 3-dimensional subspace $tilde(H) subset k^4$:]

Using similar logic, any plane $H subset PP^3$ that has distinct points $p,q,w in PP^3$ satisfying $H = {s p+t q+r w | [s,t,r] in PP^2}$, one has $pi^(-1)(H) union {0} = span{p',q',w'}$ (where $p',q',w' in k^4$ are representatives of $p,q,w in PP^3$ under quotient), hence WLOG can also say $H$ is identified with a $3$-dimensional subspace in $k^4$, we'll denote as $tilde(H) subset.eq k^4$.

\ 

#text(weight: "bold")[(3) Pl$bold(accent(u,dot.double))$cker Embedding with Change of Basis:]

Fixing a basis $e_0,e_1,e_2,e_3 in k^4$, then any line $ell subset PP^3$ (or $2$D subspace $tilde(ell) subset k^4$), if $tilde(ell) = span{p,q}$ (where $p = (p_0,p_1,p_2,p_3)$ and $q=(q_0,q_1,q_2,q_3)$), then the Pl$accent(u,dot.double)$cker Embedding $P:GG arrow.r PP^5$ can be defined as:
$ ell := mat(p_0,p_1,p_2,p_3;q_0,q_1,q_2,q_3), quad P(ell) = [X_(0 1),X_(0 2),X_(0 3),X_(1 2),X_(1 3), X_(2 3)], quad X_(i j):=det mat(p_i,p_j;q_i,q_j) $
Which, given any $g in GL_2 (k)$, the $g dot mat(p_0,p_1,p_2,p_3;q_0,q_1,q_2,q_3)$ is invariant under Pl$accent(u,dot.double)$cker Embedding (since then the new $X_(i j) = det(g) dot det mat(p_i,p_j;q_i,q_j)$), hence it's well-defined under change of basis in $tilde(ell)$. 

\ 

Furthermore, if we choose another basis $f_0,f_1,f_2,f_3 in k^4$, and consider $g in GL_4 (k)$ that serves as a change-of-basis matrix from ${f_1,f_2,f_3,f_4}$ to ${e_1,e_2,e_3,e_4}$ (as column vectors). Then, given a line $ell subset PP^3$, $tilde(ell) = span{p,q}$ (where $p,q in k^4$ are linearly independent). Let $p = (p_i)_(0<=i<=3)$ under basis $e_i$, and $p=(p'_i)_(0<=i<=3)$ under basis $f_i$ (use the same notation for $q$). Let $ell_e, ell_f$ denotes the $2 times 4$ matrix representation of $ell$ under basis $e_i$ and $f_i$ respectively. Then, together with $g$, they satisfy the following:
$ g = mat(a_(00),a_(01),a_(02),a_(03);
          a_(10),a_(11),a_(12),a_(13);
          a_(20),a_(21),a_(22),a_(23);
          a_(30),a_(31),a_(32),a_(33)) in GL_4 (k) $
$ ell_e dot g = ell_f quad ==> quad mat(p_0,p_1,p_2,p_3;q_0,q_1,q_2,q_3)mat(a_(00),a_(01),a_(02),a_(03);
a_(10),a_(11),a_(12),a_(13);
a_(20),a_(21),a_(22),a_(23);
a_(30),a_(31),a_(32),a_(33)) = mat(p'_0,p'_1,p'_2,p'_3; q'_0,q'_1,q'_2,q'_3) $
Now, let $[X_(i j)]_(0<=i<j<=3) = P(ell_e)$ and $[X'_(i j)]_(0<=i<j<=3) = P(ell_f)$, we can in fact show that $P(ell_f)$ and $P(ell_e)$ are related using a linear transformation: For definiteness, we'll demonstrate only the relation on $X'_(0 1)$. Using the above formula, one can show the following:
$ X_(0 1) = det mat(p_0,p_1;q_0,q_1), quad X'_(01) = det mat(p'_0,p'_1;q'_0,q'_1) = det mat(sum_(i=0)^3 a_(i 0)p_i, ,sum_(j=0)^3a_(j 1)p_j;
sum_(i=0)^3 a_(i 0)q_i, ,sum_(j=0)^3 a_(j 1)q_j) $
(Note: The equation for $X'_(0 1)$ is given by change of basis formula). 

Which, using the multilinearity of determinant (that can break down summation in each row/column, and factor out scalars in each row/column), we get the following:
$ X'_(0 1) = det mat(sum_(i=0)^3 a_(i 0)p_i, ,sum_(j=0)^3a_(j 1)p_j;
sum_(i=0)^3 a_(i 0)q_i, ,sum_(j=0)^3 a_(j 1)q_j) = sum_(i=0)^3 sum_(j=0)^3 a_(i 0) a_(j 1) det mat(p_i,p_j;q_i,q_j) = sum_(i=0)^3 sum_(j=0)^3 a_(i 0)a_(j 1)X_(i j) $
Hence, applying similar logic one can show that each entry of $P(ell_f) = [X'_(i j)]_(1<=i<j<=3)$ can be obtained using a linear transformation (with coefficients from matrix $g$), and the entries of $P(ell_e) = [X_(i j)]_(0<=i<j<=3)$. Also, notice that such linear transformation is invertible (at least on $GG subset PP^5$), due to the fact that $g$ is invertible, and $ell_e = ell_f dot g^(-1)$ (recall that because of change of basis, $ell_f = ell_e dot g$), hence the whole process is invertible.

As a result, given the change of basis matrix $g in GL_4 (k)$ from $f_i$ to $e_i$, there exists a linear transformation $T_g:PP^5 arrow.r PP^5$ (that's invertible on embedding of $GG subset PP^5$), such that the following commutes:
#set align(center)
#diagram($
           GG edge(->, script(P)) edge("d",->,script(\_ dot g)) & PP^5 edge("d",->,script(T_g), #left)\
           GG edge(->, script(P), #right) & PP^5
         $)
#set align(left)
Where $\_ dot g$ denotes a change of representation $ell_e mapsto ell_f$, and $T_g$ representes te linear transformation $P(ell_e) mapsto P(ell_f)$. Also, the top $GG$ uses $e_i$, while the bottom $GG$ uses $f_i$ as matrix representation. #text(weight: "bold")[So, change of basis on $k^4$ just results in a different embedding of $GG subset PP^5$, and such embeddings are associated by linear transformations (invertible on the images of embeddings), hence it preserves lines and planes in $GG$].

So, for each part of the question, we'll most likely perform a change of basis for ease of computation.

#pagebreak()

= D//1
#problem[
  For any point $p in PP^3$ and plane $H subset PP^3$ containing $p$, let $Sigma_(p,H) subset GG$ be the locus of lines in $PP^3$ passing through $p$ and lying in $H$. Show that under the Pl$accent(u, dot.double)$cker embedding $GG arrow.r PP^5$, $Sigma_(p,H)$ is carried to a line, and that conversely every line in $PP^5$ lying on $GG$ is of the form $Sigma_(p,H)$ for some $p$ and $H$.
][

  #text(weight: "bold")[$Sigma_p$ embeds to a line in $PP^5$:]

  If identify $p in k^4$ as a representative of $p in PP^3$, then as a $3$-dimensional subspace, $tilde(H) subset k^4$ contains $p$ (so under projection $p in H subset PP^3$, the corresponding plane of $tilde(H) subset k^4$). Since $p!=0$, extend it to a basis $p,h_1,h_2$ of $tilde(H)$, then further extend it to a basis $p,h_1,h_2,v$ of $k^4$. We'll use this basis for Pl$accent(u, dot.double)$cker Embedding.
  
  For every line $ell subset Sigma_(p,H)$ satisfying $p in ell subset H$ (passes through $p$, lies in $H$), since $tilde(ell) subset tilde(H)$ is a $2$-dimensional subspace containing $p$, there exists $q in tilde(H)$ such that $tilde(ell) = span{p, q}$ (where $p,q$ are linearly independet). Then, since $q in tilde(H)$, there exists unique $(s,t,r) in AA^3$ such that $q = s p+t h_1+r h_2$; and based on the linear independence of $p,q$, one must have $t$ or $r$ being nonzero (if $t=r=0$, $q = s p$ cannot be linearly independent with $p$). Hence, $tilde(ell) = span{p, s p+t h_1+r h_2} = span{p, t h_1+ r h_2}$ (with $t$ or $r$ being nonzero), showing that one can pick $[t,r] in PP^1$ such that $tilde(ell) = span{p, t h_1+r h_2}$.
  
  Now, since under the ordered basis ${p,h_1,h_2,v}$ of $k^4$, $p = (1,0,0,0)$ and $t h_1+r h_2 = (0,t,r,0)$, hence under the chosen basis of $k^4$, the line $ell subset PP^3$ can be represented the following matrix:
  $ ell = mat(1,0,0,0;0,t,r,0) $
  So, under Pl$accent(u,dot.double)$cker Embedding, one yields:
  $ P(ell) = \[det mat(1,0;0,t), det mat(1,0;0,r), det mat(1,0;0,0), det mat(0,0;t,r), det mat(0,0;t,0), det mat(0,0;r,0) \] = [t,r,0,0,0,0] $
  Hence, consider the line embedding $phi:PP^1 arrow.r PP^5$ by $phi([t,r]) = [t,r,0,0,0,0]$, then since each $ell = mat(1,0,0,0;0,t,r,0)$ has $P(ell) = [t,r,0,0,0,0]$ (after choosing the basis), then one can see that $P(Sigma_(p,H)) = phi(PP^1)$, showing that $Sigma_(p,H)$ has its image being a line in $PP^5$.

  \ 

  \ 

  \ 

  #text(weight: "bold")[Converse:]

  To prove the converse, suppose a line $ell' tilde.equiv PP^1 subset P(GG) subset PP^5$ is parametrized by distinct $p,q in P(GG)$, and $ell' = {t p+r q in P(GG)|[t,r] in PP^1}$. Which, let $tilde(ell)_p, tilde(ell)_q subset k^4$ be distinct $2$-dimensional subspaces corresponding to points $p,q in ell'$ (so $p = P(ell_p)$ and $q = P(ell_q)$ under Pl$accent(u,dot.double)$cker Embedding), we claim that $tilde(ell)_p sect tilde(ell)_q != 0$:

  \ 

  Suppose the contrary that $tilde(ell)_p sect tilde(ell)_q = 0$, they form a direct sum, then $tilde(ell)_p plus.circle tilde(ell)_q = k^4$ (since $dim_k (tilde(ell)_p plus.circle tilde(ell)_q) = dim_k (tilde(ell)_p)+dim_k (tilde(ell)_q)=4$). So, based on the ability of performing Change of Basis on $k^4$, and resulting in another embedding of $GG$ into $ PP^5$ that preserves lines and planes (this is proved in #text(weight: "bold")[2 Notations \& Tools] part (3)), WLOG one can choose basis $e_0,e_1 in tilde(ell)_p$, and $e_2,e_3 in tilde(ell)_q$, which forms a basis $e_0,e_1,e_2,e_3$ of $k^4$.

  If using this ordered basis as matrix representation, then notice that $tilde(ell)_p = span{e_0,e_1}$ and $tilde(ell)_q = span{e_2,e_3}$ (or $ell_p, ell_q in GG$) are represented as follow:
  $ ell_p = mat(1,0,0,0;0,1,0,0), quad ell_q = mat(0,0,1,0;0,0,0,1) $
  Under Pl$accent(u, dot.double)$cker Embedding, the two yields the following coordinatees in $PP^5$:
  $ p=P(ell_p) = [1,0,0,0,0,0], quad q=P(ell_q) = [0,0,0,0,0,1] $
  Hence, under this new embedding, the line $ell' = {t p+ r q|[t,y] in PP^1} = {[t,0,0,0,0,r]}_([t,r] in PP^1)$. 

  Since this line is assumed to be in the image of Pl$accent(u,dot.double)$cker Embedding, then every $[t,r] in PP^1$ should have $[t,0,0,0,0,r] in P(GG)$. For $[t,r] = [0,1]$, we have the point $q in P(GG)$, which yields no problem (similarly for $[t,r]=[1,0]$ that yields $p in P(GG)$).
  
  Yet, when consider $t,r !=0$ (WLOG, say $t=1$), since it corresponds to $[1,0,0,0,0,r] in P(GG)$, suppose it corresponds to a $2$-dimensional subspace $tilde(ell) = span{a,b}$ (where $a = (a_i), b=(b_i)$ under the given basis $e_0,e_1,e_2,e_3 in k^4$), so the line $ell subset GG$ is given under the following representation:
  $ ell = mat(a_0,a_1,a_2,a_3;b_0,b_1,b_2,b_3) $
  hen since for $[1,0,0,0,0,r]=P(ell) = [X_(i j)]_(0<=i<j<=3)$, one has $1=X_(0 1) = det mat(a_0,a_1;b_0,b_1)$, then up to a change of basis using matrix in $GL_2 (k)$, WLOG one can assume $mat(a_0,a_1;b_0,b_1)=mat(1,0;0,1)$, so $ell$ is given as follow:
  $ ell=mat(1,0,a_2,a_3;0,1,b_2,b_3) $
  Hence, we get that $[1,0,0,0,0,r]=P(ell) = [1,b_2,b_3,-a_2,-a_3,a_2 b_3-a_3 b_2]$, hence deduces that $a_2,a_3,b_2,b_3=0$, showing that $r=0$. Yet, this contradicts our assumption that $r!=0$. So, the initial assumption must be false, showing that $tilde(ell)_p sect tilde(ell)_q != 0$.

  \ 

  As a result, let the nonzero vector $x in tilde(ell)_p sect tilde(ell)_q$, since $tilde(ell)_p != tilde(ell)_q$, one can choose nonzero vectors $x_p in tilde(ell)_p$ and $x_q in tilde(ell)_q$, such that $tilde(ell)_p = span{x,x_p}$ and $tilde(ell)_q=span{x,x_q}$, and $x,x_p,x_q$ are linearly independent. 
  
  Finally, consider the $3$-dimensional subspace $tilde(H) = span{x,x_p,x_q}$ (where $H subset PP^3$ is a plane). Under the basis $e_0,e_1,e_2,e_3 in k^4$, let $x = (x_i), x_p = (x_(p,i))$, and $x_q = (x_(q,i))$ be the coordinates, then $ell_p, ell_q in GG$ are represented using the following matrices:
  $ ell_p = mat(x_0,x_1,x_2,x_3; x_(p,0),x_(p,1),x_(p,2),x_(p,3)), quad ell_q = mat(x_0,x_1,x_2,x_3; x_(q,0),x_(q,1),x_(q,2),x_(q,3)) $
  Which, for all line $L in Sigma_(x, H)$ satisfying $x in L subset H$ (or $2$-dimensional subspace $tilde(L)$ satisfying $x in tilde(L) subset tilde(H)$), since $tilde(L) = span{x, t x_p+r x_q}$ for some $[t,r] in PP^1$ (due to the fact that $tilde(H) = span{x,x_p,x_q}$, then one can choose another basis vector of $tilde(L)$ as $s x+t x_p+r x_q$, where $t$ or $r$ is nonzero; hence $tilde(L)=span{x,s x+t x_p+r x_q}=span{x,t x_p+r x_q}$), then $L in Sigma_(x,H)$ has the following matrix representative:
  $ L = mat(x_0,x_1,x_2,x_3;t (x_(p,0)+r x_(q,0)),(t x_(p,1)+r x_(q,1)),(t x_(p,2)+r x_(q,2)),(t x_(p,3)+r x_(q,3))) $ 
  Hence, $p(L) = [X_(i j)]_(0<=i<j<=3)$, where each $X_(i j) = det mat(x_i,x_j;(t x_(p,i)+r x_(q,i)), (t x_(p,j)+r x_(q,j))) = t det mat(x_i,x_j;x_(p,i),x_(p,j)) + r det mat(x_i,x_j;x_(q,i),x_(q,j))$ (notice that the two determinants are coming from the $(i,j)$ entry of $P(ell_p)$ and $P(ell_q)$ respectively), so $P(L) = t P(ell_p) + r P(ell_q) = t p+r q$.

  Which, this shows that $ell' = {t p+r q | [t,r] in PP^1} = P(Sigma_(x,H))$ (since there exists $L in Sigma_(x,H)$ such that $P(L) = t p+r q$ for all $[t,r] in PP^1$, while every $L in Sigma_(x,H)$ is also in such form). Hence, we can conclude that each line $ell' in GG subset PP^5$ is of the form $Sigma_(p,H)$ for some point $p$ and plane $H subset PP^3$, such that $p in H$.


]

#pagebreak()

= ND//2
#problem[
  For any point $p in PP^3$, let $Sigma_p subset GG$ be the locus of lines in $PP^3$ passing through $p$; for any plane $H subset PP^3$, let $Sigma_H subset GG$ be the locus of lines in $PP^3$ lying in $H$. Show that under Pl$accent(u,dot.double)$cker Embedding, both $Sigma_p$ and $Sigma_H$ are carried into planes in $PP^5$, and that conversely any plane $Lambda tilde.equiv PP^2 subset GG subset PP^5$ is either equal to $Sigma_p$ for some $p$ or to $Sigma_H$ for some $H$.
][

  #text(weight: "bold")[1. Case of $Sigma_p$ for $p in PP^3$:]

  Let nonzero vector $p in k^4$ be a representative of $p in PP^3$ (abuse of notation), extend this to a basis $p,e_1,e_2,e_3$ of $k^4$. We'll use this as a basis for Pl$accent(u,dot.double)$cker Embedding.

  Given any line $ell in Sigma_p$ (or $2$-dimensional subspace $tilde(ell) in k^4$ with $p in tilde(ell)$), extend $p in tilde(ell)$ to a basis $p,q$ of $ tilde(ell)$, then since $q = a p+s e_1 +t e_2 + r e_3$ for a unique $(a,s,t,r) in AA^4$ (and one of $s,t,r$ is nonzero, due to linear independence of the list $p,q$; so $[s,t,r] in PP^2$), then we get that $tilde(ell)=span{p,q} = span{p,a p+s e_1+t e_2+ r e_3} = span{p,s e_1+t e_2+r e_3}$. Hence, under ordered basis $p,e_1,e_2,e_3 in k^4$, the matrix representative of $ell$ is as follow:
  $ ell = mat(1,0,0,0;0,s,t,r) $
  And, $[s,t,r] in PP^2$ can in fact be arbitrary. Hence, under Pl$accent(u,dot.double)$cker Embedding, $ell in Sigma_p$ yields:
  $ P(ell) = [s,t,r,0,0,0] in PP^5 $
  Hence, if consider the plane embedding $phi:PP^2 arrow.r PP^5$ by $phi([s,t,r])=[s,t,r,0,0,0]$, the above shows that $P(Sigma_p) = phi(PP^2)$, so $Sigma_p$ gets embedded into a plane in $PP^5$.

  \ 

  \ 

  #text(weight: "bold")[2. Case of $Sigma_H$ for plane $H subset PP^3$:]

  Given $H subset PP^3$ as a plane, $tilde(H) subset k^4$ is a $3$-dimensional subspace. Fix basis $h_1,h_2,h_3 in tilde(H)$, and extend it to a basis $p,h_1,h_2,h_3 in k^4$, we'll use this basis for Pl$accent(u,dot.double)$cker Embedding. 

  Notice that given any line $ell in Sigma_H$, or $ell subset H$ (which indicates that the $2$-dimensional subspace $tilde(ell) subset tilde(H)$), we have $tilde(ell) = span{a,b} subset tilde(H)$. So, under the basis $p,h_1,h_2,h_3$ of $k^4$, $a = (0,a_1,a_2,a_3)$ and $b = (0,b_1,b_2,b_3)$ (since $a,b in tilde(H) = span{h_1,h_2,h_3}$).  Which, under Pl$accent(u,dot.double)$cker Embedding, $ell$ gets carried to the following (based on the matrix representative):
  $ ell=mat(0,a_1,a_2,a_3;0,b_1,b_2,b_3), quad P(ell) = [0,0,0,det mat(a_1,a_2;b_1,b_2), det mat(a_1,a_3;b_1,b_3), det mat(a_2,a_3;b_2,b_3)] $ 
  So, if consider the plane embedding $phi:PP^2 arrow.r PP^5$ by $phi([s,t,r]) = [0,0,0,s,t,r]$, this shows that $P(Sigma_H) subset.eq phi(PP^2)$, which is contained in a plane. To prove that $P(Sigma_H) = phi(PP^2)$, given any $[0,0,0,s,t,r] in phi(PP^2)$, there are two cases to consider:
  - First, if $t!=0$ (WLOG, say $t=1$), then if $ell in Sigma_H$ above has $P(ell)=[0,0,0,s,t,r]$, then one has $det mat(a_1,a_3;b_1,b_3)=t = 1$, so up to a change of basis matrix in $GL_2 (k)$, one can assume $mat(a_1,a_3;b_1,b_3)=mat(1,0;0,1)$. Hence, one yields the following:
    $ ell=mat(0,1,a_2,0;0,0,b_2,1), quad [0,0,0,s,t,r]=P(ell) = [0,0,0,b_2,1,a_2] $
    Hence, the line $ell = mat(0,1,r,0;0,0,s,1)$ satisfies $P(ell)=[0,0,0,s,t,r]$ (if $t!=0$).

  - Else, if $t=0$, then if $ell in Sigma_H$ above has $P(ell)=[0,0,0,s,t,r]$, then one has $det mat(a_1,a_3;b_1,b_3) = t = 0$, showing $(a_1,a_3),(b_1,b_3)$ are linearly dependent. WLOG, up to some change of basis, one can say $mat(a_1,a_3;b_1,b_3)=mat(a_1,a_3;0,0)$ (subtracting rows, or swap rows). Hence, one yields the following:
    $ ell=mat(0,a_1,a_2,a_3;0,0,b_2,0), quad [0,0,0,s,t,r]=P(ell)=[0,0,0,a_1 b_2,0,-a_3 b_2] $
    Since it needs to satisfy $s = a_1 b_2$ and $r = - a_3 b_2$, and since one of $s,r$ must be nonzero (in case for $[s,t,r]=[s,0,r] in PP^2$), then one must have $b_2!=0$ (if $b_2=0$, $s=a_1 b_2=0$ and $r=-a_3 b_2=0$ reaches a contradiction). So, WLOG, assume $b_2=1$ (by a scalar multiplication). Then, one yields $s = a_1$ and $r = -a_3$, so $ell = mat(0,s,a_2,-r;0,0,1,0)$ satisfies $P(ell)=[0,0,0,s,t,r]$ (where $t=0$).

  So, under both cases one has $[0,0,0,s,t,r] in P(Sigma_H)$, showing that $phi(PP^2) = P(Sigma_H)$. Hence, $Sigma_H$ also gets carried to a plane in $PP^5$.

  \ 

  \ 

  #text(weight: "bold")[3. Converse:]




]

#pagebreak()

= ND//3
#problem[

][
  
]