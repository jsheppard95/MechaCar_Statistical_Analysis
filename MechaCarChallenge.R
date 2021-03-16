# Import dplyr library
library(dplyr)

# Load "MechaCar_mpg.csv" file into dataframe
infile <- "Resources/MechaCar_mpg.csv"
mechacar_table <- read.csv(infile, check.names=F, stringsAsFactors=F)

head(mechacar_table)

# Perform linear regression to predict mpg from remaining `mechacar_table`
# data. Multiple linear regression model using `lm`
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +
              ground_clearance + AWD, data=mechacar_table)
model
# Get p-value and r-squared for the linear regression model
summary(model)
