# Test
This is some test octave code.

## The code

```{.octave .runnable .editable}
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

```{.R .runnable .editable}
x<-c(1,2,3,4,5)
which(x>3)
```