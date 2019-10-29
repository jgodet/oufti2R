# getCellData.r
# written by JuG
# May 05 2018


#' Extract data on cells
#' @author JuG
#' @description
#' @param mat a mat object returned by \code{readMat}
#' @details
#' @examples
#'
#'statsCells <- getCellData
#' @return dataframe
#' @export


getCellData<- function(mat){
  statsCells <- data.frame()
  for (i in 1:dim(mat$cellListN)[2]){
    for (j in 1:mat$cellListN[,i]){
      cellId <- mat$cellList[,,1]$cellId[[i]][[1]][[j]]
      frame = i
      IdInFrame = j
      stats <- getCellStats(getMeshContour(frame = i, cellId = j,data = mat))
      taille <- getCellLength(getCell(data = mat, frame = i , cellNb = j), pixSize = .107)
      signalFluoTot <- getCellIntegratedFluo(getCell(data = mat, frame = i , cellNb = j))
      signalFluo <- getCellFluo(getCell(data = mat, frame = i , cellNb = j))
      statsCells <- rbind (statsCells, cbind(cellId, frame,IdInFrame,  stats,taille,signalFluo))
    }
  }
  return(statsCells)
}
