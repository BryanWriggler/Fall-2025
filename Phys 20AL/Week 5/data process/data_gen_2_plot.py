# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

v=[
    [55.810,55.490,55.579,55.663,55.914,56.485],
    [79.632,78.239,78.081,79.104,79.061,79.292]
]
dv=[
    [0.033,0.032,0.032,0.032,0.032,0.033],
    [0.047,0.045,0.045,0.046,0.046,0.046]
]
mass = [0.1,0.2]

for i in range(0,2):
    #plot data
    plt.plot(range(1,7), v[i])
    plt.errorbar(range(1,7), v[i],
                yerr = dv,
                fmt ='o')

    #plot the formula predicted values
    m,b = np.polyfit(range(1,7),v[i],deg=1) #returns slope m, intercept b
    xseq = np.linspace(1, 6, num=100)
    plt.plot(xseq, m* xseq + b, label = 'v=%.6f * n + %.6f'%(m,b))

    #change label size
    if i==0:
        plt.ylim(50,60)
    else:
        plt.ylim(69,89)

    #labels
    plt.title("Velocity v (m/s) wrt the nth Resonance, with Mass " + str(mass[i]) + " kg")
    plt.xlabel("Log(T) (N)")
    plt.ylabel("Log(v) (m/s)")
    plt.legend() #show labels for lines


    plt.savefig("v_n_plot"+str(i+1)+".png")
    plt.cla()