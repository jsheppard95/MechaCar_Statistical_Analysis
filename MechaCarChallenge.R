# Import dplyr library
library(dplyr)

# MechaCar_mpg Analysis

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

# Suspension_Coil Analysis
# Load "Suspension_Coil.csv" file into table
infile <- "Resources/Suspension_Coil.csv"
suspension_table <- read.csv(infile, check.names=F, stringsAsFactors=F)

head(suspension_table)

total_summary <- suspension_table %>% summarize(Mean=mean(PSI),
                                                Median=median(PSI),
                                                Variance=var(PSI),
                                                SD=sd(PSI))

lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))