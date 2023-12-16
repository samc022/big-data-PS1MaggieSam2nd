# ---------------------------------------------------------------------------------------------
# File: housekeeping.R
# By: YOUR NAME HERE
# Date: Today's Date
# Description: This file installs and loads packages. It also defines the file paths. Run it 
# before running any other files. In fact, include it all files you run.
# ---------------------------------------------------------------------------------------------

# Include any other folders you may want

# Install packages
#install.packages('tidyverse','ggplot2')
library(tidyverse)
library(ggplot2)

my_project <- '/project/path/'
data <- paste0(my_project, 'data_folder/')
codebook <- paste0(my_project, 'codebook_folder/')
code <- paste0(my_project, 'code_folder/')
