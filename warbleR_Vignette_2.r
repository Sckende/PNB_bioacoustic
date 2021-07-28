# warbleR package - Vignette 2 - Import sound files and select signals #
# https://marce10.github.io/warbleR/articles/warbleR_workflow_01.html

#### ---> Prepare for analyses ####

### Install packages from CRAN
# Note that if you install from CRAN, then don't run the code to install from GitHub below, and vice versa
# install.packages("warbleR")
# install.packages("Rraven")

### Alternatively, install warbleR and Rraven from GitHub repositories, which contain the latest updates
# Run this ONLY if devtools is not already installed
# install.packages("devtools")

# Load devtools to access the install_github function
library(devtools)

# Install packages from GitHub
# install_github("maRce10/warbleR")
# install_github("maRce10/Rraven")
# install_github("maRce10/NatureSounds")

# Load warbleR and Rraven into your global environment
X <- c("warbleR", "Rraven")
invisible(lapply(X, library, character.only = TRUE))

# To see all functions included in the warbleR package
ls('package:warbleR')

# Make a new directory and set your working directory
# Create a new directory and set your working directory (assuming that you are in your /home/username directory)
# dir.create(file.path(getwd(),"warbleR_example"))
setwd(file.path(getwd(),"warbleR_example"))

# Check your location
getwd()

#### ---> Make long spectrograms oif whole recordings ####
# this part is for using our own data

# Create a vector of all the recordings in the directory
wavs <- list.files(pattern = "wav$")

# Print this object to see all sound files
# 3 sound files
wavs 

# How long are these files? this will determine number of pages returned by full_spectrograms
duration_wavs(wavs,
              path = getwd())

# ovlp = 10 to speed up function
# tiff image files are better quality and are faster to produce
# full_spectrograms(flist = wavs,
#                   ovlp = 10,
#                   it = "tiff",
#                   path = getwd())

#### ---> Select signals in warbleR ####

# Automatically detect signals with auto_detec()
fight <- wavs[1]

select_t <- auto_detec(flist = fight,
                       bp = c(1, 15), # Numeric vector of length 2 giving the lower and upper limits of a frequency bandpass filter (in kHz)
                       threshold = 5, # the amplitude threshold for detecting signals (in %)
                       mindur = 0.5, # the shortest duration (in seconds) of the signals to be detected. It removes signals below that threshold.
                       maxdur = 2, # the longest duration (in seconds) of the signals to be detected. It removes signals above that threshold.
                       # envt = "abs", # DEPRECATED
                       ssmooth = 300,
                       # ls = TRUE, # DEPRECATED
                       # res = 100, # DEPRECATED
                       # flim = c(1, 12), # DEPRECATED
                       wl = 300,
                       # set = TRUE, # DEPRECATED
                       # sxrow = 6, # DEPRECATED
                       # rows = 15, # DEPRECATED
                       # redo = FALSE, # DEPRECATED
                       path = getwd())

# Conversion to selection table (cf vignette 1)
st <- selection_table(X = select_t, pb = FALSE)
