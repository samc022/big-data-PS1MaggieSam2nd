# Source the housekeeping file to set up your environment
source('/Users/samuelcrawford/Desktop/Big Data/big-data-PS1MaggieSam2nd/housekeeping.R')

# Read the CSV file using the path defined in housekeeping.R
file_path <- paste0(data, 'CollegeAdmissions.csv')  # Using the 'data' path from housekeeping.R

# Read the CSV file into a data frame
data_df <- read_csv(file_path)

# Choose an observation
chosen_index <- 2  # R is 1-indexed, so the second observation is index 2

# Check if the chosen_index is within the range of data_df
if(!is.na(data_df$rel_attend[chosen_index]) && 
   !is.na(data_df$rel_apply[chosen_index]) && 
   !is.na(data_df$rel_att_cond_app[chosen_index])) {
  
  # Check if the ratio is equal to rel_att_cond_app for the chosen observation
  verify <- data_df$rel_attend[chosen_index] / data_df$rel_apply[chosen_index] == data_df$rel_att_cond_app[chosen_index]
  
  # Print the result
  print(if (verify) "Yes" else "No")
} else {
  print("Invalid data or index out of range.")
}
