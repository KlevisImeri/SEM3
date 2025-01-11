They are some edges in G where c(e)=x.
We will c(e)=x edges e'.
```
33-22=11
c(e')=x=33 edges each. 
```
This tells us that after me raised the capacity of some edges for 11 we could only send 9 more units of flow through the network. So even if this flow went through e' edges still it wouldn't use all the capacity of these edges => that our flow has a bottleneck not on the e' edges => even if we raise the capacity of this edges further they wont have any affect in how much more flow we can put in => M(33)=M(42)=1243.

More formally: 

> In M(33), f(e)<c(e) for all e' edges 

Proof direct:
Lets think of all augmenting paths in M(22). They may have 0,1 or many 
c(e')=x=2 edges each. To get from M(22)=>M(33) we raise capacity of e' by 11. By doing this we at most put +9 flow through the network, because M(22) and M(33) are max flows. This flow should have gone through some of the augmenting paths in M(33). 
1. If e' was part of these augmenting paths than f(e')=f(e')+9 but the capacity was raised by 11 c(e')=c(e')+11 =>  f(e')<c(e')  (Using f(e)$\leq$c(e))
3. If e' was NOT part of these augmenting paths than the flow stays the same and the capacity was raised by 11 => f(e')<c(e')

> If we still increase the c(e')=33->42 we still cant put more flow through the augmenting paths. 

Proof contradiction: 
If we could than we would at least be able to put +1 flow through the augmenting path in M(42). If we did than we would have been able to do it for same augmenting path in M(33), because  f(e')<c(e') and the capacity of the other edges has not changed. But for M(33) we could not do that because M(33) is a max flow. 

=> M(33)=M(42)=1243.



