#vignette


require(oufti2R)

#path <- "/Users/jgodet/Seafile/Ma bibliothèque/MaximeLBP/Stack254180424results.mat"
path <- "/Users/jgodet/Seafile/Ma bibliothèque/Code/oufti2R/dataTest/PvdAtimeLapse.mat"
mat <- readMat(path)


#pathPhase <- "/Users/jgodet/Seafile/Ma bibliothèque/MaximeLBP/StackFluo180424254180424.tif"
#pathFluo <- "/Users/jgodet/Seafile/Ma bibliothèque/MaximeLBP/StackFluo180424.tif"


pathPhase <-"/Users/jgodet/Seafile/Ma bibliothèque/Code/oufti2R/dataTest/PvdAtimeLapsePhase.tif"
pathFluo <- "/Users/jgodet/Seafile/Ma bibliothèque/Code/oufti2R/dataTest/PvdAtimeLapseFluo.tif"

imPhase <- oufti2R::readImage(pathPhase)
imFluo <- oufti2R::readImage(pathFluo)

#voir les frames
showFrameCells(frame=1, image = imPhase*12, data = mat,number=T)

#voir les cellules individuelles
showCell(frame=47, cellId = 313, data = mat, image = imPhase*12)




#exemple: obtenir la distribution de taille des cellules (et quelques stats)
statsCells <- getCellData(mat = mat)
head(statsCells)
tail(statsCells)


mod <- lm(signalFluo~  poly(centroid.x,2) + poly(centroid.y,2), data=statsCells)
mod <- lm(signalFluo~  centroid.x + centroid.y + I(centroid.x^2) + + I(centroid.y^2), data=statsCells)
x <- 1:512
y <- 1:512
newData = expand.grid(x,y)
colnames(newData) <- c("centroid.x", "centroid.y")


aa <- matrix(predict(mod,newData), ncol=512, byrow = FALSE)
image(aa)

summary(mod)
hist(statsCells$taille, breaks=25)
hist(statsCells$area/statsCells$perimeter)






statsCells[statsCells$taille>3,]

#autre manière de faire
taille <- numeric()
for (i in 1:dim(mat$cellListN)[2]){
  for (j in 1:mat$cellListN[,i]){
    taille <- c(taille,getCellLength(getCell(data = mat, frame = i , cellNb = j), pixSize = .107))
  }
}
hist(taille)






