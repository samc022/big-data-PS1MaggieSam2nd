# ---------------------------------------------------------------------------------------------
# File: download_data.R
# By: YOUR NAME HERE
# Date: Today's Date
# Description: This file downloads and saves the CollegeAdmissions.csv file and its codebook.
# You will need to adapt this code to your own file structure.
# ---------------------------------------------------------------------------------------------

# Insert housekeeping.R to install packages, define directories, etc.

download.file(url='https://opportunityinsights.org/wp-content/uploads/2023/07/CollegeAdmissions_Data.csv',
              destfile=paste0(data,'CollegeAdmissions.csv'))

download.file(url='https://opportunityinsights.org/wp-content/uploads/2023/07/CollegeAdmissions_Codebook.pdf',
              destfile=paste0(documentation,'CollegeAdmissions_Codebook.pdf'))