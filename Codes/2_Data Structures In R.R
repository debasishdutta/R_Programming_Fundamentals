#############################################################################################
#################################### VECTORS ################################################
#############################################################################################
# A vector is a 1-D data structure used to store ordered set of homogenous type of data, i.e.
# either integer (numbers without decimals) or numeric (numbers with decimals) or character
# (text data) or logical (TRUE or FALSE values).
#############################################################################################

# Creating Vectors
subject_name <- c("Debasish Dutta", "Ranat Kumar Dutta", "Reba Dutta", "Prabir Dey")
temperature <- c(98.1,98.6,101.4, 98.4)
flu_status <- c(FALSE, FALSE, TRUE, FALSE)

# Accessing Third Element of The Temperature Vector
temperature[3]

# Accessing All Elements Starting From 2nd Elements of The Temperature Vector
temperature[2:length(temperature)]

# Accessing All Elements Except 2nd Elements of The Temperature Vector
temperature[-2]

# Accessing All Elements Except 2nd And 4th Elements of The Temperature Vector
temperature[-c(2,4)]

# Accessing 1st And 3rd Elements of The Temperature Vector
temperature[c(TRUE,FALSE,TRUE, FALSE)]

# Finding Position of A Value In A Vector
which(subject_name == "Reba Dutta")

# Sorting Vector
sort(subject_name, decreasing = TRUE)   # Can Not Be Used In Data Frame

# When Different Objects Are Mixed In The Same Vector Coercion Occurs So That Every Element
# In The Vector Is of Same Class/ Mode
x1 <- c(1.7, "a")		# "1.7" "a"
y1 <- c(TRUE, 2)		# 1 2
z1 <- c("a", TRUE)	# "a" "TRUE"

##############################################################################################
#################################### Factors #################################################
##############################################################################################
# A factor is a 1-D data structure used to store nominal/ categorical data. It is more efficient
# than a character vector because factors allows to create additional levels that may not
# appear in the data. This helps more informed treatments of categorical variables while
# model building. Any data which is not in factor's permitted value will be stored as NA.
##############################################################################################

# Creating A Factor With Two Levels
gender <- factor(c("Male", "Male", "Female", "Male"))

# Creating A Factor With Six Levels
blood <- factor(c("O+", "AB-", "A+","O-"),
                levels = c("O+", "O-", "AB+","AB-","A+","A-","B+","B-"),
                ordered = FALSE
)

# Frequency Distribution of Each Levels of A Factor
table(blood)

# Checking How Data Are Internally Stored. If No Level Statement Is Specified Then Numeric Levels
# Will Be Assigned In Alphabatic Order
unclass(blood)

####################################################################################################
#################################### List ##########################################################
####################################################################################################
# A list is a 1-D data structure used to store ordered set of heterogenous type of data. One notable
# difference is that when a list is constructed, you have the option of providing names for each
# value in the sequence of items. The names are not required, but allow the list's values to be
# accessed later on by name, rather than by the numbered position as with vectors.
####################################################################################################

# Creating A List of Five Elements
subject1 <- list(
  fullname = subject_name[1],
  sex = gender[1],
  bloodgrp = blood[1],
  bodytemp = temperature[1],
  flu = flu_status[1]
)

subject2 <- list(
  fullname = subject_name,
  sex = gender,
  bloodgrp = blood,
  bodytemp = temperature,
  flu = flu_status,
  city = c("New Delhi", "Kolkata", "Chennai", "Mumbai")
)

# Accessing Third Element of The Subject1 List
subject1[3]

# Accessing All Elements Starting From 2nd Elements of The Subject1 List
subject1[2:length(subject1)]

# Accessing All Elements Except 2nd Elements of The Subject1 List
subject1[-2]

# Accessing All Elements Except 2nd And 4th Elements of The Subject1 List
subject1[-c(2,4)]

# Accessing 1st And 3rd Elements of The Subject1 List
subject1[c(TRUE,FALSE,TRUE, FALSE)]	#Fifth Element Will Be Display By Default

# Accessing Selected Elements of The Subject1 List
subject1$bodytemp
subject1[c("bloodgrp","flu")]

################################################################################################
#################################### Data Frame ################################################
################################################################################################
# A data frame is a 2 D data structure composite of vectors and or factors (or even matrix) each
# having exactly the same number of values. If we do not specify stringsAsFactors = FALSE option,
# R will automatically convert every character vector to a factor or categorical data.
################################################################################################

# Creating Data Frame Composit of Five Vectors/ Factors
pt_data <- data.frame(subject_name,
                      gender,
                      blood,
                      temperature,
                      flu_status,
                      stringsAsFactors = FALSE)

# Data Frame Can Also Consists of Matrix
x <- c(1,3,5,7,9)
y <- c(2,4,6,8,10)
z <- rbind(x2,y2)
dfname <- data.frame(pt_data,z)

# Structure of Data Frame
class(pt_data)
str(pt_data)
nrow(pt_data)
ncol(pt_data)
attributes(pt_data)			# Returns Row Names, Col Names, Class
typeof(pt_data)

# Each Row In Data Frame Has Exactly One Row Name
row.names(pt_data)
row.names.data.frame(pt_data)

# Extracting All Rows And Columns From The Data Frame
pt_data[,]
pt_data

# Extracting 2nd Row From The Data Frame
pt_data[2,]

# Extracting Data From 2nd Row To 4th Row of The Data Frame
pt_data[2:4,]

# Extracting 3rd Column From The Data Frame
pt_data[,3]
pt_data$blood

# Extracting Data From 3rd Column of The Data Frame
pt_data[,3:length(pt_data)]

# Extracting The Intersection of 1st Row And 4th Column From The Data Frame
pt_data[1,4]

# Extracting Data From 1st, 3rd Rows and 2nd, 4th Columns From The Data Frame
pt_data[c(1,3),c(2,4)]
pt_data[c(-2,-4), c("gender", "temperature")]
pt_data[c(-2,-4), c(-1,-3,-5)]

# Finding Position of A Value In A Data Frame
which(pt_data$subject_name == "Prabir Dey")
which(pt_data$flu_status == FALSE)

# Searching On A Data Frame
pt_data[pt_data$subject_name == "Debasish Dutta",]
pt_data[pt_data$gender != "Male",1]
pt_data[pt_data$gender == "Male",4]
pt_data[pt_data$temperature > 99,]
pt_data[pt_data$gender == "Male" &
          pt_data$subject_name == "Debasish Dutta",]
pt_data[pt_data$gender != "Male" | pt_data$flu_status == FALSE,]

# Sorting In Data Frame
pt_data[order(-pt_data$gender,pt_data$temperature),] # Order Does Not Sort The Data, It Only Gives The Order

# All Returns True If All of The Given Arguments Are TRUE
all(pt_data$gender == "Male") # Return False

# Any Returns True If Any of The Given Arguments Are TRUE
any(pt_data$gender == "Male") # Returns True

# Adding Rows To Data Frame
dfname <-
  rbind(dfname,c("Shampa Dey", "Female", "A-",99.5, FALSE, 12, 14, 16, 18, 20))

# Adding Columns To Data Frame
dfname <-
  cbind(dfname, city = c(
    "Delhi", "Kolkata","Kolkata","North 24 Parganas","North 24 Parganas"
  ))

# Removing Rows From Data Frame
dfname <- dfname[-5,]

# Removing Cols From Data Frame
dfname <- dfname[,-c(6:10)]

#####################################################################################################
#################################### Data Table #####################################################
#####################################################################################################
# Data table inherits from data.frame. It offers fast subset, fast grouping, fast update, fast ordered
# joins and list columns for faster development. It never has rownames. Instead it may have one key of
# one or more columns. This key can be used for row indexing instead of rownames. Several methods are
# provided for data.table, including is.na, na.omit, t, rbind, cbind, merge and others.
#####################################################################################################

# Installing And Loading Package
install.package("data.table")
library(data.table)

# Creating Data Table Composit of Five Vectors/ Factors
pt_data1 <- data.table(subject_name,
                       gender,
                       blood,
                       temperature,
                       flu_status)

# Convert Existing Data Frame Object In To Data Table
pt_data2 <- data.table(pt_data)

# Listing All Data Tables In The Workspace, The Result of tables() Is Itself A data.table
# tables() Is Unrelated To The Base Function table() Which Is Used For Cross Tabulation
tables()

# Setting Key For Sorting, Uniqueness Is Not Enforced; i.e., Duplicate Key Values Are Allowed.
setkey(pt_data1,temperature)		# Table Will Be Sorted Ascending Order of Temperature
setkey(pt_data2,subject_name)		# Table Will Be Sorted A-Z Order of subject_name

# Checking Whether Key Is Enforced or Not
tables()				        # Returns All The Table Names In The Workspace With NROW, NCOL, Key
key(pt_data1)				    # Returns Key of The Data Table
haskey(pt_data1)			  # Returns True/ False
attributes(pt_data)			# Returns Row Names, Col Names, Class, Sorted Variable Name

# Once Key Is Set We can Search Values of All The Columns For A Specific Value of Sorted Variable
pt_data1["Reba Dutta",]
pt_data1["Reba Dutta"]				            # Comma Is Optional
pt_data1[subject_name == "Reba Dutta",]		# If Key Is Not Set

# Setting Key On Multiple Columns
pt_data3 <- as.data.table(pt_data)
setkey(pt_data3,gender,temperature)
pt_data3[J("Male",98.6)]
pt_data3[list("Male",98.6)]

# If Search Results Multiple Entries First And Last Rows
pt_data1["Reba Dutta",mult = "last"]
pt_data1["Reba Dutta",mult = "first"]

# By Default The 2nd Argument Is An Expression
pt_data2[,2]                     # Returns 2
pt_data2[,"Gender"]              # Returns Gender
pt_data2[,subject_name]          # Returns the gender factor
pt_data2[, c(1,3,5),with = FALSE] # Referring To Colums By Number

# Extracting Even Rows
pt_data2[c(FALSE, TRUE)]

################ Data Table Is Faster Than Data Frame #######################################

# Creating A Large Data Frame
df_time <- system.time(df <- data.frame(
  x = rep(LETTERS, each = 1024 ^ 2),
  y = rep(letters, each = 1024),
  v = runif(1024 ^ 2, min = 0, max = 1),
  stringsAsFactors = FALSE
))

# 27262976 Rows Has Been Created
dim(df)
head(df,5)
tail(df,5)
df_time

# Vector Scan
vector_scan = system.time(df_ans <- df[df$x == "R" & df$y == "h",])

# 39936 Rows Returnd
dim(df_ans)
head(df_ans)
tail(df_ans)

# Total Time Elapsed For Vector Scan: 1.11
vector_scan

# Creating A Large Data Table
dt <- as.data.table(df)

# Setting Keys
setkey(dt,x,y)

# Binary Search
binary_search = system.time(dt_ans <- dt[list("R","h")])

# 39936 Rows Returnd
dim(dt_ans)
head(dt_ans)
tail(dt_ans)

# Total Time Elapsed For Vector Scan: 0.1, Data Table Is 91% Faster Than Data Frame
binary_search
identical(dt_ans$v,df_ans$v)

# Fast Grouping In Data Table
dt[,sum(v), by = x]

# Fast Grouping Is Faster Than tapply
df_fg_time = system.time(df_fg <-
                           tapply(df$v,df$x,sum));		# 2.91 Sec Elapsed
dt_fg_time = system.time(dt_fg <-
                           dt[,sum(v), by = x]);		  # 0.31 Sec Elapsed

# Fast Joining Using Data Table
dtx <- data.table(foo = 1:5, a = 20:24, zoo = 5:1)
dty <- data.table(foo = 1:5, b = 30:34, boo = 10:14)
setkey(dtx,foo)
setkey(dty,foo)
dt_join_time <- system.time(dtx[dty])
merge_time <- system.time(merge(dtx, dty))

##############################################################################################
#################################### Matrixes ################################################
##############################################################################################
# A matrix is a 2-D data structure that can contain any single type of data. Although they are
# most often used for mathematical operations and therefore typically store only numeric data.
##############################################################################################

# Creating Matrices
m <- 1:10
dim(m) <- c(2,5)					# 2 Rows & 5 Colums, Data Populated Column-wise

x2 <- c(1,3,5,7,9)
y2 <- c(2,4,6,8,10)
z2 <- cbind(x2,y2)
dimnames(z2) <- list(c("R1","R2","R3","R4","R5"), c("C1","C2"))
z3 <- rbind(x2,y2)
dimnames(z3) <- list(c("R1","R2"), c("C1","C2","C3","C4","C5"))

m1 <- matrix(c("a","b","c","d","e","f"),ncol = 2, byrow = FALSE)		# Data Populated Column-wise
m2 <- matrix(c("a","b","c","d","e","f"),nrow = 2, byrow = FALSE)		# Data Populated Column-wise
m3 <- matrix(c("a","b","c","d","e","f"),ncol = 2, byrow = TRUE)		  # Data Populated Row-wise
m4 <- matrix(c("a","b","c","d","e","f"),nrow = 2, byrow = TRUE)		  # Data Populated Row-wise


# Extracting All Rows And Columns From The Matrix
m4[,]
m4

# Extracting 2nd Row From The Matrix
m4[2,]

# Extracting 3rd Column From The Matrix
m4[,3]

# Extracting The Intersection of 1st Row And 3rd Column From The Matrix
m4[1,3]

# Transposing Matrix
m5 <- t(m)

# Coercing Data Frame In To Matrix. Similar Functions: as.vector, as.list, as.factor, as.data.frame
pt_mat <- as.matrix(pt_data)