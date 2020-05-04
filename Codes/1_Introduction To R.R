#############################################################################
######################## Setting R Working Directory ########################
#############################################################################

getwd()                     #Checking Current Working Directory
setwd("C:\\Session 1")      #Single Back Slash Will Not Work
setwd("C:/Session 1")
getwd()

#############################################################################
########################### Installation R Packages #########################
#############################################################################

install.packages("MASS", repos="http://cran.us.r-project.org", dependencies=TRUE)
install.packages(c("car", "caret","ggplot2", "reshape","TSA", "timeSeries"))
installed.packages()        # Returns A Matrix listing all installed packages

#############################################################################
########################### Loading of R Packages ###########################
#############################################################################

library("MASS")          # Loading Multiple Packages Is Not Possible Directly
library("car")
library("caret")
library("ggplot2")
require("reshape")
require("TSA")
require("timeSeries")

#############################################################################
###################### 	Viewing & Removing R objects  #######################
#############################################################################

a <- 10                                   # Creating A Variable
b <- c("xxx", "yyy", "zzz")               # Creating A Vector
summation <- function(a,b){return(a+b)}   # Creating A User Defined Function
data(ToothGrowth)                         # Loading An Inbuild Data Set 

class(a)                                          
class(b)                                           
class(summation)
class(ToothGrowth)

str(ToothGrowth)                          # Structure of A Data Frame  

ls()                                      # Listing All Objects In R Environment
class(ls())                               # ls returns a character vector
rm(a)                                     # Removing An Object In R Environment 
rm(b, summation)                          # Removing Multiple Objects In A R Environment
rm(list=ls())                             # Removing All Objects From R Environment

#############################################################################
###################### 		Saving & Loading R Workspace  #####################
#############################################################################

save.image(file = "My Workspace.RData")     # Saving All Objects of A R-Session Workspace
save(ToothGrowth, summation, 
     file = "Function_Data.RData")          # Saving Specific Objects of A R-Session Workspace 
##### Remove All Objects & Close The R Session 
load("My Workspace.RData")                  # Loading The R Workspace

#############################################################################
############################ How To Get R Help ##############################
#############################################################################

?min
??min

#############################################################################
########################## 		Data Types In R  ##############################
#############################################################################

x <- 10.5                    # Numeric Data Type, Be careful about assignment operator
y <- 1                       # Numeric Data Type Not An Interger
class(x)
class(y)
is.numeric(x)
is.numeric(y)
is.integer(x)
is.integer(y)

z <- as.integer(3)            # Integer Data Type
m <- as.integer(3.14)         # Integer Data Type Not A Numeric
n <- as.integer("3.14")       # Integer Data Type Not A Character
p <- as.integer("John")       # Not Allowed In R
class(z)
class(m)
class(n)
is.integer(m)
is.character(n)

q <- 1+2i                      # Complex Data Type 
class(q)
is.complex(q)

a <- (1==2)                    # Logical Data Type
b <- (1<2)
c <- ("1"=="1")

fname <- "Debasish"            # Character Data Type
year <-  "2016"                # Character Data Type Not Numeric
class(year)
is.character(fname)

tday1 <- as.Date('2016/04/02', format= "%Y/%m/%d")     # Date Data Type
tday2 <- as.Date('16/04/02', format= "%y/%m/%d")
tday3 <- as.Date('02/04/16', format= "%d/%m/%y")
class(tday3)

#############################################################################
########################### 		Operators In R  #############################
#############################################################################

# Arithmatic Operators
# +	addition        1+1
# -	subtraction     2-1
# *	multiplication  50*5 
# /	division        50/5
# ^ or **	exponentiation   2**5
# x %% y	modulus or remainder (x mod y) 5%%2

# Logical Operator
# <	less than                   1<2
# <=	less than or equal to     2<=2
# >	greater than                3>2
# >=	greater than or equal to  3>=3
# ==	exactly equal to          "Ivy"=="IVY"
# !=	not equal to              "Ivy"!="IVY"    
# !x	Not x                     !TRUE
# x | y	x OR y                   
# x & y	x AND y

x <- c(1:10)
x[(x>8) | (x<5)]

#############################################################################
######################## 	 umeric Functions In R  #########################
#############################################################################
abs(-7.8)	        
sqrt(25)
log(3.14)                 # Log of Base e
log10(3.14)               # Log of Base 10 
exp(10)                   # e^10

rep(1:3,2)
rep(c(5,8,12),2)

d1 <- seq(from = 4, to = 6, by = 0.25)
d2 <- seq(from = 0, to = 100, length.out = 6)
rp_seq <- rep(seq(4,6,0.25),2)
4 %in% rp_seq
which(rp_seq == 4.00)

round(3.475, digits = 2)
signif(3.475, digits = 2)

ceiling(3.475)	# smallest integers not less than 3.475
floor(3.475)	  # the largest integers not greater than 3.475
trunc(3.475)	  # truncating values towards 0

x <- c(-3.2, -1.8, 2.3, 2.9)
x1 <- floor(x)
x2 <- trunc(x)

#############################################################################
########################	Character Functions In R  #########################
#############################################################################

x <- "abcdef"
toupper(x)
tolower("ABCDE")
y <- substr(x, start= 2, stop= 4) 
substr(x,start= 2, stop= 4) <- "234"
n <- grep("Abc", c("abc","Abc","AbC"))
new_list <- strsplit(x,3)

paste("x",1:3, sep = '')
paste(1:3,"x",4:6, sep = 'M')
paste(c(1,4,6), "x", c(7,4,2), sep = '')
paste("Today is", date())

#############################################################################
############################ Missing Values #################################
#############################################################################
# NaN : Undefined Mathematical Operation, Has No Class. NaN is also NA      #
# NA  : Missing Value, Has Class Associated With It. NA is not NaN          #
# NULL: Indicates Empty Value, Used To Initialize A R object                #
#############################################################################

x4 <- c(1,2,3,NA,5)
is.na(x4)		  # FALSE FALSE FALSE  TRUE FALSE
is.nan(x4)		# FALSE FALSE FALSE FALSE FALSE
x5 <- c(1,2,NaN,NA,5)
is.na(x5)		  # FALSE FALSE  TRUE  TRUE FALSE
is.nan(x5)		# FALSE FALSE  TRUE FALSE FALSE
is.null(x4)   # FALSE
is.null(x5)   # FALSE
x6 <- NULL    # Initilizing An Object
class(x6)     # NULL

#############################################################################
######################### Usage of NULL #####################################
#############################################################################

masterdata <- read.csv("Forecast.csv", header = TRUE, stringsAsFactors = FALSE)
error_list <- NULL
for(i in 1:nrow(masterdata)){
  error_list[i] <- abs(masterdata$Actuals[i]-masterdata$Forecasts[i])/masterdata$Actuals[i]
}

masterdata$MAPE <- error_list

#############################################################################
###################### Importing & Exporting Data In R ######################
#############################################################################

masterdata <- read.csv("C:\\Session 1\\Stock Price.csv", header = TRUE, stringsAsFactors = FALSE)
str(masterdata)
masterdata$Date <- as.Date(masterdata$Date, "%Y-%m-%d")
str(masterdata)

masterdata1 <- read.csv("C:\\Session 1\\Used Cars.csv", header = TRUE, stringsAsFactors = FALSE)
masterdata2 <- read.csv("C:\\Session 1\\Used Cars.csv", header = TRUE, stringsAsFactors = TRUE)

write.csv(masterdata, file = "R_Export_Stock.csv", row.names = FALSE)

#############################################################################
######################### If Else Statement #################################
#############################################################################

flag = "No"
if(flag=="No"){
  temp <- 2**5
}else{
  temp <- 2^(1/5)
}

flag1 <- "Yes"
temp1 <- ifelse(flag1 == "No", 2**5, 2^(1/5))

