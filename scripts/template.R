# Author: [Your Name]
# Date: [Date]

# USAGE ------------------------------------------------------------------------
# This script is designed to:
# 1. Load xxx.
# 2. Perform xxx.
# 3. Save xxx.
#
# additional info:

# OPTIONS ----------------------------------------------------------------------
# options(scipen = 999)

# PACKAGES ---------------------------------------------------------------------
library(ggplot2)
library(viridis)
library(magrittr)
library(dplyr)
library(stringr)
library(purrr)
library(IMCfuncs)

# I/O --------------------------------------------------------------------------
io <- list(
  inputs = list(
    input_dir = "dir_path_of_input_data",
  ),
  outputs = list(
    out_dir = "dir_path_to_create"
  ),
  plots = list()
)

# create out directory
ndirs(io$outputs)

# create time-stamped output directory
io$outputs$temp_out <- nd(path = io$outputs$out_dir)

# obtain the most-recent data from a time-stamped directory
io$inputs$data <- list.files(io$inputs$input_dir, pattern = "^[T0-9-]+$")
io$inputs$data <- io$inputs$data[order(io$inputs$input_dir, decreasing = TRUE)][[1]]

io$inputs$data <- list.files(
  path = file.path(io$inputs$input_dir, io$inputs$data),
  pattern = "(?i)^[input_data_filename.ext]",
  full.names = TRUE
)

# LOAD DATA --------------------------------------------------------------------
data <- read_csv(io$inputs$data)

# ADD LABELS AND COLOURS -------------------------------------------------------
io$plots$colors <- list(
  diverging = c(
    "#446faa", "#FFFFFF", "#BB4444"
  ),
  positive = c(
    "#D1E6EF", "#ABC4DE", "#9099CA", "#8566B1", "#762D81", "#540046"
  )
)

io$plots$labels <- list()

# CLEAN DATA -------------------------------------------------------------------
# SAVE DATA --------------------------------------------------------------------
# END --------------------------------------------------------------------------
