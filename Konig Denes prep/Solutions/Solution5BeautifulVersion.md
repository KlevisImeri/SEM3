**Lemma1:**
> Both edges e22 e11 should be cut by all the min cuts. 
> ($\forall C$  $u_1$ and $u_2$ $\in$ S and $v_1$ and $v_2$ $\in$ T )

Proof contradiction:
If they didn't than when we raised the capacities the maximum flow would not have increased because there would have existed a min cut which capacity value did not change. But the max flow value increased. This is a contradiction.

**Lemma2:**
> Even after raising the capacity for e22 and e11 all the min cuts still remained min cuts.

Proof:
Before: c(min cuts)=val($f_{min}$)
After raising the capacity: val($f_{min}'$)=c($C_{min}'$)=c(min cuts)+the new capacity.

**Corollary:**
> The second largest capacity of a cut (int original graph) differs by >=+(2\*32) from the value of the min capacity.


This tells us that until we don't change the capacity of the min cuts more than >=+(2\*32) the flow will change the same amount.

The e12 and e21 also are cut by all the min cuts ($\forall C$  $u_1$ and $u_2$ $\in$ S and $v_1$ and $v_2$ $\in$ T ) => changing their value changes the min capacity of the cut.

=> max(f)=21+31-13=39.
