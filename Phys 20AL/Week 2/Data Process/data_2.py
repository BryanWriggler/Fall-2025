# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#define constant for needed line
g = 9.807 #gravitational constant

#name list
name_list = ["Kinetic, Angle", "Static, Mass", "Static, Material"]

#import data based on different file name
for name in name_list: #1 to 4 inclusive
    filename = "Data - " + name + ".csv"
    data = pd.read_csv(filename, index_col=0)

    #plot the data in box value
    data.plot.box()

    if name == "Kinetic, Angle":
        plt.ylabel("Traveling Time (s)")
        plt.xlabel("Ramp Angle (Degree)")
        plt.title("Cart's Traveling Time with respect to Ramp Angle")
    elif name == "Static, Mass":
        plt.ylabel("Critical Angle (Degree)")
        plt.xlabel("Mass (kg)")
        plt.title("Critical Angle with respect to Mass of the Cart")
    else:
        plt.ylabel("Critical Angle (Degree)")
        plt.xlabel("Surface")
        plt.title("Critical Angle with respect to Surface of the Ramp")

    #plot the formula predicted values
    #l1 = np.arange(0.3,0.6,0.01)
    #plt.plot(l1, 2*np.pi*np.sqrt(l1/g))

    plt.savefig(name+".png")