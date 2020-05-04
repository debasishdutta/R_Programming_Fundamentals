###############################################################################
########################## R User Defined Functions ###########################
###############################################################################

#################
# Function 1: GCD
#################
gcd <- function(a,b) {
  if (b == 0)
    return (a)
  else
    return(gcd(b, a %% b))
}         # Calling GCD Function: gcd(35,42)

#######################
# Function 2: Factorial
#######################
fact <- function(n) {
  return(prod(1:n))
}         # Calling Factorial Function: fact(5)

##############################
# Function 3: Fibonacci Series
##############################
fibo <- function(srlen){
  fibvals <- numeric(srlen)
  fibvals[1] <- 0
  fibvals[2] <- 1
  for (i in 3:srlen) { 
    fibvals[i] <- fibvals[i-1]+fibvals[i-2]
  }
  print(fibvals)
}        # Calling Fibonacci Function: fibo(10)

###############################################################################
############################### R Loops #######################################
###############################################################################

#######################
###### Repeat Statement
#######################
repval <- function(i1,n1) {
  repeat {
    cat("The Value of i=",i1,"\n")
    if (i1 >= n1)
      break
    i1 = i1 + 1
  }
} # Calling repval Function: repval(1,3)

#################
# While Statement
#################
whileval <- function(i2,n2) {
  while (i2 <= n2) {
    print(paste("The Value of i",i2))
    i2 = i2 + 0.5
  }
} # Calling whileval Function: whileval(1,4.5)

###########
#  For Loop
###########
mymat = matrix(nrow=5, ncol=3) # create a 5 x 3 matrix (of 5 rows and 3 columns)
dim(mymat)[1]
dim(mymat)[2]
for(i in 1:dim(mymat)[1])  # for each row
{
  for(j in 1:dim(mymat)[2]) # for each column
  {
    mymat[i,j] = i*j     # assign values based on position: product of two indexes
  }
}

###############################################
# Break Statement Terminates The Innermost Loop
###############################################
for (a in 1:4) {
  for (b in 1:a) {
    if (a == 2 && b == 1)
      # For Multiple Conditions Use Else if
      break
    else
      print(paste(a, b, sep = ","))
  }
}

###############################################
#### Next Statement Skips The Current Iteration
###############################################
for (a in 1:4) {
  for (b in 1:a) {
    if (a == 2 && b == 1)
      next
    else
      print(paste(a, b, sep = ","))
  }
}