#import "../../macros.typ": *

//start document
#maketitle(
  title: "Math 237A HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= ND//1
#problem[Statement][
  
  Proof
]

= ND//2
#problem[][]

= ND//3
#problem[
  Hartshorne Chapter 1 Exercise 1.1 (a),(b):

  (a) Let $Y$ be the plane curve $y=x^2$ (i.e. $Y$ is the zero set of the polynomial $f=y-x^2$). Show that $A(Y)$ (or $k[Y]$) is isomorphic to a polynomial ring in one variable over $k$.

  (b) Let $Z$ be the plane curve $x y=1$. Show that $A(Z)$ (or $k[Z]$) is not isomorphic to a polynomial ring in one variable over $k$.
][
  
  (a): Let ideal $I = (y-x^2) subset.eq k[x,y]$, then the coordinate ring $k[Y] = k[x,y]\/I$. Now, consider the following map $phi:k[x,y] arrow.r k[t]$ (where $t$ is a formal variable) by $phi(f(x,y)) = f(t,t^2)$, which $phi$ is a ring homomorphism since given any $f(x,y), g(x,y) in k[x,y]$ we have:
  $ phi(f(x,y) dot g(x,y)) = f(t,t^2) dot g(t,t^2) = phi(f(x,y)) dot (phi(g(x,y)) $
  Notice first that $phi$ is surjective, since for all $f(t) in k[t]$, the corrsponding $f(x) in k[x] subset.eq k[x,y]$ satisfies $phi(f(x)) = f(t)$, hence $k[t] tilde.equiv k[x,y]\/ ker(phi)$. 

  Now, we aim to show that $ker(phi)=I$: Given any polynomial $f in I = (y-x^2)$, since $f = g(x,y)(y-x^2)$ for some $g(x,y) in k[x,y]$, it satisfies:
  $ phi(f) = phi(g(x,y)(y-x^2)) = g(t,t^2)(t^2-t^2) = 0 $
  Hence, $f in ker(phi)$, showing $I subset.eq ker(phi)$. And, 

  \ 

  (b): 
]