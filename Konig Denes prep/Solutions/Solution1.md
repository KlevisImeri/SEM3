 ![](Pasted%20image%2020231228220030.png)
Proof:
Let G=G(A,B,E)=B(n,n). Vertices a are in A and  b are in B.
Add edges $a_ib_j$ to G (keeping it bipartite) until you get a Hamiltonian path. Because the graph G' is bipartite this implies you have an alternating $H_p$: $a_0b_0a_1b_{1}\dots a_{n}b_{n}$.
> G' is a supergraph of G.

![](Pasted%20image%2020231228221445.png)

Now we can see if $d(a_0)+d(b_n)\geq n+1$ => we get the $H_c$. Because the edges will cross and you can form the $H_c$. 

![](Pasted%20image%2020231228223507.png)

![](Pasted%20image%2020231228223440.png)
The
More precisely if $d(a_0)+d(b_n) < n+1$ you can connect the edges from $a_0$ closer to it (b_0, b_2..) and the edges $b_n$ closer to it (a_n, a_n-1, ...). 

We added the edges to form the $H_p$ now we should remove theme.
We know that all edges which are not connected hold the $d(a_i)+d(b_j)\geq n+1$. So our 'red' $H_c$ will still be there. We remove $a_0b_0$. You can rearrange:

![](Pasted%20image%2020231228224353.png)

You are at the same step as previously. Now you do it recursively until you have removed all the edged edges (the 'blue' $H_p$). You are left with a $H_c$ if all the vertices not between sets have $d(a_i)+d(b_j)\geq n+1$.

> You can also use the closure of G instead of recursion

Note:
> All the theorems for proving sufficiency (if condition hold => $H_c$) have an equivalent in the B(n,n) graph. The one we proved was 'Ore's Theorem for bibartite graphs'. You can easely derive the Dira's from Ore's (just take $\forall a,b~~~d(a)=\frac{n}{2} ~d(b)=\frac{n}{2}$)
