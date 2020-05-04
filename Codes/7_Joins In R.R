#################################################################################################
##################################### Joins Using Merge Function ################################
#################################################################################################

cust_data <- read.csv("Customer Data.csv", header = T, stringsAsFactors = F)
order_data <- read.csv("Order Data.csv", header = T, stringsAsFactors = F) 
order_data$OrderDate <- as.Date(order_data$OrderDate, "%m/%d/%Y")

############## Inner Join ##############
######## Returns all rows when there is at least one match in BOTH tables
inner_join_table1 <- merge(x=cust_data, y=order_data, by.x = "CustId", by.y = "CustomerID")

############## Left Join ##############
######## Return all rows from the left table, and the matched rows from the LEFT table
left_join_table1 <- merge(x=cust_data, y=order_data, by.x = "CustId", by.y = "CustomerID", all.x = T)

############## Right Join ##############
######## Return all rows from the right table, and the matched rows from the RIGHT table
right_join_table1 <- merge(x=cust_data, y=order_data, by.x = "CustId", by.y = "CustomerID", all.y = T)

############## Outer Join ##############
######## Return all rows when there is a match in ONE of the tables
outer_join_table1 <- merge(x=cust_data, y=order_data, by.x = "CustId", by.y = "CustomerID", all = T)

############## Cross/ Cartesian Join ##############
######## Cross Product of Two Tables(nrow(x)*nrow(y), ncol(x) + ncol(y)) will be returned
cross_join_table1 <- merge(x=cust_data, y=order_data, by= NULL)

#################################################################################################
##################################### Joins Using DPLYR Package #################################
#################################################################################################
install.packages("dplyr")
require("dplyr")

inner_join_table2 <- inner_join(x=cust_data, y=order_data, by = c("CustId" = "CustomerID"))
left_join_table2 <- left_join(x=cust_data, y=order_data, by = c("CustId" = "CustomerID"))
right_join_table2 <- right_join(x=cust_data, y=order_data, by = c("CustId" = "CustomerID"))
outer_join_table2 <- full_join(x=cust_data, y=order_data, by = c("CustId" = "CustomerID"))

####### Semi Join
####### Return all rows from x where there are matching values in y, keeping just columns from x
semi_join_table <- semi_join(x=cust_data, y=order_data, by = c("CustId" = "CustomerID"))

####### Anti Join
####### Return all rows from x where there are matching values in y, keeping just columns from x
anti_join_table <- anti_join(x=cust_data, y=order_data, by = c("CustId" = "CustomerID"))

#################################################################################################
##################################### Joins Using SQLDF Package #################################
#################################################################################################
install.packages("sqldf")
require("sqldf")

inner_join_table3 <- sqldf("SELECT * FROM cust_data INNER JOIN order_data ON cust_data.CustId = order_data.CustomerID")
left_join_table3 <- sqldf("SELECT * FROM cust_data LEFT OUTER JOIN order_data ON cust_data.CustId = order_data.CustomerID")
right_join_table3 <- sqldf("SELECT * FROM order_data LEFT OUTER JOIN cust_data ON order_data.CustomerID = cust_data.CustId")
############ RIGHT and FULL OUTER JOINs are not currently supported

#################################################################################################
###################################### Joins Using Data Table ###################################
#################################################################################################
install.packages("data.table")
require("data.table")

cust_data_dt <- data.table(cust_data, key = "CustId")
order_data_dt <- data.table(order_data, key = "CustomerID")

inner_join_table4 <- cust_data_dt[order_data_dt,nomatch=0L]
left_join_table4 <- order_data_dt[cust_data_dt]
right_join_table4 <- cust_data_dt[order_data_dt]


#################################################################################################
##################################### Joining Multiple Tables ###################################
#################################################################################################
cust_data_mod <- cust_data
order_data_mod <- order_data
names(order_data_mod)[2] <- "CustId" ###### All Tables Should Have Common Variable

inner_join_table <- Reduce(function(x,y) merge(x, y, by= c("CustId")),list(cust_data_mod,order_data_mod))
left_joined_table <- Reduce(function(x,y) merge(x, y, all.x = TRUE, by= c("CustId")),list(cust_data_mod,order_data_mod))
right_joined_table <- Reduce(function(x,y) merge(x, y, all.y = TRUE, by= c("CustId")),list(cust_data_mod,order_data_mod))
##### list argument can take multiple table names to joins