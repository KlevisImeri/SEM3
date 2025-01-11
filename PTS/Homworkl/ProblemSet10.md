

## Questions
---
1. 7.b should be $2x^2+7/2$
2. 12 I think i solved it very different because I don't see what kind of theorem should be used there regarding the recitation.
3. 13 could not solve.
4. 14 I think I am right but not sure.
5. 17 hot to i turn the integral to the form of the $\Phi$?
## 12
---
- 1 get out P(1)=1/3  
- 2 --> P(2 and 3)=2/3   
- 3 --> send you back   
231 => 2.5\*2 + 1 = 6
> On average you need wait 2.5 times to get back

X:= the amount of time needed to get out
Y:= the number of times i picked till i get
$Y \sim Geo(1/3)$
$E(Y)=3$
$E(X)=E(2.5(Y-1)+1)=6$



## 13.
---
$Var\left(aX+b\right)=a^{2}Var\left(X\right)$
$E\left(aX+b\right)=aE\left(X\right)+b$
$Var\left(3X+2Y\right)=9Var\left(X\right)+4Var\left(Y\right)=13$
$V\sim N(0,13)$
$W\sim N(0,5)$

$$Cov(3X+2Y, 2X-Y)=Cov(3X,2X)+0+0+Cov(2Y,Y)\neq 0$$
$$E(V|W)=\int_{Range\left(V\right)}^{ }vf_{V|W}(v|w)dv$$
$$f_{V|W}(v|w)=\frac{f_{V,W}(v,w)}{f_{W}(w)}$$
E(3X+2Y|2X-Y)
3X+2Y=(2X-Y)+X+3Y


## 14.
---
$X~Pois(\lambda)$:= the number of costumers calling a day = the number of costumers in the que.
$1_f$
Y:= the number of woman in the que.
$Y|X \sim Bin(X,p)$
$E[Y|X]=Xp$
$Var(Y|X)+E^2(Y|X)=E(Y^2|X)=Xp(1-p)+(Xp)^2$

## 15.
---
$$f_y= \begin{cases}
1\ \ \ (0,1) \\
0 \ \ \ otherwise
\end{cases}$$$$F_{X|Y}(x)= \begin{cases}
1 \ \ \ y<x\\
\frac{{x-y^2}}{y-y^2}\ \ \ x<y<\sqrt{ x } \\
0 \ \ \ y>\sqrt{ x } 
\end{cases}$$
$$F_x(0.5)=  \int_{-\infty}^{\infty} F_{X|Y}(0.5|Y=y)f_{Y} \, dy$$
$$\int_{0}^{0.5}1*1dy+\int_{0.5}^{\sqrt{0.5}}\frac{\left(0.5-y^{2}\right)}{y-y^{2}}*1dy=0.6130$$


## 16.
---
X:= the probability that the coin lands in heads.
$f_{X}(x) = 6x − 6x^2 \ \ \ (0,1)$
Y:= the number of heads
$Y|X \sim Bin(4,X)$
$$P(Y=2)=\int_{-\infty}^{\infty}P(Y=2|X=x)f_{X}dx=\int_{0}^{1}\binom{4}{2}(x)^{2}(1-x)^{2}\left(6x-6x^{2}\right)dx=0.2571$$

## 17.
---
T:= the time in which a security bug is detected.
$$F_{T}(t)=\begin{cases}
1 − e^{−t^2/2} \ \ t > 0,\\
0 \ \ \ otherwise.
\end{cases}
$$
$$f_{T}(t)=\begin{cases}
te^{−t^2/2} \ \ t > 0,\\
0 \ \ \ otherwise.
\end{cases}
$$
E:= exploitation
$P(E|T)=1-e^{-t}$ 
$$P\left(E\right)=\int_{-\infty}^{\infty}P(E|T=t)f_{T}\left(t\right)dt$$
$$=\int_{0}^{100}\left(1-e^{-t}\right)te^{-\frac{t^{2}}{2}}dt=0.6557$$
## 18.
---
T:= the time the tourist spends
T~U(1/2,3/2)
$f_T=1 \ \ [1/2,3/2]$
V:= catch virus
$P(V|T=t)=\left(t-\frac{1}{2}\right)^{2}$

$$P(V) = \int_{\frac{1}{2}}^{\frac{3}{2}}\left(t-\frac{1}{2}\right)^{2}\cdot1dt=\frac{1}{3}$$
