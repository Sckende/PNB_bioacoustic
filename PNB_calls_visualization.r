# Visualization of the three main types of call in Mascarene Petrel
# The selection tables were obtained from the Raven Lite 2 software

#### Fight call spectro ####

fight <- read.table("C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/Raven_selection_table/fight_Selections.txt",
                     h = T,
                     dec = '.',
                     sep = '\t')
fight$bottom.freq[fight$bottom.freq > 0] <- 0
is_extended_selection_table(fight)

fight_ext <- selection_table(fight, 
                             pb = F,
                             extended = TRUE,
                             confirm.extended = F,
                             path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')
# long spectrogram for first visualization
full_spectrograms(fight,
                  path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example',
                  sxrow = 7)
sig2noise(fight,
             path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')

# test
wv1 <- read_wave(X = fight,
                 index = 1,
                 from = 0,
                 to = 1,
                 path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')

# spectro(wv2,
#         wl = 512,
#         grid = F,
#         scale = F,
#         ovlp = 0)
# 
# spectro(wv2,
#         wl = 150,
#         grid = F,
#         scale = F,
#         ovlp = 0)

spectro(wv1,
        wl = 150,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 13),
        tlim = c(0.3, 1)#,
        #listen = T
)


for(i in 1:length(fight2$sound.files)){
  start <- fight2$start[i] - 0.3
  end <- fight2$end[i] + 0.3
  
  wv2 <- read_wave(X = fight2,
                   index = 3,
                   from = start,
                   to = end,
                   path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')
  
  spectro(wv2,
          wl = 150,
          grid = T,
          scale = T,
          ovlp = 0,
          flim = c(0, 13),
          main = i#,
          # tlim = c(0.2, 1)#,
          #listen = T
  )
}


#### Flight call spectro ####
flight1 <- read.table("C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/Raven_selection_table/flight_type1_Selections.txt",
                      h = T,
                      dec = '.',
                      sep = '\t')

full_spectrograms(flight1,
                  path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')

flight2 <- read.table("C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/Raven_selection_table/flight_type2_Selections.txt",
                      h = T,
                      dec = '.',
                      sep = '\t')
full_spectrograms(flight2,
                  path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')

wv1 <- read_wave(X = flight1,
                 index = 3,
                 from = 0,
                 to = 8,
                 path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')

spectro(wv1,
        wl = 512,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 10),
        tlim = c(0, 2.6),
        noisereduction = 1
        #listen = T
)

spectro(wv1,
        wl = 512,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 10),
        tlim = c(2.4, 4.6),
        noisereduction = 1
        #listen = T
)

spectro(wv1,
        wl = 512,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 10),
        tlim = c(4.45, 6.5),
        noisereduction = 1
        #listen = T
)

wv2 <- read_wave(X = flight2,
                 index = 1,
                 from = 0,
                 to = 14.5,
                 path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')

spectro(wv2,
        wl = 512,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 10),
        tlim = c(6.5, 9),
        noisereduction = 1
        #listen = T
)

spectro(wv2,
        wl = 512,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 15),
        tlim = c(8.8, 11.4),
        noisereduction = 1
        #listen = T
)

spectro(wv2,
        wl = 512,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 8),
        tlim = c(11, 14),
        noisereduction = 1
        #listen = T
)




for(i in 1:length(flight$sound.files)){
  start <- flight$start[i] - 0.05
  end <- flight$end[i] + 0.3
  
  wv2 <- read_wave(X = flight,
                   index = 3,
                   from = start,
                   to = end,
                   path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')
  
  spectro(wv2,
          wl = 512,
          grid = T,
          scale = T,
          ovlp = 0,
          flim = c(0, 10),
          main = paste(flight$Annotation[i],i)#,
          # tlim = c(0.2, 1)#,
          #listen = T
  )
}

#### Ground call spectro ####
# Test with selection table coming from Raven lite 2 software
ground <- read.table("C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/Raven_selection_table/ground_Selections.txt",
                     h = T,
                     dec = '.',
                     sep = '\t')
full_spectrograms(ground,
                  path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example',
                  sxrow = 15 # seconds per row
                  )

wv2 <- read_wave(X = ground,
                 index = 3,
                 from = 0,
                 to = 7,
                 path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')

# spectro(wv2,
#         wl = 512,
#         grid = F,
#         scale = F,
#         ovlp = 0)
# 
# spectro(wv2,
#         wl = 150,
#         grid = F,
#         scale = F,
#         ovlp = 0)

spectro(wv2,
        wl = 1000,
        grid = T,
        scale = T,
        ovlp = 0,
        flim = c(0, 10),
        tlim = c(0.3, 7)#,
        #listen = T
)


for(i in 1:length(ground$sound.files)){
  start <- ground$start[i] - 0.3
  end <- ground$end[i] + 0.3
  
  wv2 <- read_wave(X = ground,
                   index = 3,
                   from = start,
                   to = end,
                   path = 'C:/Users/Etudiant/Desktop/SMAC/GITHUB/PNB_bioacoustic/warbleR_example')
  
  spectro(wv2,
          wl = 1000,
          grid = T,
          scale = T,
          ovlp = 0,
          flim = c(0, 8),
          main = i#,
          # tlim = c(0.2, 1)#,
          #listen = T
  )
}
