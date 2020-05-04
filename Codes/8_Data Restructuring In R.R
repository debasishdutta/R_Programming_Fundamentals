#########################################################################
################### Data Restructuring Using Reshape ####################
#########################################################################
install.packages("reshape2")
install.packages("dplyr")
require("reshape2")
require("dplyr")


#########################################################################
######################### Melt & Cast Function ##########################
#########################################################################
data(airquality)
molten_data <- melt(airquality, id=c("Month", "Day"), na.rm=TRUE)

######## Monthwise Average
casted_data1 <- dcast(molten_data, variable ~ Month, mean)
agg_data1 <- aggregate(molten_data$value,by=list(molten_data$variable,molten_data$Month), mean, na.rm=TRUE)

###### Only for Specific Value
casted_data2 <- dcast(molten_data, variable ~ Month, mean, subset = .(variable == "Ozone"))

##### Default Function Is Length
casted_data3 <- dcast(molten_data, variable ~ .) 

#### Adding Summary Statistics
casted_data4 <- dcast(molten_data, variable ~ ., mean, margins = TRUE)

