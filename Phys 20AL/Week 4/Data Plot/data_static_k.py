# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

lMass = [-1.301,-1,-0.824,-0.699,-0.602,-0.523,-0.456,-0.398,-0.347,-0.301]
lK = [1.028,1.009,0.998,0.998,0.999,0.997,0.995,0.994,0.994,0.993]


plt.plot(lMass, lK)
plt.xlabel("Log Mass (kg)")
plt.ylabel("Log k (N/m)")
plt.ylim(0.8,1.2)

#plot the formula predicted values
#l1 = np.arange(0.3,0.6,0.01)
#plt.plot(l1, 2*np.pi*np.sqrt(l1/g))

plt.savefig("static_k.png")