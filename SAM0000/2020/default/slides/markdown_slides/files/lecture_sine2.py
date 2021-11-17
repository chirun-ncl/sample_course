"""
Basic sine plot with axis labels
"""
import numpy as np
import matplotlib.pyplot as plt

# New figure (increase figure size)
fig = plt.figure(figsize=(20, 10))

# Bigger font
plt.rcParams.update({'font.size': 30})

# Set up x and y
x = np.linspace(0, 2*np.pi, 100)
y = np.sin(x)

# Make a plot
plt.plot(x, y)

# Set title and axis labels
plt.xlabel('x')
plt.ylabel('y')
plt.title('y = sin(x)')

# Change x limits
plt.xlim(0, 2*np.pi)

# Show the plot
plt.show()

# Tighter margins
plt.tight_layout()

# Set your own filename/directory here
fname = "lecture_sine2.png"
fdir = "/Users/georgestagg/work/coursebuilder/PHY1030/week2/images/"

# Save the file
fig.savefig(fdir+fname, facecolor=(1, 1, 1, 0.8), transparent=True)
