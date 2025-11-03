import math

n = 5 #the starting value of n is at least 5, for the problem to make sense
prob = 1.0 #this probability records cummulative probability for k<=4 in each case

while prob >= 0.1 and n <= 100000:
    #update n
    n+=1

    #calculate probability for this n
    temp_prob = 0.0

    for k in range(0,5):  #k ranges from 0 to 4
        temp_prob+= math.comb(n,k) * (3**k) * ((0.25)**n)

    prob = temp_prob #update probability

#when everything ends, print out n
print(n)