# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#define constant for needed line
g = 9.807 #gravitational constant
amplitude = [0.02,0.04,0.06]
averagePeriod = [
    [0.767,0.777,0.785],
    [1.001,0.995,1.008],
    [1.186,1.177,1.190]
]
RMSD = [
    [0.014,0.015,0.001],
    [0.005,0.008,0.005],
    [0.012,0.008,0.001]
]

#import data based on different file name
for i in range(0,3):

    #plot the data in box value
    plt.plot(amplitude, averagePeriod[i])
    plt.errorbar(amplitude, averagePeriod[i],
             yerr = RMSD[i],
             fmt ='o')

    plt.xlabel("Max Amplitude (m)")
    plt.ylabel("Spring Oscillation Period (s)")
    plt.ylim(0.7, 1.3)


    plt.savefig("dynamic_nodetect_"+str(i+1)+".png")
    plt.cla()