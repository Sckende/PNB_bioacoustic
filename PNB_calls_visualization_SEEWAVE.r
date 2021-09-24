# ---------------------- #
#### SEEWAVE package ####
# -------------------- #

# install.packages("seewave", repos="http://cran.at.r-project.org/")
library(seewave)
library(tuneR)
library(audio)
demo(seewave)
example("meanspec")

# Test on petrel data
# Loading sound file with tuneR package
s.fight <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_fight.wav')
s.fight

s.fight.short <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_fight.wav',
                          from = 2,
                          to = 4.5,
                          units = 'seconds')
s.fight.short
# ---------- #
s.flight.flute <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_flight_FLUTE.wav')
s.flight.flute

s.flight.flute2 <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_flight_FLUTE.wav',
                            from = 2.5,
                            to = 5,
                            units = 'seconds')
s.flight.flute2

s.flight.henni <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_flight_HENNISSEMENT.wav',
                           from = 2,
                           units = 'seconds')
s.flight.henni2 <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_flight_HENNISSEMENT.wav',
                           from = 4.3,
                           to = 6.3,
                           units = 'seconds')
s.flight.henni2

# ---------- #
s.ground <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_ground.wav')
s.ground

s.ground.short <- readWave('C:/Users/ccjuhasz/Desktop/SMAC/GITHUB/PNB-colony/Data/acoustic/PNB_ground.wav',
                           from = 0,
                           to = 16,
                           units = 'seconds')
s.flight.short
# Mono & stereo
range(s.fight@left)
range(s.fight@right)

# Play sound
tuneR::play(s.fight)
tuneR::play(s.fight.short)

tuneR::play(s.flight.flute)
tuneR::play(s.flight.henni)

tuneR::play(tuneR::normalize(s.ground.short))

# Spectrogramm
spectro(s.fight,
        channel = 2)
x11(); par(mfrow = c(1, 2))

spectro(s.fight.short,
        channel = 2,
        flim = c(0, 12))
# spectro(s.fight.short,
#         channel = 1,
#         flim = c(0, 10))

# spectro(s.flight.flute,
#         channel = 2,
#         flim = c(0,10))
spectro(s.flight.flute,
        channel = 1,
        flim = c(0,10))
spectro(s.flight.flute2,
        channel = 1,
        flim = c(0,10))

spectro(s.flight.henni,
        channel = 2,
        flim = c(0,10))
# spectro(s.flight.henni,
#         channel = 1,
#         flim = c(0,10))
spectro(s.flight.henni2,
        channel = 2,
        flim = c(0,10))

spectro(tuneR::normalize(s.ground.short),
        channel = 2,
        flim = c(0, 12))
