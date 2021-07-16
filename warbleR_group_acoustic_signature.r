# ------------------------------------------------------------- #
# Evaluating group acoustic signatures using cross-correlation #
# ----------------------------------------------------------- #

# https://marce10.github.io/2019/08/13/group_signature_xcorr.html

# set temporary working directory
setwd(tempdir())
url <- "https://datadryad.org/bitstream/handle/10255/dryad.216487/extended%20selection%20table%20LBH%20songs.zip?sequence=2"

download.file(url = url, destfile = "lbh_est.zip", mode="wb")

unzip("lbh_est.zip")
