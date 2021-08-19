voc <- read.table("C:/Users/Etudiant/Desktop/SMAC/Projet_publi/3-PNB_acoustic/Data_from_Jerome/PNB_voc_number_Dugain_Malabar.txt", sep = '\t', h = T, dec = ',')

voc$rate <- voc$voc_sum/voc$hours

png("G:/Mon Drive/Projet_Publis/PNB_COLONIE/Complete_ms/PNB_Figures/VocPerNight.tiff",
    res=300,
    width=30,
    height= 20,
    pointsize=12,
    unit="cm",
    bg="transparent")

bp <- barplot(voc$rate,
              names.arg = voc$range,
              ylim = c(0, max(voc$rate) + 1),
              ylab = 'Vocalization rate (vocalization number/hour)',
              border = NA)
abline(h = 1:6,
       col = 'grey',
       lty = 3)

text(bp, 0.1, paste('(',round(voc$hours),')'),cex=1,pos=3)

dev.off()
