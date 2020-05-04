#################################################################################################
######################################## Apply Function #########################################
#################################################################################################
#### Description: Returns a vector or array or list of values obtained by applying a function ###
###               to margins of an array or matrix.                                           ###
###  Arguments:   1. X is an array/ matrix/ data convertible in to matrix/ array              ###
###               2. MARGIN is a variable defining how the function is applied:               ###
###               (when MARGIN=1, it applies over rows, whereas with MARGIN=2, it works over  ###
###               columns. When MARGIN=c(1,2) it applies to both rows and columns eventually  ###
###               all elements of the array).                                                 ###
###               3. FUN is any function we want to apply over the selected margin            ###
#################################################################################################
###  Note:        For fast (optimized) means and sums of rows and columns of a 2D matrix,     ###
###               use the functions rowMeans, colMeans, rowSums and colSums.                  ###
#################################################################################################

########## Creating A 2D Matrix #########
m <- matrix(c(1:10, 11:20, 21:30), nrow = 10, ncol = 3)

########## Mean of All The Rows ##########
a1<- apply(m, 1, mean) ### Returns A Vector
a11 <- rowMeans(m, na.rm = T)
a12 <- rowSums(m,na.rm = T)

########## Mean of All The Columns ##########
a2<- apply(m, 2, mean) ### Returns A Vector
a21 <- colMeans(m,na.rm = T)
a22 <- colSums(m, na.rm = T)

########## Divide All The Elements By 2 ##########
a3 <- apply(m, 1:2, function(x) x/2) ### Returns A Matrix

#################################################################################################
######################################## Lapply Function ########################################
#################################################################################################
#### Description: Returns a list of the same length as X, each element of which is the result ###
###               of applying FUN to the corresponding element of X.                          ###
###  Arguments:   1. X is a List/ vector                                                      ###
###               2. FUN is any function we want to apply over the list                       ###
#################################################################################################

####### Create A List #######
b <- list(x = 1, y = 1:3, z = 10:100)
b1 <- lapply(b, length) #### Returns A List

###### Create A List of Matrices #####
A<-matrix(1:9, 3,3)
B<-matrix(4:15, 4,3)
C<-matrix(8:10, 3,2)
MyList<-list(A,B,C) 

list1 <- lapply(MyList,"[",,2) ###### Select Second Column of Each Matrices
list2 <- lapply(MyList,"[",1,) ###### Select First Row of Each Matrices
list3 <- lapply(MyList,"[", 1, 2) ###### Select [1,2]th Element of Each Matrices

#################################################################################################
######################################## Sapply Function ########################################
#################################################################################################
#### Description: sapply works as lapply, but it tries to simplify the output to the most     ###
###               elementary data structure that is possible. So sapply is a 'wrapper'        ###
###               function for lapply.                                                        ###
###  Arguments:   1. X is a List/ vector                                                      ###
###               2. FUN is any function we want to apply over the list                       ###
###               3. if simplify= FALSE then a list will be returned which nothing but lapply ###
###               if simplify= TRUE then output will be the most elementary data structure    ###
#################################################################################################

####### Create A List #######
c <- list(x = 1, y = 1:3, z = 10:100)
c1 <- lapply(c, length) #### Returns A List
c2 <- sapply(c, length, simplify = T)

###### Create A List of Matrices #####
A<-matrix(1:9, 3,3)
B<-matrix(4:15, 4,3)
C<-matrix(8:10, 3,2)
MyList<-list(A,B,C) 

d1 <- lapply(MyList,"[", 2,1 )    ##### Output will be a list
d2 <- unlist(lapply(MyList,"[", 2,1 )) ##### This is an alternative solution equivalent to sapply
d3 <- sapply(MyList,"[", 2,1, simplify=T) ##### Output will be a vector
d4 <- sapply(MyList,"[", 2,1, simplify=F) ##### Equivalent to lapply

#################################################################################################
######################################## Vapply Function ########################################
#################################################################################################
#### Description: vapply is similar to sapply, but has a pre-specified type of return value,  ###
###               so it can be safer (and sometimes faster) to use.                           ###
###  Arguments:   1. X is a List/ vector                                                      ###
###               2. FUN is any function we want to apply over the list                       ###
###               3. FUN.VALUE is the return type of vector/ array                            ###
###               4. USE.NAMES is whether names of X will used in Output                      ###
#################################################################################################

e <- list(a = 1:10, b = 11:20)
e1 <- vapply(e, summary, c("0th Pct"=0, "25th Pct"=0, "50th Pct"=0, "Average"= 0, "75th Pct"=0, 
                           "100th Pct"=0), USE.NAMES = TRUE) #### FUN.VALUE is specified as Integer

#################################################################################################
######################################## Mapply Function ########################################
#################################################################################################
#### Description: vapply is similar to sapply, but has a pre-specified type of return value,  ###
###               so it can be safer (and sometimes faster) to use.                           ###
###  Arguments:   1. FUN is any function we want to apply over the list                       ###
###               2. Vector/ List on which the FUN to be applied                              ###
###               3. if simplify= FALSE then a list will be returned which nothing but lapply ###
###               if simplify= TRUE then output will be the most elementary data structure    ###
###               4. USE.NAMES is whether names of vectors will used in Output                ###
#################################################################################################
###  Note:        Use this when you have several data structures and you want to apply a FUN  ###
###               to the 1st elements of each, and then the 2nd elements of each etc.,        ###
###               coercing the result to a vector/array as in sapply.                         ###
#################################################################################################

######## Create Four Vectors ######
p <- c(1:10)
q <- c(11:20)
r <- c(21:30)
s <- c(31:40)

f1 <- mapply(sum, p,q,r,s,SIMPLIFY = T, USE.NAMES = T)  #### Output will be vector
f2 <- mapply(rep, 1:4, 4:1)    ##### Output will be list

#################################################################################################
######################################## Tapply Function ########################################
#################################################################################################
#### Description: When you want to apply a function to subsets of a vector and the subsets    ###
####              are defined by some other vector, usually a factor.                         ###
###  Arguments:   1. Vector is on which the FUN to be applied                                 ###
###               2. Index is a list of one or more factor                                    ###
###               3. FUN is any function we want to apply over the vector                     ###
###               4. if simplify= FALSE then a list will be returned which nothing but lapply ###
###               if simplify= TRUE then output will be the most elementary data structure    ###
#################################################################################################

data(iris)
g1 <- tapply(iris$Petal.Length, Species, mean)


