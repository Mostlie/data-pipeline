#! /uufs/chpc.utah.edu/sys/installdir/R/3.4.1i/bin/R
# Ben Fasoli

# Data processing working directory
# Should contain subdirectories
#   proc/ : containing data processing source code
#   data/ : containing data archive in site/instrument/(raw,qaqc,calibrated)
setwd('/uufs/chpc.utah.edu/common/home/lin-group2/measurements-beta')

# Set timezone
Sys.setenv(TZ = 'UTC')

# Global options
options(stringsAsFactors = F)

# Load library dependencies
for (lib in c('data.table', 'dplyr', 'fasttime', 'jsonlite', 'RCurl', 'readr', 'stringr', 
              'uataq')) {
  invisible(
    suppressPackageStartupMessages(
      library(lib, character.only = T,
              lib.loc = '/uufs/chpc.utah.edu/common/home/u0791983/.Rpackages')
    )
  )
}

# Load functions contained in proc/src
for (fun in dir('proc/src', full.names = T)) {
  source(fun)
}

# Load configurations contained in proc/config
site_config <- fread('proc/config/site_config.csv')
data_config <- fromJSON('proc/config/data_config.json')

# Force global reprocess
# site_config$reprocess <- T
