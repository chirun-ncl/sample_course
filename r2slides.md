---
toc: false
reveal-theme: white
css:
  - custom.css
---

# Today's Topics

 * Practical 1 recap
 * Applying vectors to problems
 * Data Frames
 * R Script best practices

# Recap

## Logical

Question: What is a logical? Why would you need to set one up, like this?

```{.R data-code-dir="input"}
x = TRUE
```

. . . 

Reminder: A logical is something that can be either TRUE or FALSE.

Some context helps:

```{.R data-code-dir="input"}
isTodayTuesday = TRUE
```

. . .

```{.R data-code-dir="input"}
isTuesday = c(FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE)
```

---

## Vectors

Initialise vectors with the function `c()`
```{.R data-code-dir="input"}
c(4,2,6,3)
```
```{.R data-code-dir="output"}
[1] 4 2 6 3
```

. . .

The colon operator, `a:b`, great for incrementing by 1 or -1
```{.R data-code-dir="input"}
2:6
```
```{.R data-code-dir="output"}
[1] 2 3 4 5 6
```

. . . 

The `seq()` function, which is more flexible
```{.R data-code-dir="input"}
seq(0,3,by=0.5)
```
```{.R data-code-dir="output"}
[1] 0.0 0.5 1.0 1.5 2.0 2.5 3.0
```

---

There are other ways of generating vectors; random numbers and distributions.

More on those when we come to plotting!

---

## Vector Manipulation

Function            Description
-----------------   -------------------
length()            Number of elements
sum()               Sum the vector's elements
mean()              Mean of the vector's elements
sort()              Sort the elements
rev()               Reverse the order of the elements
range()             Return a vector containing the maximum and minimum element

. . . 

...and there are many more build-in functions which can act on vectors.

---

We can access an element in a vector via its index:
```{.R .editable .runnable}
x = 4:10
x[2]
```

 . . . 

Apply queries to take a sub-set of values

```{.R .editable .runnable}
x = 4:10
x[x>5]
```

 . . . 

 Vector arithmetic is straightforward

```{.R .editable .runnable}
x = 4:10
x*x
```

---

## Example

Calculate the following series sum,

$$ S = \sum\limits_{k=1}^{50} k^3. $$

 . . .

```{.R data-code-dir="input"}
k=1:50
```
```{.R data-code-dir="output"}
[1] 1 2 3 4 5 ...
```

```{.R data-code-dir="input"}
v=k^3
```
```{.R data-code-dir="output"}
[1] 1 8 27 64 125 ...
```

```{.R data-code-dir="input"}
sum(v)
```
```{.R data-code-dir="output"}
[1] 1625625
```

----

## Logical Operators

In this table assume that `x=3`

Operator    Tests for                Example    Returns
---------   ------------             ---------  ------------
`==`        Equality                 `x == 3`   `TRUE`
`!=`        Inequality               `x != 3`   `FALSE`
`<`         Less Than                `x < 3`    `FALSE`
`>`         Greater Than             `x > 2`    `TRUE`
`<=`        Less Than or Equal to    `x <= 3`   `TRUE`
`>=`        Greater Than or Equal to `x >= 4`   `FALSE`

----

We can combine these with the `&` (and) or `|` (or) operators:

```{.R data-code-dir="input"}
x < 2 | x > 4
```
```{.R data-code-dir="output"}
[1] FALSE
```
 . . .

```{.R data-code-dir="input"}
x == 3 & x > 6
```
```{.R data-code-dir="output"}
[1] FALSE
```

 . . .

and apply this to vectors to return only certain values

```{.R data-code-dir="input"}
x = 5:10
x[ x < 7 | x == 10 ]
```
```{.R data-code-dir="output"}
[1] 5 6 10
```

----

## Matrices

A quick note on matrices: the function `matrix()` creates a matrix from a set of values.

The function takes the matrix values, number of rows and number of columns as arguments, along with the argument `byrow`.

. . .

```{.R .runnable .editable .slides-lrg}
matrix(c(5,2,3,1,4,8),nrow=3,ncol=2,byrow=TRUE)
```

 . . .

```{.R data-code-dir="input"}
dim(m)
```
```{.R data-code-dir="output"}
[1] 3 2
```

# From Matrices to Data Frames

Rather than working with matrices, we will often work with a different R object called a Data Frame. It has a similar structure:

 . . .

$$ \begin{pmatrix} 5&2\\3&1\\4&8\end{pmatrix}\qquad \begin{matrix}\text{Cakes}&5\\\text{Muffins}&2\\\text{Cookies}&189\end{matrix}$$

 . . .

Data frames can contain more that one type of data. They are also constructed in a different way.

----

Suppose we have the following table:

Name        Days      Season     Bank Holidays
---------   -------   ---------  ----------------
January     31        Winter     TRUE
Feburary    28        Winter     FALSE
March       31        Spring     TRUE
April       30        Spring     FALSE
May         31        Spring     TRUE
June        30        Summer     FALSE
...

------

We put each column into a vector

```{.R}
> name = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

> days = c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)

> season = c("Winter", "Winter", "Spring", "Spring", "Spring", "Summer", "Summer", "Summer", "Autumn", "Autumn", "Autumn", "Winter", "Winter")

> bankHols = c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE)
```

 . . . 

We can then query, for example, how many days in the 4th month:

```{.R data-code-dir="input"}
days[4]
```
```{.R data-code-dir="output"}
[1] 30
```

----

We then create our data frame (let's call it `df`) like this:

```{.R data-code-dir="input"}
df = data.frame(name, days, season, bankHols)
df
```
```{.R data-code-dir="output"}
       name days season bankHols
1   January   31 Winter     TRUE
2  Feburary   28 Winter    FALSE
3     March   31 Spring     TRUE
4     April   30 Spring    FALSE
...
```

-----

Querying data frames can be done using the usual logical operators.

For example: What months are in spring?

. . .

```{.R data-code-dir="input"}
df[df$season=="Spring",]
```
```{.R data-code-dir="output"}
       name days season bankHols
3     March   31 Spring     TRUE
4     April   30 Spring    FALSE
5       May   31 Spring     TRUE
```

 . . .

Which months have bank holidays?

```{.R data-code-dir="input"}
df[df$bankHols,]
```
```{.R data-code-dir="output"}
        name days season bankHols
1    January   31 Winter     TRUE
3      March   31 Spring     TRUE
5        May   31 Spring     TRUE
8     August   31 Summer     TRUE
12  December   31 Winter     TRUE
```

---- 

## Sample Datasets

R comes with many sample datasets in the form of data frames. These can be loaded with the `data()`:

```{.R data-code-dir="input"}
data("Orange")
Orange
```
```{.R data-code-dir="output"}
   Tree  age circumference
1     1  118            30
2     1  484            58
3     1  664            87
4     1 1004           115
...
```

----

A full list can be seen by running the `data()` function with no arguments

```{.R data-code-dir="input"}
data()
Orange
```
```{.R data-code-dir="output"}
Data sets in package ‘datasets’:

AirPassengers           Monthly Airline Passenger Numbers
BJsales                 Sales Data with Leading Indicator
BJsales.lead (BJsales)  Sales Data with Leading Indicator
BOD                     Biochemical Oxygen Demand
CO2                     Carbon Dioxide Uptake in Grass Plants
...

```

----

## Some more interesting data

![The IMDb](./build/static/images/imdb.png){width=80%}


----

# R Scripts

Last week we introduced the idea of opening up an R script in which to type commands.

 . . . 

A reminder: Open a script by going to *File -> New File -> R Script*

 . . . 

The script window in R provides a text editor to type commands in, allows you to save scripts, and shows buttons 
 to run part or all of the commands you have written.

 . . .

Save a file with *File -> Save As...*

---


## R Script Best Practices

Before you start saving files, it's a good idea to think about the following:

 * **File Organisation**: Where will you save your file? Think about sensible folders for your work.
 * **File Names**: `Untitled42.R` is not a very useful file name...
 * **Commenting**: Would you know what your code does when you come back to it in a month? A year?
   And what about when you collaborate later in the course? Will your colleagues understand it?

----

## Code Comments Example

```{.R .slides-small}
my_vector = c(2,5,3,9,12,4,5,8,11,6)
count = 0
for (value in my_vector) {
	if(value %% 3 == 0) {
		count = count + 1
	}
}
print(count)
```

----

```{.R .slides-small}
# This program sets up a vector and counts the
# elements that divide by 3

# Create a vector with 10 elements
my_vector = c(2,5,3,9,12,4,5,8,11,6)

# Initialise count and loop through the elements of the vector
count = 0
for (value in my_vector) {
	if(value %% 3 == 0) {
		count = count + 1  # Add 1 to count if the element divides by 3
	}
}
# Print out the final count
print(count)
```

----

```{.R .slides-small}
# This program sets up a vector and counts the
# elements that divide by 3

# Create a vector with 10 elements


# Initialise count and loop through the elements of the vector



                           # Add 1 to count if the element divides by 3


# Print out the final count

```

# Lecture 2 Summary

We have covered the steps to move from working with vectors to data frames. 
Many of the same operations apply: in particular we need to be able to manipulate and query objects, including using
logical operators.

. . .

In the next practical we will get lots of practice with these ideas, working with the `movie`/`tv` data frames.
