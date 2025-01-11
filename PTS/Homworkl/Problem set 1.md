---

---
---
6 !✅
$$P = \frac{2\binom{10}{7}}{10!}$$

---
7 ✅
- b) because n=101 is an odd number (odd-odd=even | odd-even=odd) and
$$\binom{n}{i}=\binom{n}{n-i}$$
The number of sets with odd cardinality equals the number of sets with even cardinality
so:
P(event) = 1/2

---
5 !!
(I counted one by one for A. I listen them in a triangle table. Is there another way)
$\overline{B}=$ one of the rolls is odd
$\overline{C} =$ no rolls have a 3 on them
a. Use distribution of intersect and then inclusion exclusion(you don't even need it). Than just calculate. P=9/6^3
b. Use distribution and $A\subseteq\overline{B}, C\subseteq\overline{B}$ . P=6/6^3

---
9
a) For each variation  $a_1, a_2, a_3$ there is only one way to rearrange them in increasing order => so we care about the combinations => P(a)=1\\all combinations=1\\$\binom{9}{3}$
b) it should be on of the combinations where 4 is on. P(b)=1\\$\binom{8}{2}$
c) Instead of combinations we have combinations with repeating. (repeating + order doesn't matter or combinations from a multiset)
so for 
P(a*)=1\\$\binom{9-1+3}{3}$
P(b*)=1\\$\binom{8-1+2}{2}$

---
10 ✅
You can take a subset of the grid from x=[0,10] to y=[0,10] because the grid is symmetric everywhere. No if the when you put a circle that means putting the center of it.  Now let there b a circles of diameter 3 around every point. If the center of our circle is there than it contains on of the points. Looking at the grid we choose and calculating the area with respect to the subset (square) we get. P(e)=area of circle \\ area of square = $\pi*1.5^2$\\$100$

---
11 ✅
Every time you toss the coins you have 4 options which is equivalent of rolling a 4 sided dice (unbiased).
HH - 1  HT - 2  TH - 3  TT - 4
No you are tossing this 4 sided dice n times with replacement.
So you are looking for all the variations with replacements from the multiset of {1,2,3,4} which have 1 and 4 into them => P(e) = 1-don't have 1 and 4 ({1,2,3}+{2,3,4}-{2,3})=
$$P(e)=1-\frac{\left(2\cdot3^{n}-2^{n}\right)}{4^{n}}$$

---
12 !!!
No idea

---
13 !
P(A)=(50 5)/(90 5)  P(B)=(45 5)/(90 5)  P(A$\cup$B)=(50+20  5)/(90  5) P(A$\cap$B)=(25 5)/(90 5)  P(B$\cap$C)=(35 5)/(90 5)  P(A$\cup$B$\cup$C)=(15 5)/(90 5)

---
14!
I did it algebraically but they may be a logical easear way
P(A$\cap$B)+P(A$\cap$C)$\leq$ P(A)+P(B$\cap$C)  
P(A$\cap$B)+P(A$\cap$C)-P(A$\cap$B$\cap$C)$\leq$P(A)+P(B$\cap$C)-P(A$\cap$B$\cap$C)
P((A$\cap$B)$\cup$(A$\cap$C))$\leq$P((A$\cup$(B$\cap$C))
P((A$\cap$(B$\cup$C))$\leq$P((A$\cup$(B$\cap$C))
P((A$\cap$(B$\cup$C))$\leq$P(A)$\leq$P((A$\cup$(B$\cap$C))

---
15 ✅
Using quadratic formula to find the discriminant we get that  when $b^2< a$  we have no real roots
$$P(e)=1-\int_0^1x^2dx =\frac{2}{3}$$

---
16 ✅
a) $\left(\frac{3}{4}\right)^{10}$
b) $$\frac{\left(\sum_{n=3}^{10}\binom{10}{k}3^{\left(10-n\right)}\right)}{4^{10}}$$

---
17 !!b
All the possible lottery tickets are $\binom{90}{5}$ 
$$P(a)=\frac{\prod_{n=0}^{19}\left(\binom{90}{5}-n\right)}{\binom{90}{5}^{20}}\approx 1$$
The number of combinations that have 7 on them $\binom{89}{4}$ 
$$P(b)=\frac{\prod_{n=0}^{6}\left(\binom{89}{4}-n\right)\prod_{n=0}^{13}\left(\binom{89}{5}-n\right)}{\binom{90}{5}^{20}}$$
Very high probability that it is not right

---
18 ✅
$$P\left(a\right)=\frac{1}{\sum_{n=1}^{40}n\binom{40}{n}}=\frac{1}{\sum_{n=1}^{40}40\binom{39}{n-1}}=\frac{1}{40\sum_{n=0}^{39}\binom{39}{n}}=\frac{1}{40\cdot2^{39}}$$
$$P\left(b\right)=\frac{\sum_{n=0}^{39}\binom{39}{n}}{40\cdot2^{39}}=\frac{1}{40}$$
or in general 1/n

Using: 
all odd = $\sum_{n=0}^{19}\binom{39}{2n}=\sum_{n=0}^{19}\binom{39}{39-2n}$ = all even     because 39 is odd just like exercise 7b with 101
$$P\left(c\right)=\frac{\sum_{n=1}^{20}\left(2n-1\right)\binom{40}{2n-1}}{40\cdot2^{39}}=\frac{40\sum_{n=0}^{19}\binom{39}{2n}}{40\cdot2^{39}}=\frac{2^{38}}{2^{39}}=\frac{1}{2}=0.5$$
