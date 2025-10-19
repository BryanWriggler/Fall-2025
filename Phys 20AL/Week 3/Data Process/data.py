# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#define constant for needed line
g = 9.807 #gravitational constant

#import data based on different file name
for i in range(1,3): #1 to 4 inclusive
    filename = "Copy of Data - Collection " + str(i) + ".csv"
    data = pd.read_csv(filename, index_col=0)

    #plot the data in box value
    data.plot.box()

    plt.xlabel("Angle (°)")
    plt.ylabel("Pendulum Period (s)")

    #plot name
    name = ""
    if i==1:
        name = "(With Detector)"
    else:
        name = "(Without Detector)"
    plt.title("Pendulum's Time Period with respect to Maximum Angle" + name)

    #plot the formula predicted values
    #l1 = np.arange(0.3,0.6,0.01)
    #plt.plot(l1, 2*np.pi*np.sqrt(l1/g))

    plt.savefig(str(i)+".png")