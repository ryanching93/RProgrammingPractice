N <- 100                      # input/specify sample size
x <- rnorm(N)                 # random normally distributed numbers
counter <- 0                  # counter

for (i in x){                 #iterate over vector of numbers
  if(i < 1 & i > -1){         #condition to check where iterated variable falls
    counter <- counter + 1    #increase counter if condition is met
  } 
}

answer <- counter/N           # calculate hit-ratio
answer                        #print answer in console

Reflections:
- As sample size increases (100, 1000, 10000), the average of the results (counter/N) gets closer to the expected values.
- This proves the theory of LLN, as the number generated gets closer to 68.2% (normal distribution curve). 
