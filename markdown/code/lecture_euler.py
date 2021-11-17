"""
Solution to an ODE using Euler's Method
"""
import numpy as np
import matplotlib.pyplot as plt

# New figure (increase figure size)
fig = plt.figure(figsize=(20, 10))

# Bigger font
plt.rcParams.update({'font.size': 30})

# A function for the RHS of the ODE
def f(y):
    return -y/2

# Time step
h = 0.5

# Initialise y and set value when t = 0
y = np.zeros(20)
y[0] = 5

# For loop to calculate remaining values
for n in range(1, 20):
    y[n] = y[n-1]+h*f(y[n-1])

t = np.arange(0, 10, 0.5)

plt.plot(t,y)
    
# Add axis labels, title, legend
plt.xlabel('$t$')
plt.ylabel('$y(t)$')

# Tighter margins
plt.tight_layout()

# Set your own filename/directory here
fname = "lecture_euler.png"
fdir = "/Users/georgestagg/work/coursebuilder/PHY1030/week3/images/"

# Save the file
fig.savefig(fdir+fname, facecolor=(1, 1, 1, 0.8), transparent=True)
