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
  title: "Math 231A HW 4",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= D//1
#problem[
  Etingof Problem Sets 3.5:

  + Prove that $RR^3$ with the commutator given by the cross-product is a Lie algebra. Show that this Lie algebra is isomorphic to $so(3,RR)$.
  + Let $phi:so(3,RR) arrow.r RR^3$ be the isomorphism of part (1). Prove that under this isomorphism, the standard action of $so(3,RR)$ on $RR^3$ is identified with the action of $RR^3$ on itself given by the cross-product:
    $ a dot overline(v) = phi(a) times overline(v), quad a in so(3,RR), overline(v) in RR^3 $
    where $a dot overline(v)$ is the usual multiplication of a matrix by a vector.
][

  + It's well-known that cross product is skew-symmetric, hence to check that $(RR^3, times)$ forms a Lie Algebra, it remains to check Jacobi's Identity.
   
    Recall that for standard basis ${be_1,be_2,be_3} subset RR^3$ it satisfies the cyclic relation, where $be_1 times be_2=be_3$, $be_2 times be_3 = be_1$, and $be_3 times be_1=be_2$. Then, given arbitrary $overline(x)=sum_(i=1)^3 x_i be_i$, $overline(y)=sum_(i=1)^3 y_i be_i$, and $overline(z)=sum_(i=1)^3 z_i be_i$, using bilinearity of cross product, we get the following:
    $ (overline(x) times overline(y)) times overline(z ) =& ((x_2y_3-x_3y_2)be_1+(x_3y_1-x_1y_3)be_2+(x_1y_2-x_2y_1)be_3) times overline(z)\ 
     =&((x_3y_1-x_1y_3)z_3-(x_1y_2-x_2y_1)z_2)be_1\ 
      &+((x_1y_2-x_2y_1)z_1-(x_2y_3-x_3y_2)z_3)be_2\ 
      &+((x_2y_3-x_3y_2)z_2-(x_3y_1-x_1y_3)z_1)be_3 $

    $ (overline(y)times overline(z)) times overline(x) =& ((y_3z_1-y_1z_3)x_3-(y_1z_2-y_2z_1)x_2)be_1\ 
    &+ ((y_1z_2-y_2z_1)x_1-(y_2z_3-y_3z_2)x_3)be_2\ 
    &+ ((y_2z_3-y_3z_2)x_2-(y_3z_1-y_1z_3)x_2)be_3 $

    $ (overline(z)times overline(x)) times overline(y) =& ((z_3x_1-z_1x_3)y_3-(z_1x_2-z_2x_1)y_2)be_1\ 
    &+ ((z_1x_2-z_2x_1)y_1-(z_2x_3-z_3x_2)y_3)be_2\ 
    &+ ((z_2x_3-z_3x_2)y_2-(z_3x_1-z_1x_3)y_2)be_3 $
    Which, by verifying the cross terms, $(overline(x) times overline(y)) times overline(z)+(overline(y) times overline(z)) times overline(x)+(overline(z) times overline(x)) times overline(y)=overline(0)$, hence cross product satisfies Jacobi Identity, showing that $(RR^3, times)$ forms a Lie algebra.

    \ 

    Now, consider the following standard basis of $so(3,RR)$:
    $ J_x:=mat(0,0,0;0,0,-1;0,1,0), quad J_y:=mat(0,0,1;0,0,0;-1,0,0), quad J_z:= mat(0,-1,0;1,0,0;0,0,0) $
    Notice that it satisfies the following relation using matrix commutator:
    $ [J_x,J_y] &= mat(0,0,0;0,0,-1;0,1,0)mat(0,0,1;0,0,0;-1,0,0)-mat(0,0,1;0,0,0;-1,0,0)mat(0,0,0;0,0,-1;0,1,0)\ 
    &= mat(0,0,0;1,0,0;0,0,0)-mat(0,1,0;0,0,0;0,0,0) = J_z $
    $ [J_y,J_z]&=mat(0,0,1;0,0,0;-1,0,0)mat(0,-1,0;1,0,0;0,0,0)-mat(0,-1,0;1,0,0;0,0,0)mat(0,0,1;0,0,0;-1,0,0)\
    &= mat(0,0,0;0,0,0;0,1,0)-mat(0,0,0;0,0,1;0,0,0)=J_x $
    $ [J_z,J_x]&=mat(0,-1,0;1,0,0;0,0,0)mat(0,0,0;0,0,-1;0,1,0)-mat(0,0,0;0,0,-1;0,1,0)mat(0,-1,0;1,0,0;0,0,0)\
    &=mat(0,0,1;0,0,0;0,0,0)-mat(0,0,0;0,0,0;1,0,0)=J_y  $
    Hence, if consider the linear map $phi:so(3,RR)arrow.r RR^3$ by $phi(J_x)=be_1$, $phi(J_y)=be_2$, and $phi(J_z)=be_3$, the following equations are satisfied:
    $ phi([J_x,J_y])=phi(J_z)=be_3=[be_1,be_2]=[phi(J_x),phi(J_y)] $
    $ phi([J_y,J_z])=phi(J_x)=be_1=[be_2,be_3]=[phi(J_y),phi(J_z)] $
    $ phi([J_z,J_x])=phi(J_y)=be_2=[be_3,be_1]=[phi(J_z),phi(J_x)] $
    Hence, since $phi$ preserves the commutators (on distinct pairs of basis) between the two Lie algebras, it forms a Lie algebra homomorphism; also, since it sends basis ${J_x,J_y,J_z} subset so(3,RR)$ to basis ${be_1,be_2,be_3}subset RR^3$, it's in fact an $RR$-linear isomorphism. So, $so(3,RR)$ and $RR^3$ are isomorphic Lie algebras.

    \ 

  + To verify that the natural action of $so(3,RR)$ on $RR^3$ is the same as cross product action of $RR^3$ on itself, it suffices to verify for the basis matrices ${J_x,J_y,J_z} subset RR^3$ (since for any $a in so(3,RR)$, if $a=a_1J_x+a_2J_y+a_3J_z$, we have $a dot overline(v) = a_1J_x dot overline(v)+a_2J_y dot overline(v)+a_3J_z dot overline(v) = a_1 phi(J_x) times overline(v)+a_2 phi(J_2) times overline(v)+a_3 phi(J_3) times overline(v) = phi(a_1J_x+a_2J_y+a_3J_z) times overline(v) = phi(a) times overline(v)$).

    Which, for each basis matrix of $so(3,RR)$, we have the following for any $overline(v)=mat(x;y;z) in RR^3$:
    $ J_x dot overline(v)=mat(0,0,0;0,0,-1;0,1,0)mat(x;y;z)=mat(0;-z;y) = mat(1;0;0) times mat(x;y;z)=be_1 times overline(v)=phi(J_x) times overline(v) $
    $ J_y dot overline(v)=mat(0,0,1;0,0,0;-1,0,0)mat(x;y;z)=mat(z;0;-x) = mat(0;1;0) times mat(x;y;z)=be_2 times overline(v)=phi(J_y) times overline(v) $
    $ J_z dot overline(v)=mat(0,-1,0;1,0,0;0,0,0)mat(x;y;z)=mat(-y;x;0) = mat(0;0;1) times mat(x;y;z)=be_3 times overline(v)=phi(J_z) times overline(v) $
    Hence, the $so(3,RR)$ action on $RR^3$ is compatible with the cross product action of $RR^3$ on itself.
]

\ 

= D//2
#problem[
  Etingof Problem Set 3.6:

  Let $P_n$ be the space of polynomials with real coefficients of degree $,<=n$ in variable $x$. The Lie group $G=RR$ acts on $P_n$ by translations of the argument: $rho(t)(x):=x+t, t in G$. Show that the corresponding action of the Lie algebra $frak(g)=RR$ is given by $rho(a)=a partial_x, a in frak(g)$, and deduce from this the Taylor formula for polynomials:
  $ f(x+t)=sum_(n>=0)(t partial_x)^n/n! f $
][
  Here for simplicity we'll directly use $RR$ instead of notation $G$.

  \ 
  
  #text(weight: "bold")[1. The Exponential Map $exp_RR:frak(g) arrow.r RR$:]

  For every $a in frak(g)=RR$, if we want the Lie group homomorphism $gamma_a:RR arrow.r RR$ satisfying $gamma_a '(0)=a$, notice that the linear map $f:RR arrow.r RR$ by $f(x)=a x$ is a group homomorphism, $f'(0)=a$, and $f$ is a smooth function (since it's a linear operator on $RR$), so based on the uniqueness of such Lie group Homomorphism (#text(weight: "bold")[Proposition 7.1] in Etingof's Notes), we have $gamma_a(x)=f(x)=a x$. Hence, the exponential map $exp_RR:frak(g) arrow.r RR$ satisfies $exp_RR (a) = gamma_a(1)=a$, showing that when viewing $frak(g)=RR$, $exp_RR$ is identity.

  \ 

  #text(weight: "bold")[2. The Lie algebra action of $frak(g)$ on $P_n$:]

  For all $f(x) in P_n$, every $a in frak(g)$ with $exp_RR (a)=a in RR$ has an action $rho(exp_RR (a))(f(x))=f(x+a)$. Hence, the Lie algebra action of $a in frak(g)$ on $P_n$ is as follow:
  $ a dot f(x)&:= d/(d t) eval(#300%)_(t=0)rho(exp_RR (t a))(f(x)) = d/(d t) eval(#300%)_(t=0)rho(t a)(f(x))\  &= d/(d t)eval(#300%)_(t=0)f(x+t a) = f'(x+t a)a eval(#300%)_(t=0) = a f'(x)=a partial_x (f(x)) $
  So, each $a in frak(g)$ has an action on $P_n$, corresponds to a linear operator $a partial_x in End(P_n)$ (where $End(P_n) = T_1(GL(P_n))$, the tangent space of general linear group of $P_n$).

  \ 

  #text(weight: "bold")[3. The Taylor Formula:]

  First, notice that the froup action of $RR$ on $P_n$ is in fact a linear action, or $rho:RR arrow.r GL(P_n)$. Given any $a,b in RR$ and $f(x),g(x) in P_n$, we have the following for all $t in RR$:
  $ rho(t)(a f(x)+b g(x)) = a f(x+t)+b g(x+t)=a rho(t)(f(x))+b rho(t)(g(x)) $
  This shows that $rho(t) in End(P_n)$, a linear operator on $P_n$. And, the reason it's invertible, is simply because $rho(-t)$ serves as an inverse (due to the property of group action), so $rho(t) in GL(P_n)$.

  Now, if we identify $P_n tilde.equiv RR^(n+1)$, let $frak(k):= T_1 GL(P_n) = End(P_n)$ be the tangent space of $GL(P_n)$, then the exponential map $exp_(GL(P_n)):frak(k) arrow.r GL(P_n)$ is given as operator exponential $exp_(GL(P_n)) (T) = sum_(n=0)^infinity T^n/n!$.

  Then, recall that when viewing the group action $rho:RR arrow.r GL(P_n)$ as a smooth lie group homomorphism, we have $rho compose exp_(RR) = exp_(GL(P_n)) compose rho_*$ (where $rho_*: frak(g) arrow.r frak(k)$ is the differential at $0 in RR$, the identity of $RR$ under addition), hence for every $a in frak(g)$, since based on the previous section we have the differential $rho_*$ satisfies $rho_*(a) = a partial_x in frak(k)=End(P_n)$ (since the previous part explicitely calculated what the corresponding tangent vector $rho_*$ sends $a$ to), then we get the following formula:
  $ rho(a) = rho compose exp_(RR)(a) = exp_(GL(P_n)) compose rho_*(a) = exp_(GL(P_n))(a partial_x) = sum_(n=0)^infinity (a partial_x)^n/n! $
  Hence, we derive the following Taylor's Formula (switching $a$ with $t$):
  $ f(x+t)=rho(t)(x)=sum_(n=0)^infinity (t partial_x)^n/n! f(x) $
]

\ 

= D//3
#problem[
  Etingof Problem Set 3.8:

  Let $SL(2,CC)$ act on $CC PP^1$ in the usual way:
  $ mat(a,b;c,d)(x:y) = (a x+b y:c x+d y) $
  This defines an action of $frak(g)=sl(2,CC)$ by vector fields on $CC PP^1$. Write explicitly vector fields corresponding to $h,e,f$ in terms of coordinate $t=x/y$ on the open cell $CC subset CC PP^1$.
][
  
  Here, since $t=x/y$ is the coordinate chart, for this to make sense the open cell $CC subset CC PP^1$ corresponds to the Zariski-open set ${y!=0} subset CC PP^1$.

  Recall that $sl(2,CC)$ consists of all traceless matrices, which every matrix $A in sl(2,CC)$ is of the form $mat(a,b;c,-a)$. Hence, $sl(2,CC)$ has a basis of ${h=mat(1,0;0,-1), e=mat(0,1;0,0), f=mat(0,0;1,0)}$ when viewed as a complex vector space.

  \ 

  Now, consider the "complex curve" $exp(s X):CC arrow.r SL(2,CC)$ for $X=h,e,f$ and $s=CC$ (consider the fact that $e^2=f^2=0 in M_2(CC)$):
  $ exp(s h) = sum_(n=0)^infinity (s h)^n/n! = sum_(n=0)^infinity mat(s,0;0,-s)^n/n! = sum_(n=0)^infinity 1/n! mat(s^n,0;0,(-s)^n) = mat(e^s,0;0,e^(-s)) $
  $ exp(s e) = sum_(n=0)^infinity (s e)^n/n! = mat(1,0;0,1)+mat(0,s;0,0)=mat(1,s;0,1) $ 
  $ exp(s f)=sum_(n=0)^infinity (s f)^n/n! = mat(1,0;0,1)+mat(0,0;s,0)=mat(1,0;s,1) $
  Which, if express in the coordinate $t=x/y$ on the cell $CC:= {y!=0} subset CC PP^1$, we get the following for all $t=x/y in CC$ (if let $v(X)$ denotes the vector field corresponding to $X=h,e,f$):

  (Note: Here we abused a bit of notation, letting $t=x/y$ and $(x:y)$ be interchangeable).
  $ v(h)(t) &= d/(d s)eval(#300%)_(s=0) exp(s h) (x:y)=d/(d s)eval(#300%)_(s=0)mat(e^s,0;0,e^(-s))(x:y)=d/(d s)eval(#300%)_(s=0)(e^s x:e^(-s)y)\ 
  &= d/(d s)eval(#300%)_(s=0)(e^s x)/(e^(-s)y) = d/(d s)eval(#300%)_(s=0)e^(2 s)t = 2t $
  $ v(e)(t) &= d/(d s)eval(#300%)_(s=0) exp(s e) (x:y)=d/(d s)eval(#300%)_(s=0)mat(1,s;0,1)(x:y)=d/(d s)eval(#300%)_(s=0)(x+s y:y)\ 
  &= d/(d s)eval(#300%)_(s=0)(x+s y)/(y) = d/(d s)eval(#300%)_(s=0)t+s = 1 $
  $ v(f)(t) &= d/(d s)eval(#300%)_(s=0) exp(s f) (x:y)=d/(d s)eval(#300%)_(s=0)mat(1,0;s,1)(x:y)=d/(d s)eval(#300%)_(s=0)(x:s x+y)\ 
  &= d/(d s)eval(#300%)_(s=0)(x)/(s x+y) = -x^2/(s x+y)^2 eval(#300%)_(s=0)=-x^2/y^2=-t^2 $
]

#pagebreak()

= HD (lie group hom in (1))//4
#problem[
  Etingof Problem Set 3.9:

  Let $G$ be a Lie group with Lie algebra $frak(g)$, $Aut(frak(g))$ the group of automorphisms of $frak(g)$, and $Der(frak(g))$ be the Lie algebra of derivations of $frak(g)$.
  + Show that $g mapsto Ad g$ gives a morphism of Lie groups $G arrow.r Aut(frak(g))$; similarly, $x mapsto ad x$ is a morphism of of Lie algebras $frak(g) arrow.r Der(frak(g))$ (The automorphisms of the form $Ad g$ are called #emph[inner automorphisms]; the derivations of the form $ad x, x in frak(g)$ are called #emph[inner derivations]).
  + Show that for $f in Der(frak(g))$, $x in frak(g)$, one has $[f,ad x]=ad f(x)$ as operators in $frak(g)$, and deduce from this that $ad(frak(g))$ is an ideal in $Der(frak(g))$.
][
  + First, given the map $G arrow.r Aut(frak(g))$ by $g mapsto Ad g$ (where $Ad g in Aut(frak(g))$ is formally defined as $Ad(g)_*:frak(g) arrow.r frak(g)$, where $frak(g)=T_1 G$, the tangent space at identity). Which, since given any $g,h,k in G$, we have the following formula:
    $ Ad(g h)(k) = (g h)k(g h)^(-1) = (g h)k(h^(-1) g^(-1)) = Ad(g)(h k h^(-1)) = Ad(g)(Ad(h)(k)) $
    Then, we get that $Ad(g h)=Ad(g) compose Ad(h)$, which implies that $Ad(g h)_* = Ad(g)_* compose Ad(h)_*$ (since here everything is evaluated at $1 in G$, which is invariant under any adjoint action on the Lie group itself). So, we conclude that $g h mapsto Ad g compose Ad h in Aut(frak(g))$, showing that it's indeed a group homomorphism. Together with the fact that the two Lie groups $G$ and $Aut(frak(g))$ in some sense has compatible structure, it's a Lie group homorphism.

    \ 

    Now, given the other map $frak(g) arrow.r Der(frak(g))$ by $x mapsto ad x$. To verify that it's well-defined, recall that $ad x (y) := [x,y]$ for all $x,y in frak(g)$, then by Jacobi Identity, we have the following: 
    $ ad x([y,z]) &= [x,[y,z]] = -[[y,z],x] = [[x,y],z] + [[z,x],y] = [ad x(y),z] - [[x,z],y]\ 
    &= [ad x(y),z]+[y,[x,z]] = [ad x(y),z]+[y,ad x(z)] $
    Hence, $ad x$ is indeed a derivation on $frak(g)$, so the map is well-defined.

    Then, to verify that it's a linear map, given any $a,b in KK$ (the base field of $frak(g)$) and $x,y,z in frak(g)$, we have the following:
    $ ad (a x+b y)(z) = [a x+b y,z]=a[x,z]+b[y,z] = a ad(x)(z)+b ad(y)(z) $
    This shows that $ad(a x+b y)=a ad(x)+b ad(y)$, which $ad$ is a linear map.

    Finally, to show it's a Lie algebra homomorphism, we again utilize the Jacobi Identity. For every $x,y,z in frak(g)$, we have the following:
    $ ad([x,y])(z) &= [[x,y],z] = -[[y,z],x]-[[z,x],y] = [x,[y,z]]+[y,[z,x]]\ 
    &= [x,ad y(z)] - [y,[x,z]] = ad x(ad y(z)) - [y, ad x(z)]\ 
    &= (ad x) compose (ad y)(z) - (ad y) compose (ad x)(z) = [ad x, ad y](z) $
    (Note: Here if viewing $Der(frak(g)) subset.eq End(frak(g))$ as a Lie subalgebra, its Lie Bracket is given by the commutator of the operators).

    Hence, we get that $ad([x,y])=[ad x,ad y]$, showing that $ad$ is indeed a Lie algebra homomorphism.

    \ 

  + Given any $f in Der(frak(g))$, as a derivation, for any $x,y in frak(g)$, it satisfies the following formula:
  $ f([x,y])=[f(x),y]+[x,f(y)] $
    So, given any $x,y,z in frak(g)$, we have the following computation:
    $ [f,ad x](y) &= f compose (ad x)(y) - (ad x) compose f(y) = f([x,y]) - [x,f(y)]\ 
    &= [f(x),y]+[x,f(y)]-[x,f(y)] = [f(x),y] = ad f(x)(y)  $
    /*
    $ [f, ad x]([y,z])=& f compose (ad x)([y,z])-(ad x) compose f([y,z])\ 
    =& f([ad x(y),z]+[y, ad x(z)]) - (ad x)([f(y),z]+[y,f(z)])\ 
    =& f([[x,y],z])+f([y,[x,z]]) - [x,[f(y),z]] - [x,[y,f(z)]]\ 
    =& [f([x,y]),z]+[[x,y],f(z)] + [f(y),[x,z]]+[y,f([x,z])]\ 
    &-[x,[f(y),z]]-[x,[y,f(z)]]\ 
    =& [[f(x),y]+[x,f(y)],z]+[[x,y],f(z)]\
    &+[f(y),[x,z]]+[y,[f(x),z]+[x,f(z)]]\ 
    &-[x,[f(y),z]]-[x,[y,f(z)]]\ 
    =& [[f(x),y],z]+[[x,f(y)],z]+[[x,y],f(z)] + [f(y),[x,z]]\ 
    &+  [y,[f(x),z]]+[y,[x,f(z)]] - [x,[f(y),z]]-[x,[y,f(z)]]\ 
    =&[ad f(x)(y),z] + [y, ad f(x)(z)]\ 
    &- [[f(y),x],z] - [[x,z],f(y)]-[[z,f(y)],x]\ 
    &+[[x,y],f(z)]+[[y,f(z)],x]+[[f(z),x],y]\ 
    =& [ad f(x)(y),z]+[y, ad f(x)(z)] $
    */

    Hence, this verifies that $[f, ad x] = ad f(x)$, showing that $ad(frak(g)) subset.eq Der(frak(g))$ is an ideal (since given any $f in Der(frak(g))$ and $ad x in ad(frak(g))$, it follows that $[f,ad x]=ad f(x) in ad(frak(g))$).
]

#pagebreak()

= D//5
#problem[
  Etingof Problem Set 3.11:

  Let $J_x,J_y,J_z$ be the standard basis in $so(3,RR) tilde.equiv RR^3$ (the Lie bracket is the cross product). The standard action of $SO(3,RR)$ on $RR^3$ defines an action of $so(3,RR)$ by vector fields on $RR^3$. Abusing the language, we will use the same notation $J_x,J_y,J_z$ for the corresponding vector fields on $RR^3$. Let $Delta_"sph"=J_x^2+J_y^2+J_z^2$; this is a second order differential operator on $RR^3$, which is usually called the #emph[Spherical Laplace Operator], or the #emph[Laplace Operator on the Sphere].
  + Write $Delta_"sph"$ in terms of $x,y,z,partial_x,partial_y,partial_z$.
  + Show that $Delta_"sph"$ is well-defined as a differential operator on a sphere $S^2={(x,y,z)|x^2+y^2+z^2=1}$, i.e. if $f$ is a function on $RR^3$ then $(Delta_"sph"f)|_(S^2)$ only depends on $F|_(S^2)$.
  + Show that the usual Laplace operator $Delta = partial_x^2+partial_y^2+partial_z^2$ can be written in the form $Delta = 1/r^2 Delta_"sph"+Delta_"radial"$, where $Delta_"radial"$ is a differential operator written in terms of $r=sqrt(x^2+y^2+z^2)$ and $r partial_r=x partial_x+y partial_y+z partial_z$.
  + Show that $Delta_"sph"$ is rotation invariant: For any function $f$ (on $RR^3$) and $g in SO(3,RR)$, $Delta_"sph" (g f)=g(Delta_"sph" f)$. 
][
  + First, we need to compute what the vector fields are. For any $u in RR^3$, we'll identify its tangent space $T_u RR^3:= span{partial_x,partial_y,partial_z}$, where each $partial_i$ corresponds to the direction $i$ geometrically (since it's being interpreted as directional derivatives when the space lies in $RR^n$, in this case it's $RR^3$ itself).

    For simplicity, we'll first calculate the curve $exp(t J_i):RR arrow.r SO(3,RR)$ for each $J_i$. Which, given that $J_x=mat(0,0,0;0,0,-1;0,1,0), J_y=mat(0,0,1;0,0,0;-1,0,0), J_z=mat(0,-1,0;1,0,0;0,0,0)$, they satisfy the identities $J_x^2=mat(0,0,0;0,-1,0;0,0,-1), J_y^2=mat(-1,0,0;0,0,0;0,0,-1), J_z^2=mat(-1,0,0;0,-1,0;0,0,0)$. So, their corresponding curve $exp(t J_i):RR arrow.r SO(3,RR)$ for each $J_i$ is given as follow:
    $ exp(t J_x)&=sum_(n=0)^infinity (t J_x)^n/n! = mat(1,0,0;0,1,0;0,0,1)+sum_(k=1)^infinity t^(2k)J_x^(2k)/(2k)!+t^(2k-1)J_x^(2k-1)/(2k-1)!\ 
    &= mat(1,0,0;0,1,0;0,0,1)+sum_(k=1)^infinity t^(2k)mat(0,0,0;0,-1,0;0,0,-1)^k/(2k)!+t^(2k-1)mat(0,0,0;0,-1,0;0,0,-1)^k mat(0,0,0;0,0,1;0,-1,0)/(2k-1)!\ 
    &= mat(1,0,0;0,0,0;0,0,0)+sum_(k=0)^infinity t^(2k)mat(0,0,0;0,(-1)^k,0;0,0,(-1)^k)/(2k)!+t^(2k+1)mat(0,0,0;0,0,(-1)^(k);0,-(-1)^(k),0)/(2k+1)!\ 
    &= mat(1,0,0;0,0,0;0,0,0)+mat(0,0,0;0,cos(t),0;0,0,cos(t))+mat(0,0,0;0,0,sin(t);0,-sin(t),0)= mat(1,0,0;0,cos(t),sin(t);0,-sin(t),cos(t)) $

    $ exp(t J_y)&=sum_(n=0)^infinity (t J_y)^n/n! =mat(1,0,0;0,1,0;0,0,1)+sum_(k=1)^infinity t^(2k)J_y^(2k)/(2k)!+t^(2k-1)J_y^(2k-1)/(2k-1)!\ 
    &= mat(1,0,0;0,1,0;0,0,1)+sum_(k=1)^infinity t^(2k)mat(-1,0,0;0,0,0;0,0,-1)^k/(2k)!+t^(2k-1)mat(-1,0,0;0,0,0;0,0,-1)^k mat(0,0,-1;0,0,0;1,0,0)/(2k-1)!\ 
    &= mat(0,0,0;0,1,0;0,0,0)+sum_(k=0)^infinity t^(2k)mat((-1)^k,0,0;0,0,0;0,0,(-1)^k)/(2k)!+t^(2k+1)mat(0,0,(-1)^k;0,0,0;-(-1)^k,0,0)/(2k+1)!\ 
    &= mat(0,0,0;0,1,0;0,0,0)+mat(cos(t),0,0;0,0,0;0,0,cos(t))+mat(0,0,sin(t);0,0,0;-sin(t),0,0)= mat(cos(t),0,sin(t);0,1,0;-sin(t),0,cos(t)) $

    $ exp(t J_z)&=sum_(n=0)^infinity (t J_z)^n/n! =mat(1,0,0;0,1,0;0,0,1)+sum_(k=1)^infinity t^(2k)J_z^(2k)/(2k)!+t^(2k-1)J_z^(2k-1)/(2k-1)!\ 
    &=  mat(1,0,0;0,1,0;0,0,1)+sum_(k=1)^infinity t^(2k)mat(-1,0,0;0,-1,0;0,0,0)^k/(2k)!+t^(2k-1)mat(-1,0,0;0,-1,0;0,0,0)^k mat(0,1,0;-1,0,0;0,0,0)/(2k-1)! \ 
    &= mat(0,0,0;0,0,0;0,0,1)+sum_(k=0)^infinity t^(2k)mat((-1)^k,0,0;0,(-1)^k,0;0,0,0)/(2k)!+t^(2k-1)mat(0,-(-1)^k,0;(-1)^k,0,0;0,0,0)/(2k+1)!\ 
    &=mat(0,0,0;0,0,0;0,0,1)+mat(cos(t),0,0;0,cos(t),0;0,0,0)+mat(0,-sin(t),0;sin(t),0,0;0,0,0)= mat(cos(t),-sin(t),0;sin(t),cos(t),0;0,0,1) $
    Which, $exp(t J_i)$ in fact corresponds to the elementary rotation matrix around the $i$-axis, with angle $plus.minus t$ (depending on the orientation).

    So, if write down the corresponding vector field (using $v(J_i)$ as vector field of $J_i$ for now), we get the following for all $u=mat(x;y;z) in RR^3$:
    $ v(J_x)(u)&=d/(d t)eval(#300%)_(t=0)exp(t J_x)mat(x;y;z) = d/(d t)eval(#300%)_(t=0)mat(1,0,0;0,cos(t),sin(t);0,-sin(t),cos(t))mat(x;y;z)\ 
    &= d/(d t)eval(#300%)_(t=0)mat(x;cos(t)y+sin(t)z;-sin(t)y+cos(t)z) = mat(0;-sin(t)y+cos(t)z;-cos(t)y-sin(t)z)eval(#300%)_(t=0)= mat(0;z;-y) = z partial_y-y partial_z $

    $ v(J_y)(u)&=d/(d t)eval(#300%)_(t=0)exp(t J_y)mat(x;y;z) = d/(d t)eval(#300%)_(t=0)mat(cos(t),0,sin(t);0,1,0;-sin(t),0,cos(t))mat(x;y;z)\ 
    &= d/(d t)eval(#300%)_(t=0)mat(cos(t)x+sin(t)z;y;-sin(t)x+cos(t)z) = mat(-sin(t)x+cos(t)z;0;-cos(t)x-sin(t)z)eval(#300%)_(t=0)= mat(z;0;-x) = z partial_x-x partial_z $

    $ v(J_z)(u)&=d/(d t)eval(#300%)_(t=0)exp(t J_z)mat(x;y;z) = d/(d t)eval(#300%)_(t=0)mat(cos(t),-sin(t),0;sin(t),cos(t),0;0,0,1)mat(x;y;z)\ 
    &= d/(d t)eval(#300%)_(t=0)mat(cos(t)x-sin(t)y;sin(t)x+cos(t)y;z) = mat(-sin(t)x-cos(t)y;cos(t)x-sin(t)y;0)eval(#300%)_(t=0)= mat(-y;x;0) = -y partial_x+x partial_y $
    If abuse the notation and use $J_i$ instead of $v(J_i)$ as the vector field, notice that since each $J_i^2 = j partial_k - k partial_j$ given that variables $i,j,k in {x,y,z}$ are distinct, then we can conclude the following formula for every $f in C^(infinity)(RR^3)$:
    $ J_i^2(f) &= (j partial_k-k partial_j)(j dot partial_k f- k dot partial_j f)\ 
    &= j^2 (partial_k^2 f) - j (partial_j f)-j k (partial_k partial_j f) - k (partial_k f) - j k (partial_j partial_k f)+k^2(partial_j^2 f) $
    Hence, as a formula we get $J_i^2 = j^2 partial_k^2+k^2 partial_j^2 - 2j k partial_j partial_k -j partial_j -k partial_k$. So, the Spherical Laplace Operator becomes:
    $ Delta_"sph"=J_x^2+J_y^2+J_z^2 =& y^2 partial_z^2+z^2 partial_y^2-2y z partial_y partial_z - y partial_y-z partial_z\ 
    &+ z^2 partial_x^2+x^2 partial_z^2-2x z partial_x partial_z - x partial_x-z partial_z\ 
    &+ x^2 partial_y^2+y^2 partial_x^2 - 2x y partial_x partial_y - x partial_x - y partial_y\ \ 
    =& (y^2+z^2)partial_x^2+(x^2+z^2)partial_y^2 + (x^2+y^2)partial_z^2\ 
    &- 2(x y partial_x partial_y + x z partial_x partial_z + y z partial_y partial_z)\ 
    &- 2(x partial_x+y partial_y + z partial_z) $

    \ 

  + Geometrically, given any $u in S^2 subset RR^3$, its geometric tangent space (with coordinates in $RR^3$) can be characterized by the plane ${u}^perp = {v in RR^3 | u dot v=0}$. Which, notice that if $u=mat(x;y;z)$, then the vector field (expressed as geometric tangent vectors) have $J_x(u) = mat(0;z;-y), J_y(u)=mat(z;0;-x), J_z(u) = mat(-y;x;0)$ at the point $u$, which one can verify that $J_x(u),J_y(u),J_z(u) in {u}^perp$, which all lie in the tangent space of $u in S^2$. Hence, if considering each $J_i$ as differential operator, we have $J_i|_(S^2)$ (the vector field / differential operator restricting to functions with domain $S^2$) being a well-defined and coincide with the original operator's property, hence $Delta_"sph" f|_(S^2)$ being only dependent on $f|_(S^2)$ (since each $J_i f|_(S^2) = J_i|_(S^2) (f|_(S^2))$).

    \ 

  + If consider the general Laplace Operator $Delta = partial_x^2+partial_y^2+partial_z^2$, if consider the expression $Delta-Delta_"sph"$, together with $r=sqrt(x^2+y^2+z^2)$ and $r partial_r:= x partial_x+y partial_y + z partial_z$, we get:
    $ Delta-1/r^2 Delta_"sph" =& partial_x^2+partial_y^2+partial_z^2 - (y^2+z^2)/r^2 partial_x^2-(x^2+z^2)/r^2 partial_y^2 - (x^2+y^2)/r^2 partial_z^2\ 
    &+ 2/r^2(x y partial_x partial_y + x z partial_x partial_z+y z partial_y partial_z )+2/r^2(x partial_x+y partial_y+z partial_z)\ \ 
    =& 1/r^2(x^2 partial_x^2+y^2 partial_y^2+z^2 partial_z^2)+2/r^2(x y partial_x partial_y + x z partial_x partial_z+y z partial_y partial_z )\ 
    &+2/r^2(x partial_x+y partial_y+z partial_z) $
    Which, notice that if consider the expression $(r partial_r)^2$, we get the following for all $f in C^(infinity) (RR^3)$:
    $ (r partial_r)^2(f)=&(x partial_x+y partial_y+z partial_z)(x (partial_x f)+y (partial_y f)+z (partial_z f))\ \ 
    =& x (partial_x f)+x^2 (partial_x^2 f)+x y(partial_x partial_y f)+x z(partial_x partial_z f)\ 
    &+ y x(partial_y partial_x f)+y (partial_y f)+y^2(partial_y^2 f)+y z(partial_y partial_z f)\ 
    &+ z x(partial_z partial_x f)+z y(partial_z partial_y f)+z (partial_z f)+z^2 (partial_z^2 f)\ \ 
    =& (x^2 partial_x^2+y^2 partial_y^2+z^2 partial_z^2)(f)+2(x y partial_x partial_y+x z partial_x partial_z + y z partial_y partial_z)(f)\ 
    &+ (x partial_x+y partial_y + z partial_z)(f) $
    So, we conclude that $(r partial_r)^2 = (x^2 partial_x^2+y^2 partial_y^2+z^2 partial_z^2)+2(x y partial_x partial_y+x z partial_x partial_z + y z partial_y partial_z)+(x partial_x+y partial_y + z partial_z)$. So, as conclusion the operator $Delta-1/r^2 Delta_"sph"$ can be written as:
    $ Delta-1/r^2 Delta_"sph" =& 1/r^2(x^2 partial_x^2+y^2 partial_y^2+z^2 partial_z^2)+2/r^2(x y partial_x partial_y + x z partial_x partial_z+y z partial_y partial_z )\ 
    &+2/r^2(x partial_x+y partial_y+z partial_z)\ \ 
    =& 1/r^2 ((x^2 partial_x^2+y^2 partial_y^2+z^2 partial_z^2)+2(x y partial_x partial_y+x z partial_x partial_z + y z partial_y partial_z)+(x partial_x+y partial_y + z partial_z))\ 
    &+1/r^2(x partial_x+y partial_y+z partial_z)\ \ 
    =& 1/r^2(r partial_r)^2+1/r^2(r partial_r) = 1/r partial_r (r partial_r)+1/r partial_r = 2/r partial_r + partial_r^2 $
    So, if define $Delta_"radial":= Delta-1/r^2 Delta_"sph" = partial_r^2+2/r partial_r$, one yields $Delta = Delta_"sph"+Delta_"radial"$.

    \ 

  + Before proving the rotation invariance, first recall that every $R in SO(3,RR)$ can be decomposed into products of elementary rotation matrices with some angles (around the $x,y,z$-axes respectively), which are given by $R=exp(alpha J_x) exp(beta J_y) exp(gamma J_z)$ for some $alpha,beta,gamma in RR$. So, to prove such rotation invariance, it suffices to prove it for the mentioned elementary rotation matrices above.

    For definiteness, we'll demonstrate it for the case of $exp(gamma J_z)$ (since the other two are similar, just up to some swap in coordinates and signs). Given that $(R f)mat(x;y;z):= f(R mat(x;y;z))$ for any $R in SO(3,RR)$, then $exp(gamma J_z)(Delta_"sph" f)$ is given as follow:
    $ (exp(gamma J_z)(Delta_"sph" f))mat(x;y;z)=& (Delta_"sph" f)(mat(cos(gamma),-sin(gamma),0;sin(gamma),cos(gamma),0;0,0,1)mat(x;y;z))\ \ 
    =& (Delta_"sph"f)mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)\ \ 
    =& (sin^2(gamma)x^2+cos^2(gamma)y^2+2sin(gamma)cos(gamma)x y+z^2)(partial_x^2 f)\ 
    &+ (cos^2(gamma)x^2+sin^2(gamma)y^2-2sin(gamma)cos(gamma)x y+z^2)(partial_y^2 f)\ 
    &+ (x^2+y^2)(partial_z^2 f)\ 
    &- 2 (sin(gamma)cos(gamma)(x^2-y^2) + (cos^2(gamma)-sin^2(gamma))x y)(partial_x partial_y f)\ 
    &-2(cos(gamma)x z-sin(gamma)y z)(partial_x partial_z f)-2(sin(gamma)x z+cos(gamma)y z)(partial_y partial_z f)\ 
    &-2(cos(gamma)x-sin(gamma)y)(partial_x f)-2(sin(gamma)x+cos(gamma)y)(partial_y f)-z (partial_z f) $
    Now, for the other expression $Delta_"sph" (exp(gamma J_z)f)$, first we'll consider the second order differential operator's effect on $exp(gamma J_z)f$ (Note: the first order expression are included in the second order ones):

    $ partial_x^2 [ (exp(gamma J_z)f)mat(x;y;z)] =& partial_x^2 [f(mat(cos(gamma),-sin(gamma),0;sin(gamma),cos(gamma),0;0,0,1)mat(x;y;z))]= partial_x^2 [f mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ 
    =& partial_x [(cos(gamma)(partial_x f)+sin(gamma)(partial_y f))mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ 
    =& cos^2(gamma) (partial_x^2 f)+ 2sin(gamma)cos(gamma) (partial_x partial_y f)+sin^2(gamma)(partial_y^2 f) $

    $ partial_y partial_x [ (exp(gamma J_z)f)mat(x;y;z)] =& partial_y partial_x [f mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ 
    =& partial_y [(cos(gamma)(partial_x f)+sin(gamma)(partial_y f))mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ 
    =& sin(gamma)cos(gamma)(partial_y^2 f - partial_x^2 f)+(cos^2(gamma)-sin^2(gamma))(partial_y partial_x f) $

    $ partial_z partial_x [ (exp(gamma J_z)f)mat(x;y;z)] =& partial_z partial_x [f mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ 
    =& partial_z [(cos(gamma)(partial_x f)+sin(gamma)(partial_y f))mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ 
    =& cos(gamma)(partial_z partial_x f)+sin(gamma)(partial_z partial_y f) $
    
    $ partial_y^2 [ (exp(gamma J_z)f)mat(x;y;z)] =& partial_y^2 [f mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ \ \  
    =& partial_y [(-sin(gamma)(partial_x f)+cos(gamma)(partial_y f))mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ 
    =& sin^2(gamma) (partial_x^2 f)- 2sin(gamma)cos(gamma) (partial_x partial_y f)+cos^2(gamma)(partial_y^2 f) $

    $ partial_z partial_y [ (exp(gamma J_z)f)mat(x;y;z)] =& partial_z partial_y [f mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)]\ \ \ \ 
    =& partial_z [(-sin(gamma)(partial_x f)+cos(gamma)(partial_y f))mat(cos(gamma)x-sin(gamma)y;sin(gamma)x +cos(gamma)y;z)]\ \ 
    =& -sin(gamma)(partial_z partial_x f)+cos(gamma)(partial_z partial_y f) $

    $ partial_z^2 [ (exp(gamma J_z)f)mat(x;y;z)] = partial_z^2 [f mat(cos(gamma)x-sin(gamma)y;sin(gamma)x+cos(gamma)y;z)] = (partial_z^2 f) $
    (Note: The final expression indicates doing the differential operators first, then evaluate with $exp(gamma J_z)mat(x;y;z)$. Because there's no enough space we'll temporarily ignore the input).

    Hence, if consider $g := exp(gamma J_z) f$, we get the following for $Delta_"sph" g$:
    $ Delta_"sph" g =& (y^2+z^2)(partial_x^2 g)+(x^2+z^2)(partial_y^2 g)+(x^2+y^2)(partial_z^2 g)\ 
    &-2x y(partial_x partial_y g)-2x z(partial_x partial_z g)-2y z(partial_y partial_z g)\ 
    &-2x(partial_x g)-2y(partial_y g)-2z(partial_z g)\ 
    =& (y^2+z^2)(cos^2(gamma) (partial_x^2 f)+ 2sin(gamma)cos(gamma) (partial_x partial_y f)+sin^2(gamma)(partial_y^2 f))\ 
    &+ (x^2+z^2)(sin^2(gamma) (partial_x^2 f)- 2sin(gamma)cos(gamma) (partial_x partial_y f)+cos^2(gamma)(partial_y^2 f))\ 
    &+ (x^2+y^2)(partial_z^2 f) - 2x y(sin(gamma)cos(gamma)(partial_y^2 f - partial_x^2 f)+(cos^2(gamma)-sin^2(gamma))(partial_y partial_x f))\ 
    &-2x z(cos(gamma)(partial_z partial_x f)+sin(gamma)(partial_z partial_y f))-2y z(-sin(gamma)(partial_z partial_x f)+cos(gamma)(partial_z partial_y f))\ 
    &-2x(cos(gamma)(partial_x f)+sin(gamma)(partial_y f))-2y(-sin(gamma)(partial_x f)+cos(gamma)(partial_y f)) - 2z(partial_z f)\ \ \ \ 
    =& (sin^2(gamma)x^2+cos^2(gamma)y^2+2 sin(gamma)cos(gamma)x y+z^2)(partial_x^2 f)\ 
    &+(cos^2(gamma)x^2+sin^2(gamma)y^2-2 sin(gamma)cos(gamma)x y+z^2)(partial_y^2 f)\ 
    &+(x^2+y^2)(partial_z^2 f)\ 
    &-2((x^2-y^2)sin(gamma)cos(gamma)+(cos^2(gamma)-sin^2(gamma))x y)(partial_x partial_y f)\ 
    &-2 (cos(gamma)x z-sin(gamma)y z)(partial_x partial_z f) -2 (sin(gamma)x z +cos(gamma)y z)(partial_y partial_z f)\ 
    &-2(cos(gamma)x-sin(gamma)y)(partial_x f)-2(sin(gamma)x+cos(gamma)y)(partial_y f) - 2z(partial_z f)\ \ \ \ 
    =& exp(gamma J_z)(Delta_"sph" f) $
    For reference, one can go back to equation (5.12) to compare the terms.

    So, we conclude that $Delta_"sph" g = Delta"sph"(exp(gamma J_z)f) = exp(gamma J_z)(Delta_"sph" f)$ for all $gamma in RR$. The other two elementary rotation matrices also follow similar calculation (here we don't have enough space so we'll skip it). Hence the Spherical Laplace Operator is invariant under $SO(3,RR)$ action (or the rotation action of inputs).
]