 TARGET DECK: SEM3::CT::Mindterm

> #of roots of any polynomial $\alpha(x)$ over a finite field $\leq$ deg($\alpha(x)$) 
$$\text{\#roots}\leq deg(\alpha(x)) $$

Orientation
--

What are the constrains (resources) we need to work with? #flashcard 
- Radio Spectrum (bandwidth)
- Energy (transmission power)
<!--ID: 1698832836407-->


What is Spectral Efficiency and how is it measured? #flashcard 
- It is measure of how efficient data is transmitted of a given frequency spectrum (bandwidth)
- $$\frac{(\frac{bit}{sec})}{Hz} = \frac{\text{how much data}}{\text{bandwith}}$$
<!--ID: 1698832836421-->

What does QoS mean? 
And what is the function? #flashcard 
- QoS: quality of service
- QoS = f(resources)
<!--ID: 1698832945496-->



Error Control Coding
--

### Basics

How to communicate reliably in formula? 
And what is $\gamma$? #flashcard 
- $$P(error) \leq 10^\gamma = QoS$$
- The QoS parameter
<!--ID: 1698833374820-->


What are the properties of the error in the channel? #flashcard 
- random
- independent
- it depends on the signal energy (SNR | Signal to Noise Ration) higher energy of signal is better
<!--ID: 1698833374828-->

What is $P_b$?
- Bit Error probability.

### Binary Symmetric model

Why is is called binary symmetric? #flashcard 
- Binary cause $u \in \{0,1\}$
- Symmetric:
$$P_b = P(v=1|u=0)=P(v=0|u=1)$$
<!--ID: 1698833905932-->


What are the limits of $P_b$ in a BSC, Why? #flashcard 
$1 < P_b \leq 0.5$
- Because you can invert the bits so you get $P_b*=(1 -Pb)$
<!--ID: 1698834009728-->


### Binary Vectorial Channel 

What is the distance between two binary vectors?
What is its correlation with the error vector when you have binary vectors? #flashcard 
- The Hamming Distance d(u,v)
- The numbers of positions the vectors differ
- d(u,v)=w(u+v)=w(e)
<!--ID: 1698834966499-->


What is the probability P(v|u)? #flashcard 
size(v) =  n
$$P(u|v)=P_b^{d(u,v)}(1-P_b)^{n-d(u,v)}= \left(\frac{P_{b}}{1-P_{b}}\right)^{w\left(e\right)}\left(1-P_{b}\right)^{n}$$
$$0\le P<0.5\ \to\ \frac{P_{b}}{1-P_{b}}<1\ \to\ \exp\ decrease$$
<!--ID: 1698834966509-->


What is the probability of the error vector w(e)=i? #flashcard 
$$P(w(e)=i)=\binom{n}{i}\left(\frac{P_{b}}{1-P_{b}}\right)^{i}\left(1-P_{b}\right)^{n}$$
<!--ID: 1698836218527-->



What is the probability of error if you correct t errors? #flashcard 
$$P(error)=\sum_{n=t+1}^{n}\binom{n}{i}\left(\frac{P_{b}}{1-P_{b}}\right)^{i}\left(1-P_{b}\right)^{n}\leq QoS$$
<!--ID: 1698836218535-->


What are (code, codeword, error models, Hamming distance, error correction, error detection, code distance, code parameters) Def'n them?

### Binary linear codes

How much does it take if you use 2LUT + 1SEARCH?
And draw the channel with the LUT tables and the search.
- $3 O(2^k)$

What is $d_{min}$ in a code? #flashcard 
$$\forall c_i,c_j \in C~~~~c_i\neq c_j$$
$$d_{min}: \text{min } d(c_i,c_j)$$
<!--ID: 1698837073864-->


How many errors can you correct and how many can you detect why? #flashcard 
detect: $d_{min}-1$  because there are $d_{min}-1$ vectors in between
correct: $$t= \lfloor \frac{d_{min} -1}{2} \rfloor$$ 
flor because if odd then the middle doesn't know where to go
<!--ID: 1708870446189-->



![[Pasted image 20231101121048.png|500]]
<!--ID: 1698837073872-->


What is the Singleton Bound? MDS? #flashcard 
$$d_{min}<= n-k+1$$  
(+1 because you need to include the vector itself)
- MDS - maximum distance seperability:
	- $d_{min} = n-k+1$
<!--ID: 1699201809738-->


What is the hamming bound? Perfect Codes? #flashcard 
$$\sum_{n=0}^{t}\binom{n}{i}\ \le2^{n-k}$$
Perfect codes happen when they are equal.
<!--ID: 1699201809748-->




What are binary linear code? #flashcard 
- Are codes that have a linear map as a mapping function
<!--ID: 1699201809755-->



What is $d_{min}$ in binary linear codes? #flashcard 
$d_{min}$ = $w_{min}$ 
$$d_{min\ }=\min\ d\left(c_{1},c_{2}\right)\ \left(binary\right)\to\ \min d\left(c_{1}+c_{2}\right)\ \left(linear\right)\ \to\min d\left(c_{3}\right)\to w_{min}\left(c\right)$$
<!--ID: 1699201809762-->


Tell me the matrixes of Systematic code? #flashcard 
$$G_{k\times n}=\left(I_{k\times k},\ B_{k\times\left(n-k\right)}\right)$$
$$H_{\left(n-k\right)\times k\ }=\left(B_{\left(n-k\right)\times k}^{T},\ I_{\left(n-k\right)\times\left(n-k\right)}\right)$$
<!--ID: 1699201809768-->


What happens when you multiply a H by c+e transpose? #flashcard 
Syndrome groups?  
every vector is transposed here.
$H\left(c+e\right)=s$ many vectors can land at one s (syndrome)
$$E_s =\{e: He = s\}$$
<!--ID: 1699201809775-->


What is the running time of BLC?
- 1SEARCH the syndrome table -> $O(2^{n-k})$
