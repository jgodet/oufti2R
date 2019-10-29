# showCell.r
# written by JuG
# May 02 2018


#' #' Plot a given cell and its contours
#' @author JuG
#' @description
#' @param frame frame number
#' @param cellId cell number to plot
#' @param  image image object from \code{readImage}
#' @param data mat data from  \code{readMat}
#' @details
#' @examples
#'
#'showCell(frame=1, cellId = 5, data = mat, image = imFluo*5)
#' @return
#' @export


showCell <- function(frame=1, cellId, data = mat, image = cell){
  IdInFrame <- which(mat$cellList[,,1]$cellId[[frame]][[1]]==cellId)
  if(length(IdInFrame)==0)return("cellId not found")
  bb <- getCellBox(frame=frame, cellId = IdInFrame, data = mat)
  if(length(dim(image))>2){
    EBImage::display(image[bb[,1]:(bb[,1]+bb[,3]),bb[,2]:(bb[,2]+bb[,4]),frame],method="raster")
  }else{
    EBImage::display(image[bb[,1]:(bb[,1]+bb[,3]),bb[,2]:(bb[,2]+bb[,4])],method="raster")
  }
  mesh <- getMeshContour(frame=frame, cellId = IdInFrame, data = mat)
  lines( mesh[,1]-bb[,1]+1,mesh[,2]-bb[,2]+1,col='green')
  lines( mesh[,3]-bb[,1]+1, mesh[,4]-bb[,2]+1,col='green')
}
