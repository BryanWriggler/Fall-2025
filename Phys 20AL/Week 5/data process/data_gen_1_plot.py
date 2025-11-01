# Import the necessary libraries to read
# dataset and work on that
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

logT = [-0.268,0.013,0.196,0.303,0.398,0.477]
logv = [1.694,1.761,1.842,1.907,1.951,1.997]
dlogv = [0.004,0.001,0.001,0.001,0.001,0.001]

#plot data
plt.plot(logT, logv)
plt.errorbar(logT, logv,
             yerr = dlogv,
             fmt ='o')

#plot the formula predicted values
m,b = np.polyfit(logT,logv,deg=1) #returns slope m, intercept b
xseq = np.linspace(-0.268, 0.477, num=100)
plt.plot(xseq, m* xseq + b, label = 'Log(v)=%.6f * Log(T)+%.6f'%(m,b))

#labels
plt.title("Log-Log Plot of Wave Speed (m/s) wrt Tension (N)")
plt.xlabel("Log(T) (N)")
plt.ylabel("Log(v) (m/s)")
plt.legend() #show labels for lines


plt.savefig("v_T_log.png")