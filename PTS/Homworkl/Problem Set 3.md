#### 7
x~Binom(n,1/6)
P(x>=2) >= 0.5
1-P(X=0)-P(x=1)>=0.5
$$1-\left(\frac{5}{6}\right)^{n}-n\ \frac{1}{5}\left(\frac{5}{6}\right)^{n}\geq 0.5$$

---
#### 11
a) You know that if we take a sequence of 2n H\\T tosses such that there are 2 tails we have (n 2) combinations. Only one of those combinations is good.
If the sequence would have been odd long that it doesn't work (you can not divide it into to same parts)
Example:
H H H T H H H T  
(lets call this a state with has probability $p^{2}\left(1-p\right)^{\left(2n-2\right)}$ where p=1/2)
If we add up the probabilities of all these states we get:

$$P(e)=\sum_{n=1}^{\infty }p^{2}\left(1-p\right)^{\left(2n-2\right)}=\sum_{n=1}^{\infty}\left(\frac{1}{4}\right)^{n}=\frac{1}{3}$$

b) You can use the one with X and Y where X and Y represent the state HH...T
with distribution Geo(1/2). X and Y are independent so you get:
(The way we did in class)
$$P(e)=\sum_{n=1}^{\infty}\left(p\left(1-p\right)^{\left(n-1\right)}\right)^{2}=\sum_{n=1}^{\infty}\left(\frac{1}{4}\right)^{n}=\frac{1}{3}$$

c) Maybe this is easy way you were talking about. You know that the length should be even (2n) and state HH..THH..T = HH..H HH..T because P(H)=P(T) so you are just have a normal geo distribution with p=1/2 but you are only adding up the terms with even length.
You can:
$$\sum_{n=1}^{\infty}p\left(1-p\right)^{\left(2n-1\right)}=\frac{1}{3}$$
but i can't think about an easier way.

They are just interpretations of the same sum. 
