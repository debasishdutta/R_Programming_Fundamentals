#######################################################################################
############################### Descriptive Statistics ################################
#######################################################################################

# Importing File
usedcars <- read.csv("Used Cars.csv",header = TRUE, stringsAsFactors = FALSE)

# Univariate Statistics
summary(usedcars)             # For All Numeric & Character Variables
min(usedcars$price)           # Minimum of a variable
max(usedcars$price)           # Maximum of a variable
range(usedcars$price)         # Minimum & Maximum of a variable
diff(range(usedcars$price))   # Range of a variable
mean(usedcars$price)          # Average of a variable
median(usedcars$price)        # Median of a variable
quantile(usedcars$price)      # Quantile of a variable
quantile(usedcars$price, probs = c(0.65, 0.85))
quantile(usedcars$price, seq(from = 0, to = 1, by = 0.20))
IQR(usedcars$price)           # Inter Quantile Range of a variable
var(usedcars$price)           # Variance of a variable
sd(usedcars$price)            # Standard Deviation of a variable
length(which(is.na(usedcars$price)== TRUE))          # No of Missing Values
length(usedcars$price)-length(which(is.na(usedcars$price)== TRUE)) # No of Non Missing Values
table(usedcars$color)         # Frequency Distribution
round(prop.table(table(usedcars$color)) * 100,1) # Percentage Distribution
boxplot(usedcars$price, main = "Box-Plot For Price",  
        ylab = "Price ($)") # Outliers: Any Value Lying Beyond 1.5 Time The IQR Is Represented By Circle
hist(usedcars$price, main = "Histogram For Price",  
     ylab = "Frequency", xlab = "Price Interval") # Skewness

# Multivariate Statistics For Numeric Variable

cor(usedcars$price,usedcars$mileage,method = c("pearson", "kendall", "spearman")) # Correlation
cov(usedcars$price,usedcars$mileage,method = c("pearson", "kendall", "spearman")) # Covariance
plot(x= usedcars$mileage, y= usedcars$price, main = "Mileage V/s Price",  
     ylab = "Price", xlab = "Mileage")   # Scattered Plot

# Multivariate Statistics For Categorical Variable

install.packages("gmodels")
library(gmodels)
usedcars$conservative <- usedcars$color %in% c("Black","Gray", "Silver", "White") 
table(usedcars$conservative) # Cross Tabulation
CrossTable(x= usedcars$model, y= usedcars$conservative, chisq = TRUE) # Cross Tabulation

#######################################################################################
################################# Hypothesis Testing ##################################
#######################################################################################

# 1-Sample t-test
x <- c(0.593, 0.142, 0.329, 0.691, 0.231, 0.793, 0.519, 0.392, 0.418)
t.test(x, alternative="two.sided", mu=0.7, conf.level = 0.95) # Two Tailed Test
t.test(x, alternative="less", mu=0.7, conf.level = 0.95)      # Left Tailed Test
t.test(x, alternative="greater", mu=0.7, conf.level = 0.95)   # Right Tailed Test

# 2-Sample t-test
eight_hour_sleep <- c(91, 87, 99, 77, 88, 91)
six_hour_sleep <-  c(101, 110, 103, 93, 99, 104)

var.test(eight_hour_sleep, six_hour_sleep, conf.level = 0.99)

t.test(eight_hour_sleep,six_hour_sleep,alternative="two.sided", var.equal=TRUE, mu= 0, conf.level = 0.99) # Two Tailed
t.test(eight_hour_sleep,six_hour_sleep,alternative="less", var.equal=TRUE, mu= 0, conf.level = 0.99) # Two Tailed
t.test(eight_hour_sleep,six_hour_sleep,alternative="greater", var.equal=TRUE, mu= 0, conf.level = 0.99) # Two Tailed

# Paired t-Test (Two Tailed) of Equal Variance 
Before <- c(237, 289, 257, 228, 303, 275, 262, 304, 244, 233)
After <- c(194, 240, 230, 186, 265, 222, 242, 281, 240, 212)

var.test(Before, After, conf.level = 0.99)

t.test(Before, After, paired=TRUE, mu = 0, alternative = c("two.sided"), var.equal = TRUE, conf.level = 0.95)

# Paired t-Test (Two Tailed) of Unequal Variance 
t.test(Before, After, paired=TRUE, mu = 0, alternative = c("two.sided"), var.equal = FALSE, conf.level = 0.95)

# Paired t-Test (Right Tailed)
t.test(Before, After, paired=TRUE, mu = 0, alternative = c("greater"), var.equal = TRUE, conf.level = 0.95)

# Paired t-Test (Left Tailed)
t.test(Before, After, paired=TRUE, mu = 0, alternative = c("less"), var.equal = TRUE, conf.level = 0.95)