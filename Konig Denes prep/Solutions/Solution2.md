![](Pasted%20image%2020231228225812.png)

Proof:
Add vertex and connect it to every other vertex so you get G' with n=102 and all the old vertices have deg=51 and the new one 102. Now the ores condition holds (51+51=102=n) => G' is H.
![](Pasted%20image%2020231228231813.png)

Now we have two option how the edges of $v_0$ and $v_{100}$ are lays out:
1. They cross each other => immediately $H_c$.
> As mentioned in solution of 1 you if one edge crosses you will always find the cut where the 2 sets meet so you can from the $H_c$.

![](Pasted%20image%2020231228232736.png)

2. The edges are very packed together so they don't cross each other. (50+50=100-2+1) The edges will met at $v_{50}$ but they wont cross.
Now we use the 50-regular property. The idea we find and edge from the first subgraph to the second as shown in picture.
![](Pasted%20image%2020231228233940.png)
We know such an edge should exits because the only way $S_1$ has no edges going out of it is if you have a $K_{50}$, but the vertex $v_{50}$ connects to $S_2$ which implies that S1 can not form a $K_{50}$ => there is an edge between $v_i$ and $v_j$ (0<i<50, 50<j<100). Using that edge you can form the $H_c$ as shown below (You can also remove the new vertex we added cause we only needed it to prove that the G has a $H_p$):

![](Pasted%20image%2020231228234904.png)

Note:
> This is just the Nash-Williams theorem for k=50. What we did works generally for any k.
> Every k-regular graph on 2k+1 vertices is Hamiltonian.