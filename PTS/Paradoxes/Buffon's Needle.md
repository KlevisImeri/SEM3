
PDF for the distance from the line and the angle of the needle are uniform distributions so we have:
$$
f_x=
\begin{cases}
	\frac{1}{L},\quad [0,L] \\ 
	0, \quad otherwise
\end{cases}
$$
$$
f_\alpha =
\begin{cases}
	\frac{2}{\pi},\quad [0,\pi/2] \\ 
	0, \quad otherwise
\end{cases}
$$

This is the setup for one line:

![[Pasted image 20231016230206.png|500]]

Mathematically we want:
$$P(X\leq cos(\alpha)\frac{L}{2})$$
We know that $f_x$ and $f_\alpha$ are independent so our space is:

![[Pasted image 20231016230650.png|500]] 

From the condition $X\leq cos(\alpha)\frac{L}{2}$ we have:

![[Pasted image 20231016230840.png|500]]

Now setting up the integral:
$$P\left(x\le\cos\left(\alpha\right)\frac{L}{2}\right)=\int_{\ 0}^{\frac{\pi}{2}}\int_{0}^{\cos\left(\alpha\right)\frac{L}{2}}f_{x}f_{y}dxd\alpha=\int_{\ 0}^{\frac{\pi}{2}}\int_{0}^{\cos\left(\alpha\right)\frac{L}{2}}\frac{1}{L}\frac{2}{\pi}dxd\alpha=\frac{1}{\pi}$$
So now if we look at our whole space we have created a partition with the same probability. From the symmetry we have in fact:
$$ P(that~~the~~needle~~touches~~the~~line)=n\frac{1}{\pi}$$

![[Pasted image 20231016231746.png|600]]

From this you can easily derive the most important constant $\pi$.

Notes:
It is very beautiful how you can derive $\pi$ from such random multiple events.

Here is the link to the Desmos graph for the paradox I created:
https://www.desmos.com/calculator/beylt2qnau
