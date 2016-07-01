# Crude

raw notes. refining ONLY at night, or weekend!

[Welcome | tonic](https://tonicdev.com/dvorak4tzx/5751182573dfd6120061e125)

[TypeScript - JavaScript that scales.](http://www.typescriptlang.org/)

[如何用 TypeScript 提高 JS 工程的健壮性？ - JavaScript - 知乎](http://www.zhihu.com/question/46409682)

[如何看待 Google 和 Microsoft 在 Angular JS 2 和 TypeScript 上的合作？ - 前端开发 - 知乎](http://www.zhihu.com/question/28563233)

Weibo Anti-trafficking

nodejs + browserify

-   [4ker/lut at gh-pages](https://github.com/4ker/lut/tree/gh-pages)

The positive real number λ is equal to the expected value of X and also to its variance

$$\lambda=\operatorname{E}(X)=\operatorname{Var}(X).$$

![**pmf**: The horizontal axis is the index k, the number of occurrences. λ is the
    expected value. The function is defined only at integer values of k. The
    connecting lines are only guides for the eye.](https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Poisson_pmf.svg/488px-Poisson_pmf.svg.png)

![**CDF**: The horizontal axis is the index k, the number of occurrences. The CDF is
    discontinuous at the integers of k and flat everywhere else because a variable
    that is Poisson distributed takes on only integer values.](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Poisson_cdf.svg/488px-Poisson_cdf.svg.png)

-------------------     --------------------------------------------------------------------
Parameters              $λ > 0 (real)$
Support                 $k ∈ ℤ*$
pmf                     $\frac{\lambda^k e^{-\lambda}}{k!}$
CDF                     $\frac{\Gamma(\lfloor k+1\rfloor, \lambda)}{\lfloor k\rfloor !}$, or
                        $e^{-\lambda} \sum_{i=0}^{\lfloor k\rfloor} \frac{\lambda^i}{i!}$, or
                        $Q(\lfloor k+1\rfloor,\lambda)$ (for $k\ge 0$, where
                        $\Gamma(x, y)$ is the incomplete gamma function, $\lfloor k\rfloor$
                        is the floor function, and Q is the regularized gamma function)
Mean                    $\lambda$
Median                  $\approx\lfloor\lambda+1/3-0.02/\lambda\rfloor$
Mode                    $\lceil\lambda\rceil - 1, \lfloor\lambda\rfloor$
Variance                $\lambda$
Skewness                $\lambda^{-1/2}$
Ex. kurtosis            $\lambda^{-1}$
Entropy                 $\lambda[1 - \log(\lambda)] + e^{-\lambda}\sum_{k=0}^\infty \frac{\lambda^k\log(k!)}{k!} (for large \lambda)$
                        $\frac{1}{2}\log(2 \pi e \lambda) - \frac{1}{12 \lambda} - \frac{1}{24 \lambda^2} - \qquad \frac{19}{360 \lambda^3} + O\left(\frac{1}{\lambda^4}\right)$
MGF                     $\exp(\lambda (e^{t} - 1))$
CF                      $\exp(\lambda (e^{it} - 1))$
PGF                     $\exp(\lambda(z - 1))$
Fisher information      $\lambda^{-1}$
-------------------     --------------------------------------------------------------------
