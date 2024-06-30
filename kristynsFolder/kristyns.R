#Kristyns
setwd("/work2/00713/kelly/DATA/REDDIT/reddit")

library(R.utils)
library(data.table) # or library(readr)

# Specify the path to your .zst file
zst_file <- "RC_2005-12.zst" #comments folder, 1st file

# Specify the output path for the decompressed file
decompressed_file <- "RC_2005-12.zst" # Adjust the extension if different

# Decompress the .zst file
decompressFile(zst_file, destname = decompressed_file, remove = FALSE)

# Read the decompressed file into R
data <- fread(decompressed_file) # or read_csv(decompressed_file) for readr

#########################################################################

