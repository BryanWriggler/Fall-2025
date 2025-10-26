# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

mass = [0.1,0.15,0.2]
time = [0.816,0.872,1.008]
RMSD = [0.266,0.232,0.009]


plt.plot(mass, time)
plt.errorbar(mass, time,
             yerr = RMSD,
             fmt ='o')
plt.xlabel("Mass (kg)")
plt.ylabel("Oscillation Period (s)")

#plot the formula predicted values
#l1 = np.arange(0.3,0.6,0.01)
#plt.plot(l1, 2*np.pi*np.sqrt(l1/g))

plt.savefig("dynamic_detect.png")