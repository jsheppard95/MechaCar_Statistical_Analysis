# Import dplyr library
library(dplyr)

# MechaCar_mpg Linear Model

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

# Suspension_Coil Summary Statistics
# Load "Suspension_Coil.csv" file into table
infile <- "Resources/Suspension_Coil.csv"
suspension_table <- read.csv(infile, check.names=F, stringsAsFactors=F)

head(suspension_table)

# Summary statistics of all vehicles
total_summary <- suspension_table %>% summarize(Mean=mean(PSI),
                                                Median=median(PSI),
                                                Variance=var(PSI),
                                                SD=sd(PSI))

# Summary statistics grouped by `Manufacturing_Lot`
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Suspension_Coil T-Tests
# T-Test to determine mean PSI is statistically different from population mean
# of 1500 PSI
t.test(suspension_table$PSI, mu=1500.0)

# Testing mean of each lot individually
lot1_table <- subset(suspension_table, Manufacturing_Lot == "Lot1")
t.test(lot1_table$PSI, mu = 1500.0)

lot2_table <- subset(suspension_table, Manufacturing_Lot == "Lot2")
t.test(lot2_table$PSI, mu = 1500.0)

lot3_table <- subset(suspension_table, Manufacturing_Lot == "Lot3")
t.test(lot3_table$PSI, mu = 1500.0)