Lemma 1:
G connected => the two vertices corresponding to deg 1 are not connected together.
Proof contradiction:
If they were than you would have and edge as a component of the graph => G is not connected. This a contradiction.


Let us name the deg 1 vertices v and u. We remove v and u from the graph. Than according to the degree sequence all the vertices left have degree 4 accept the vertices v and u where connected to. We will call them v' and u' respectively. Then we will have two cases:
1. deg(v')=3 and deg(u')=3.
2. v'=u' deg(v')=2

***For case 1***
- If there is not edge v'u'
	Add a edge between v' and u'. Here Dirac condition holds $\forall v \in G''$ $deg(v)=4\geq \frac{|V(G')|}{2}=\frac{8}{2}=4$ so G'' has a $H_c$. Now the new edge added may or may not be in the $H_c$. If it isn't than using lemma 1 we know that u and v will be connected to the $H_c$. To form a spanning graph for G we remove and edge from $H_c$ forming a $H_p$ and use the edges connecting v and u to $H_c$. If it is than removing it we will have a $H_p$=v'...u' => we have $H_p$ = $ST$ = vv'....u'u in G which is a ST with 2 leaves(<4).

![](Pasted%20image%2020240110191442.png)
- If there is already and edge v'u'
	Then v' and u' have to 2 edges each connecting to the rest of the graph. You can remove one of them, lets remove v'. Because the graph is connected the 2 edges connected to the rest graph point to different vertices because the graph G is simple (=> G' too ,we never added an edge, we just removed) => we get the degree sequence 2, 3, 3, 4, 4, 4, 4.
	- If deg=2 vertex is NOT connected to both deg=3 vertices 
		Then we connect deg=2 vertex to one of deg=3 and we get 3, 3, 4, 4, 4, 4, 4 as a degree sequence. The ore's condition holds here => $H_c$. We use $H_c$ to build a ST with <4 leaves as shown below![](Pasted%20image%2020240121230608.png)
	- If deg=2 vertex is connected to both deg=3 vertices
		Then we can remove the deg=2 and we get 2, 2, 4, 4, 4, 4 as a degree sequence.
		- if the deg=2 vertices are or are not connected than the ore's condition holds either way (2+4=6=n). We know that the deg=2 vertices are connected to u' and v' so there is a paths vv'to deg=2 and uu' to deg=2. Therefore they are connected to the $H_c$ => you can form an ST with 3 leaves.![](Pasted%20image%2020240122000040.png) 


***For case 2***
From G' remove the v'=u' and you are left with the deg sequence 3, 3, 4, 4, 4, 4, 4. The Ores condition holds here => G'' has a $H_c$. Let the removed u' be connected to $u_1$ and $u_2$. If the edge $u_1u_2$ is in $H_c$ than you can from a ST of 3 leaves (v,v and $u_2$) as shown below. If $u_1u_2$ is not in $H_c$ than the the same method of producing ST of 3 leaves will work as shown below.
![](Pasted%20image%2020240121204856.png)

