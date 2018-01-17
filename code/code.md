---
title: Code Test
tags: MAS0000
---

# Test
This is some test octave code.

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

# Embedding Extras
**Note: These types of embedding do not translate to the .pdf version very well yet. Perhaps the links can be made better in the future - ngs54** 

## Vimeo
Here is an embedded vimeo video.
{%vimeo
124148255
%}

## Youtube
Here is an embedded youtube video.
{%youtube
CUsPGzA3YEU
%}

## Numbas
Here is an embedded numbas test.
{%numbas
https://numbas.mathcentre.ac.uk/test-yourself/maths-support-diagnostic-test-differentiation/
%}

# Adding Slides
## Some Slides
Here are some embedded slides!
{%slides
GwI2wDgTgdhBaAZsAjAE3gFgKYGYCs8IAxgfAEzBpoqIrD6RpA==
%}