### QoS and SE
---
 > Quality of service
 > Spectral efficiency  [bit/sec/HZ]

QoS = f(resources) | depends on the resources you posses
### Error Control Codes
---
> How to communicate reliably over an unreliable channel 

$P\left(error\right)\le10^{-\gamma}$
$\gamma$ - QoS parameter

Error:
- random
- independent (no memory of the previous error)
- depends on the signal energy

#### Binary Model
---
BSC - binary symmetric channel

Additive model
> $u,e \in \{0,1\}$
> ${u} \oplus {e}=v$ 

The idea is that we are using bits to represent the information and than watching what happens when the error come in. We model it as an additive channel.  You are adding bits modulo 2.  Every time the e = 1 the bits flip and the error ocurres.

$0\leq P_a < 0.5$   -  you can invert it so it can never be grater than 0.5

#### Vectorial Channel
---
> $\hat{u},\hat{e} \in \{0,1\}$
> $\hat{u} \oplus \hat{e}=\hat{v}$




Attack Types: https://en.wikipedia.org/wiki/Attack_model 

Lecture 12
$\lceil \log_2{10} \rceil+\lceil \log_2{11} \rceil+\lceil \log_2{32} \rceil$