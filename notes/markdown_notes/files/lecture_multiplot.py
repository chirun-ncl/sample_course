"""
f(x)=x*exp(-ax) for different values of a
"""
import numpy as np
import matplotlib.pyplot as plt

# New figure (increase figure size)
fig = plt.figure(figsize=(20, 10))

# Bigger font
plt.rcParams.update({'font.size': 30})

# Vector of x values
x = np.linspace(0, 8, 1000)

# A list for legend labels
leg = []

# Plot with different a values
for a in range(1, 6):
    plt.plot(x, x*np.exp(-a*x))
    leg.append("a = "+str(a))
    
# Add axis labels, title, legend
plt.xlabel('$x$')
plt.ylabel('$f(x)$')
plt.title('$f(x)=xe^{-ax}$')
plt.legend(leg)


# Tighter margins
plt.tight_layout()

# Set your own filename/directory here
fname = "lecture_multiplot.png"
fdir = "/Users/georgestagg/work/coursebuilder/PHY1030/week3/images/"

# Save the file
fig.savefig(fdir+fname, facecolor=(1, 1, 1, 0.8), transparent=True)
