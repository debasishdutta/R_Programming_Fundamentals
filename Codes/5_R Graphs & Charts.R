############################# Scattered Plots ####################################

attach(mtcars)

# Simple Scattered Plot
plot(mtcars$wt, mtcars$mpg, main = "Weight V/s Mileage Scatterplot",
     xlab = "Car Weight ",
     ylab = "Miles Per Gallon ")

# Adding Regression Line To The Existing Plot
library(aplpack)
abline(lm(mtcars$mpg ~ mtcars$wt), col = "blue")

# Adding Lowess Line To The Existing Plot
lines(lowess(mtcars$wt, mtcars$mpg),col = "red")

# Scattered Plot Grouped By A Variable
library(car)
scatterplot(
  wt ~ mpg | cyl, data = mtcars,
  xlab = "Weight of Car", ylab = "Miles Per Gallon",
  main = "Weight V/s Mileage Group By Cyl",
  labels = row.names(mtcars)
)

# Scattered Plot Matrix
pairs(~ mpg + disp + drat + wt,data = mtcars, main = "Correlogram Matrix")

# Scattered Plot Matrix Grouped By A Variable
scatterplot.matrix( ~ mpg + disp + drat + wt | cyl, data = mtcars,
                    main = "Weight V/s Mileage Group By Cyl")

# Conditional Scattered Plot Matrix
library(lattice)
splom(mtcars[c(1,3,5,6)], groups = mtcars$cyl, main = "Correlogram Matrix")

# Scattered Plot Matrix On The Basis of Variables Ordered and Colored By Correlation
library(gclus)
dta <- mtcars[c(1,3,5,6)] # get data
dta.r <- abs(cor(dta)) # get correlations
dta.col <- dmat.color(dta.r) # get colors
# reorder variables so those with highest correlation
# are closest to the diagonal
dta.o <- order.single(dta.r)
cpairs(dta, dta.o, panel.colors = dta.col, gap = .5,
       main = "Variables Ordered and Colored by Correlation")

# Scattered Plot of Single Variable (Grouped, Sorted And Colored)
x <- mtcars[order(mtcars$mpg),] # sort by mpg
x$cyl <- factor(x$cyl) # it must be a factor
x$color[x$cyl == 4] <- "red"
x$color[x$cyl == 6] <- "blue"
x$color[x$cyl == 8] <- "darkgreen"
dotchart(
  x$mpg,labels = row.names(x),cex = 0.5,groups = x$cyl,
  main = "Gas Milage For Car Models\nGrouped By Cylinder",
  xlab = "Miles Per Gallon", gcolor = "black", color = x$color
)

# Bivariate Binning Scattred Plot
library(hexbin)
x <- rnorm(1000)
y <- rnorm(1000)
bin <- hexbin(x,y,xbins = 50)
plot(bin, main = "Bivariate Binning")

# 3-D Scattered Plot
library(scatterplot3d)
scatterplot3d(
  wt,disp,mpg,pch = 16, highlight.3d = TRUE, type = "p", main = "3-D Scattered Plot"
)

# 3-D Scattered Plot With Regression Fitting
sp3d <-
  scatterplot3d(
    wt,disp,mpg,pch = 16, highlight.3d = TRUE, type = "h", main = "3-D Scattered Plot With Regression Fitting"
  )
sp3d$plane3d(lm(mpg ~ wt + disp))

# Spinning 3-D Scattered Plot
library(Rcmdr)
scatter3d(wt, disp, mpg, main = "Spinning Scattered Plot")

############################# Density Plots ######################################

# Simple Histogram
hist(
  mtcars$mpg, breaks = 12, col = "green", main = "Histogram", xlab = "MPG Intervals"
)

# Histogram With Normal Curve
x <- mtcars$mpg
h <-
  hist(
    x, breaks = 12, col = "red", main = "Histogram", xlab = "MPG Intervals"
  )
xfit <- seq(min(x),max(x),length = 40)
yfit <- dnorm(xfit,mean = mean(x),sd = sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col = "blue", lwd = 2)

# Karnel Density Plot
d <- density(mtcars$mpg)
plot(d, main = "Desity Plot")
polygon(d, col = "red", border = "blue")

# Karnel Density Plot Comparing Groups
library(sm)
cyl.f <- factor(
  cyl,
  levels = c(4,6,8),
  labels = c("4 cylinder", "6 cylinder", "8 cylinder")
)
sm.density.compare(mpg, cyl, xlab = "Miles Per Gallon")
colfill <- c(2:(2 + length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill = colfill)

############################# Bar Plots ##########################################

# Horizontal Bar Plot of A Categorical Variable
barplot(
  table(mtcars$gear), main = "Car Distribution", horiz = TRUE,
  names.arg = c("3 Gears", "4 Gears", "5 Gears")
)

# Vertical Bar Plot of A Categorical Variable
barplot(
  table(mtcars$gear), main = "Car Distribution",
  names.arg = c("3 Gears", "4 Gears", "5 Gears")
)

# Stacked Bar Plot
counts <- table(mtcars$vs, mtcars$gear)
barplot(
  counts, main = "Car Distribution by Gears and VS",
  xlab = "Number of Gears", col = c("darkblue","red"),
  legend = rownames(counts)
)

# Grouped Bar Plot
barplot(
  counts, main = "Car Distribution by Gears and VS",
  xlab = "Number of Gears", col = c("darkblue","red"),
  legend = rownames(counts), beside = TRUE
)

############################# Pie Charts ########################################

# Pie Chart with Annotated Percentages
attach(iris)
mytable <- table(iris$Species)
pct <- round(iris$Species / sum(iris$Species) * 100)
lbls <- paste(names(mytable), "\n", mytable, sep = "")
lbls <- paste(lbls,"%",sep = "")
pie(mytable,labels = lbls, col = rainbow(length(lbls)),
    main = "Pie Chart of Species")

# 3-D Pie Chart with Annotated Percentages
library(plotrix)
pie3D(mytable,labels = lbls,explode = 0.2,main = "Pie Chart of Species")

############################# Box Plots ######################################

# Simple Box Plot
boxplot(
  mpg ~ cyl,data = mtcars, col = "darkgreen",main = "Car Milage Data",
  xlab = "Number of Cylinders", ylab = "Miles Per Gallon"
)

# Notched Boxplot (Boxes Colored For Ease of Interpretation)
attach(ToothGrowth)
boxplot(
  len ~ supp * dose, data = ToothGrowth, notch = TRUE,
  col = (c("gold","darkgreen")),
  main = "Tooth Growth", xlab = "Suppliment and Dose"
)

############################# Line Plots ########################################

mydata <- read.csv(file.choose(), sep = ",", header = TRUE)
plot(
  mydata$Close, type = "l", col = "red", xlab = "Closing Stock Price", ylab = "", main = "Stock Price Trends"
)
