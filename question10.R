
## Sourcing first
source('/Users/samuelcrawford/Desktop/Big Data/big-data-PS1MaggieSam2nd/housekeeping.r')

# Load necessary libraries
library(ggplot2)
library(readr)  # for read_csv
library(dplyr)  # for data manipulation
library(reticulate)
# Reading the data
file_path <- "data/CollegeAdmissions.csv"  # Adjust this if your file path is different
data <- read_csv(file_path)

# Prepare the data for "flagship"
flagship_data <- data %>%
  filter(flagship == 1) %>%
  group_by(par_income_bin) %>%
  summarise(mean_rel_attend = mean(rel_attend, na.rm = TRUE))

# Prepare the data for "Ivy Plus" and "Other Selective Private" under "tier"
tier_data <- data %>%
  filter(tier %in% c("Ivy Plus", "Selective private")) %>%
  group_by(tier, par_income_bin) %>%
  summarise(mean_rel_attend = mean(rel_attend, na.rm = TRUE))

# Combine the data
combined_data <- bind_rows(
  flagship_data %>% mutate(tier = "flagship"),
  tier_data
)

# Plotting
ggplot(combined_data, aes(x = par_income_bin, y = mean_rel_attend, color = tier)) +
  geom_line() +
  scale_color_manual(values = c("flagship" = "red", "Ivy Plus" = "blue", "Selective private" = "yellow")) +
  labs(title = "Mean Relative Attendance Rate by Institution Type and Parental Income",
       x = "Parental Income Bin",
       y = "Mean Relative Attendance Rate",
       color = "Institution Type") +
  theme_minimal()

# Saving the plot to the output folder
output_path <- "output/mean_relative_attendance_rate_plot.png"  # Adjust this if your output path is different
ggsave(output_path, width = 10, height = 8)
