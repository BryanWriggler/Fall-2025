# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#define constant for needed line
g = 9.807 #gravitational constant

#collect mass
mass = [0,5.5,20,66,71.5]

#import data based on different file name
for i in range(1,5): #1 to 4 inclusive
    filename = "Week 1 data - mass"+str(i)+".csv"
    mass_data = pd.read_csv(filename, index_col=0)

    #plot the data in box value
    mass_data.plot.box()
    plt.ylabel("Pendulum Period (s)")
    plt.xlabel("Pendulum Length (m)")
    plt.title("Mass " + str(mass[i]) +" g, Period of Pendulum with respect to Pendulum Length")

    #plot the formula predicted values
    #l1 = np.arange(0.3,0.6,0.01)
    #plt.plot(l1, 2*np.pi*np.sqrt(l1/g))

    plt.savefig("mass"+str(i)+".png")