---
title: Code Test
tags: MAS0000
---

# Test
This is some test octave code.

## The code

```{.octave .runnable}
A = [1 2 0; 2 5 -1; 4 10 -1]
B = A'
C = A * B
C = A .* B
b = [1;3;5]
x = A\b
r = A*x - b
eig(A)
svd(A)
p = round(poly(A))
roots(p)
q = conv(p,p)
```


# Adding Slides
## Some Slides
Here are some embedded slides!
{%slides
GwI2wDgTgdhBaAZsAjAE3gFgKYGYCs8IAxgfAEzBpoqIrD6RpA==
%}