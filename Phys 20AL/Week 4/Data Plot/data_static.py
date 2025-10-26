# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

mass = []
length = [0.046,0.096,0.148,0.197,0.246,0.296,0.347,0.397,0.448,0.498]

#plot the data in box value
for n in range(1,11):
    mass.append(n * 0.05)

plt.plot(mass, length)
plt.errorbar(mass, length,
             yerr = 0.001,
             fmt ='o')
plt.xlabel("Mass (kg)")
plt.ylabel("Spring Stretch (m)")

#plot the formula predicted values
#l1 = np.arange(0.3,0.6,0.01)
#plt.plot(l1, 2*np.pi*np.sqrt(l1/g))

plt.savefig("static.png")