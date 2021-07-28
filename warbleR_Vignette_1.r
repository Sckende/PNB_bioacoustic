# warbleR package - Vignette 1 - introduction to warbleR #
# https://marce10.github.io/warbleR/articles/Intro_to_warbleR.html

#### Selection table ####
# The selection tables are basically data frames in which the information contained has been corroborated so it can be read by other warbleR functions. The selection tables must contain (at least) the following columns: 1-sound files (sound.files), 2-selection (select), 3-start, 4-end

require('warbleR')
data('lbh_selec_table')
lbh_selec_table

# Conversion

data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4"))
writeWave(Phae.long1, file.path(tempdir(), "Phae.long1.wav"))
writeWave(Phae.long2, file.path(tempdir(), "Phae.long2.wav"))
writeWave(Phae.long3, file.path(tempdir(), "Phae.long3.wav"))
writeWave(Phae.long4, file.path(tempdir(), "Phae.long4.wav")) 

# parametres globales
warbleR_options(wav.path = tempdir())

st <- selection_table(X = lbh_selec_table, pb = FALSE)

st
# Selection tables have their own class
class(st)

# Extended selection tables
#  global parameters
warbleR_options(wav.path = tempdir())


ext_st <- selection_table(X = lbh_selec_table, pb = FALSE, 
                          extended = TRUE, confirm.extended = FALSE) # And that is. Now the acoustic data and the selection data (as well as the additional metadata) are all together in a single R object.

# Handling extended selection tables
is_extended_selection_table(ext_st)

ext_st2 <- ext_st[1:2, ]

is_extended_selection_table(ext_st2)

## print
print(ext_st)

# equivalent to ...
ext_st

# Can also join them in rows

ext_st3 <- ext_st[1:5, ]

ext_st4 <- ext_st[6:11, ]

ext_st5 <- rbind(ext_st3, ext_st4)

#print
ext_st5

# igual q el original
all.equal(ext_st, ext_st5)

# Wave object
wv1 <- read_wave(X = ext_st5, index = 3, from = 0, to = 0.37)

class(wv1)
spectro(wv1,
        wl = 150,
        grid = F,
        scale = F,
        ovlp = 90)
