## Foo

```python
print("hello world")
```

---

## Bar
* test
* test

---

## Foo
```python
print("hello world")
```

---

## Bar
* test
* test

---

# Runnable code test

This is some test octave code. Some $inline maths$.

$$This is some maths$$

---

## The code

```matlab
A = [1 2 0; 2 5 -1; 4 10 -1]
```
```output
Some output
```

```runnable lang="matlab"
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

---

R code

```runnable lang="r" gutter-symbol=">>>"
x<-c(1,2,3,4,5)
which(x>3)
```

---

Python code

```runnable lang="python"
x = 5
if x==5:
	do_something(123)
```

```runnable lang="python"
x = 5
if x==5:
	do_something(123)
```
