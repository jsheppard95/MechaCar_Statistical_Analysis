# MechaCar_Statistical_Analysis
R script files for statistical analysis of car manufacturing data to identify
predictive variables of fuel efficiency, collect summary statistics on
suspension loads, and analyze the statistical differences among specific
manufacturing lots relative to the entire population.

## Linear Regression to Predict MPG
We first create a linear model for data found in
[`MechaCar_mpg.csv`](Resources/MechaCar_mpg.csv), considering the fuel
efficiency, `mpg`, as a linear combination of `vehicle_length`,
`vehicle_weight`, `spoiler_angle`, `ground_clearance`, and `AWD` (boolean
integer for "All Wheel Drive"). This results in the following model:

![MPG Model](Images/mpg_model.png)

Considering a 5% significance level, we thus see from our model summary above
that the following parameters generate a non-random amount of variance to the
mpg data:

| Parameter        | p-value     |
| -----------      | ----------- |
| vehicle_length   | 2.60e-12    |
| ground_clearance | 5.21e-08    |

while the linear relationship to the other parameters in this data set is
likely due to chance. In addition, we find see from the coeffients that
the slope of this model is non-zero, instead that `mpg` tends to
increase as `vehicle_length` and `ground_clearance` increase:

| Parameter        | Linear Model Coefficient |
| -----------      | -----------              |
| vehicle_length   | 6.267e+00                |
| ground_clearance | 3.546e+00                |

Finally, we see from the multiple r-squared value of 0.71 that this linear
model that this linear model will predict the mpg of MechaCar prototypes
roughly 71% of the time.

## Summary Statistics on Suspension Coils
Next, we generate summary statistics for the pounds per square inch (PSI) of
the suspension coils for each vehicle contained in
[`Suspension_Coils.csv`](Resources/Suspension_Coils.csv). Considering the data
set as a whole, we find the following:

![Total Summary](Images/total_summary.png)

We then group the vehicles by their `Manufacturing_Lot` to obtain the summary
below:

![Lot Summary](Images/lot_summary.png)

Considering a maximum suspension coil weight variance of 100 PSI, we find that
while all manufacturing lots as a group meet this requirement with variance of
62.29 PSI, the breakdown by individual lots shows that `Lot2` exceeds this
threshold with a variance of 170.29 PSI.

## T-Tests on Suspension Coils
Here we perform a T-Tests to compare the mean suspension coil weight of this
data set to the population mean of 1,500 PSI. First considering the data set
as a whole, we find:

![All Lots T-Test](Images/all_lots_t_test.png)

We thus obtain a p-value of 0.06, above the 5% significance level, indicating
the difference in mean suspension coil PSI between all lots in this data set
and the population mean is likely due to chance.

Then considering each lot individually, we obtain the following:

![Individual Lots T-Test](Images/individual_lots_t_test.png)

Summarizing the p-values:

| Manufacturing_Lot | p-value     |
| -----------       | ----------- |
| Lot1              | 1.00        |
| Lot2              | 0.61        |
| Lot3              | 0.04        |

Again assuming a 5% significance level, we can thus conclude that the
differences in mean from the population value for `Lot1` and `Lot2` are
likely due to chance, however the difference for `Lot3` is statistically
significant.