# Sourcing first
source('/Users/samuelcrawford/Desktop/Big Data/big-data-PS1MaggieSam2nd/housekeeping.r')

# Load necessary libraries
library(ggplot2)
library(readr)  # for read_csv
library(dplyr)  # for data manipulation

# Reading the data
file_path <- "data/CollegeAdmissions.csv"  # Adjust this if your file path is different
data <- read_csv(file_path)

# Define the list of colleges
selected_colleges <- c("Amherst College", "Bates College", "Bowdoin College", 
                       "Colby College", "Connecticut College", "Hamilton College", 
                       "Middlebury College", "Trinity College", "Tufts University", 
                       "Wesleyan College", "Williams College")

# Filter the data for the selected colleges
filtered_data <- data %>%
  filter(name %in% selected_colleges)

# Calculate the confidence intervals for rel_attend and rel_apply
filtered_data <- filtered_data %>%
  mutate(
    lower_ci_attend = rel_attend - (1.96 * stderr_rel_attend),
    upper_ci_attend = rel_attend + (1.96 * stderr_rel_attend),
    lower_ci_apply = rel_apply - (1.96 * stderr_rel_apply),
    upper_ci_apply = rel_apply + (1.96 * stderr_rel_apply)
  )

# Create a scatter plot with error bars for rel_attend
plot_attend_ci <- ggplot(filtered_data, aes(x = par_income_bin, y = rel_attend, color = name, group = name)) +
  geom_point() +
  geom_line() +
  geom_errorbar(aes(ymin = lower_ci_attend, ymax = upper_ci_attend), width = 0.6) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("rel_attend by par_income_bin with 95% CI")

# Create a scatter plot with error bars for rel_apply
plot_apply_ci <- ggplot(filtered_data, aes(x = par_income_bin, y = rel_apply, color = name, group = name)) +
  geom_point() +
  geom_line() +
  geom_errorbar(aes(ymin = lower_ci_apply, ymax = upper_ci_apply), width = 0.6) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("rel_apply by par_income_bin with 95% CI")

# Save the plots as JPG
ggsave("plot_attend_ci.jpg", plot = plot_attend_ci, path = "/Users/samuelcrawford/Desktop/Big Data/big-data-PS1MaggieSam2nd/output", type = "cairo", device = "jpg", width = 10, height = 8, units = "in")
ggsave("plot_apply_ci.jpg", plot = plot_apply_ci, path = "/Users/samuelcrawford/Desktop/Big Data/big-data-PS1MaggieSam2nd/output", type = "cairo", device = "jpg", width = 10, height = 8, units = "in")
