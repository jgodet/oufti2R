# showFrameCells.r
# written by JuG
# May 02 2018


#' Plot cells and contours of a given frame
#' @author JuG
#' @description
#' @param frame frame number
#' @param  image image object from \code{readImage}
#' @param data mat data from  \code{readMat}
#' @param number boolean draw cell number if true
#' @details
#' @examples
#'
#'showFrameCells(frame=1, image = image, data = mat,number=FALSE)
#' @return
#' @export


showFrameCells <- function(frame=1, image = cell, data = mat,couleur = 'yellow', number = TRUE){
  if(length(dim(image))>2){
    EBImage::display(image[,,frame],method="raster")
  }else{
    EBImage::display(image,method="raster")
  }

  for (i in 1:data$cellListN[frame]){
    mesh <- data$cellList[[1]][[frame]][[1]][[i]][[1]][,,1]$mesh
    lines(mesh[,1]+1, mesh[,2]+1,col=couleur)
    lines(mesh[,3]+1, mesh[,4]+1,col=couleur)
    cellId <- mat$cellList[,,1]$cellId[[frame]][[1]][[i]]
    if(number){text(x = median(mesh[,3]+1),y =median(mesh[,4]+1),labels = cellId, col=couleur )}
  }
}
