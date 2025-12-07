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
  title: "Math 231A HW 9 (Final)",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= ND//1
#problem[
  Etingof Problem Sets 6.2:

  Show that for $frak(g)=gl(n,CC)$, the definition of a semisimple element (an element $x$ such tha t$ad x$ is a semisimple operator) coincides to the usual definition of a semisimple operator.
][
  
]

\ 

= ND//2
#problem[
  Etingof Problem Sets 6.3:

  Show that if $frak(h) subset frak(g)$ is a Cartan subalgebra in a complex semisimple Lie algebra, then $frak(h)$ is a nilpotent subalgebra which coincides with its normalizer $n(frak(h)) = {x in frak(g) | ad x dot frak(h) subset frak(h)}$. (This is the usual definition of a Cartan subalgebra which can be used for any Lie algebra, not necessarily a semisimple one).
][]

\ 

= ND//3
#problem[
  Etingof Problem Sets 6.4:

  Let $frak(g)$ be a complex Lie algebra which has a root decomposition:
  $ frak(g)=frak(h) plus.circle plus.circle.big_(alpha in R)frak(g)_alpha $
  where $R$ is a finite subset in $frak(h)^*\\{0}$, $frak(h)$ is commutatie and for $h in frak(h)$, $x in frak(g)_alpha$, we have $[h,x] = langle h,alpha rangle x$. Show that then $frak(g)$ is semisimple, and $frak(h)$ is a Cartan subalgebra.
][]

\ 

= ND//4
#problem[
  Etingof Problem Sets 6.5:

  Let $frak(h) subset so(4,CC)$ be the subalgebra consisting of matrices of the form 
  $ mat(0,a,0,0;-a,0,0,0;0,0,0,b;0,0,-b,0) $
  Show that then $frak(h)$ is a Cartan subalgebra nad find the corresponding root decomposition.
][]

\ 

#set enum(numbering: "(1)")
= ND//5
#problem[
  + Define a bilinear form $B$ on $W = Lambda^2 CC^4$ by $w_1 and w_2 = B(w_1,w_2)e_1 and e_2 and e_3 and e_4$. Show that $B$ is a symmetric non-degenerate form and construct an orthonormal basis for $B$.
  + Let $frak(g)=so(W,B) = {x in gl(W) | B(x w_1,w_2) + B(w_1,x w_2)=0}$.Show that $frak(g) tilde.equiv so(6,CC)$.
  + Show that the form $B$ is invariant under the natural action of $sl(4,CC)$ on $Lambda^2CC^4$.
  + Using results of the previous parts, construct a homomrphism $sl(4,CC)-> so(6,CC)$ and prove that it is an isomorphism.
][]