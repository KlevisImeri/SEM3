# 1 

$$S_n^2 = \frac{1}{n-1} \sum_{i=1}^{n} (X_i - \bar{X}_{n})^2$$
$$E(S_c^2) = E\left(\frac{1}{n-1} \sum_{i=1}^{n} (X_i - \bar{X}_{n})^2\right)$$  
$$=\frac{1}{n-1} E\left(\sum_{i=1}^{n} (X_i - \bar{X}_{n})^2\right)$$ 
$$= \frac{1}{n-1} E\left(\sum_{i=1}^{n} (X_i^2 - 2X_i\bar{X}_{n} + \bar{X}_{n}^2)\right)$$ 
$$ = \frac{1}{n-1} \sum_{i=1}^{n} \left(E(X_i^2) - 2E(X_i\bar{X}_{n}) + E(\bar{X_{n}}^2)\right)$$ 
$$ =^{1.} \frac{1}{n-1} \sum_{i=1}^{n} \left(E(X_i^2)  - E(\bar{X_{n}}^2)\right)$$ 
$$ =^{2.} \frac{1}{n-1} \sum_{i=1}^{n} (\sigma^2 + \mu^2 -\frac{\sigma^2}{n}-\mu^2)$$
$$ = \frac{1}{n-1} \sum_{i=1}^{n} ( \frac{n-1}{n} \sigma^2)$$
$$ = \sigma^2 $$


---
$$E(\bar{X_{n}}^2)=\frac{1}{n}E((X_{1}+\dots +X_{n})\bar{X_{n}})$$
$$=\frac{1}{n}nE(X_{i}\bar{X}_{n})$$
$$=E(X_{i}\bar{X}_{n})$$
$$ 1.\implies E(\bar{X_{n}}^2)=E(X_{i}\bar{X}_{n})\ \ \ 0<i\leq n$$

---
$$2.\ \ E(\bar{X_{n}}^2)= Var(\bar{X_{n}})+E(\bar{X_{n}}) =^{E(\bar{X_{n}})=E(X_{i})} = \frac{\sigma^2}{n}+\mu^2$$
$$Var(\bar{X_{n}})=\frac{1}{n^2} Var(X_{1}+\dots+X_{n})=^{i.i.d}=\frac{n}{n^2}Var(X_{1})=\frac{\sigma^2}{n}$$

---


# 2

$$S_n^2 = \frac{1}{n-1} \sum_{i=1}^{n} (X_i - \bar{X}_{n})^2$$
$$E(S_c^2) = E\left(\frac{1}{n-1} \sum_{i=1}^{n} (X_i - \bar{X}_{n})^2\right)$$  
$$=\frac{1}{n-1} E\left(\sum_{i=1}^{n} (X_i - \bar{X}_{n})^2\right)$$ 
$$= \frac{1}{n-1} E\left(\sum_{i=1}^{n} (X_i^2 - 2X_i\bar{X}_{n} + \bar{X}_{n}^2)\right)$$ 
$$ = \frac{1}{n-1} \sum_{i=1}^{n} \left(E(X_i^2) - 2E(X_i\bar{X}_{n}) + E(\bar{X_{n}}^2)\right)$$ 

$$ = \frac{1}{n-1} \sum_{i=1}^{n} (\sigma^2 + \mu^2 -\frac{\sigma^2}{n}-\frac{n-1}{n}\mu^2)$$
$$ = \frac{1}{n-1} \sum_{i=1}^{n} \left( \frac{n-1}{n} \sigma^2 + \frac{1}{n}\mu^2 \right)$$


---
$$E(X_i\bar{X}_{n})=\frac{1}{n} E\left( X_{i}^2 + \sum_{j\neq i}^n X_{i}X_{j} \right)$$
$$=\frac{1}{n}(E(X_{i}^2)+ \sum_{j\neq i}^nE(X_{i})E(X_{j}))$$
$$=\frac{\sigma^2}{n}+\frac{n-1}{n}\mu^2\ \ \ i.i.d$$

---
$$E(\bar{X_{n}}^2)=\frac{1}{n}E((X_{1}+\dots +X_{n})\bar{X_{n}})$$
$$=\frac{1}{n}nE(X_{i}\bar{X}_{n})$$
$$=E(X_{i}\bar{X}_{n})$$