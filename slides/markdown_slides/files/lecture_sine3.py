"""
Multiple sin plot using for loop
"""
import numpy as np
import matplotlib.pyplot as plt

# New figure (increase figure size)
fig = plt.figure(figsize=(20, 10))

# Bigger font
plt.rcParams.update({'font.size': 30})

# Set up x and y
x = np.linspace(0, 6, 200)

# Create 3 plots in a loop
for i in range(1, 4):
    plt.plot(x, np.sin(i*x))

# Set title and axis labels
plt.xlabel('x')
plt.ylabel('y')
plt.title('y = sin(i*x), for i=1,2,3')

# Show the plot
plt.show()

# Tighter margins
plt.tight_layout()

# Set your own filename/directory here
fname = "lecture_sine3.png"
fdir = "/Users/georgestagg/work/coursebuilder/PHY1030/week3/images/"

# Save the file
fig.savefig(fdir+fname, facecolor=(1, 1, 1, 0.8), transparent=True)
