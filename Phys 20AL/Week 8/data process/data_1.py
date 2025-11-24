# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

inAngle = [10,20,30,40,50]
n1 = [1.392,1.448,1.486,1.493,1.495]
dn1 = [1.974,0.999,0.658,0.445,0.367]

#plot data
plt.plot(inAngle,n1)
plt.errorbar(inAngle,n1,
             yerr = dn1,
             fmt ='o')

#labels
plt.title("Index of Refraction of Half-Cylinder n2 vs. Input Angle (deg)")
plt.xlabel("Input Angle (deg)")
plt.ylabel("n2")
plt.legend() #show labels for lines


plt.savefig("freq_indep.png")