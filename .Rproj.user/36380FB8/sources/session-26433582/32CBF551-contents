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

# Create a scatter plot with lines for rel_att_cond_app
plot_rel_att_cond_app <- ggplot(filtered_data, aes(x = par_income_bin, y = rel_att_cond_app, color = name, group = name)) +
  geom_point() +
  geom_line() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("rel_att_cond_app by par_income_bin")

# Save the plot as a JPG
ggsave("plot_rel_att_cond_app.jpg", plot = plot_rel_att_cond_app, path = "/Users/samuelcrawford/Desktop/Big Data/big-data-PS1MaggieSam2nd/output", type = "cairo")
