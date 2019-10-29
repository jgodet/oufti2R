# getMeshContour.r
# written by JuG
# May 02 2018


#' Return mesh contour
#' @author JuG
#' @description
#' @param frame frame number
#' @param cellId cell number to plot
#' @param data mat data from  \code{readMat}
#' @details
#' @examples
#'
#'getMeshContour(frame=1, cellId = 29, data = mat)
#' @return
#' @export


getMeshContour <- function(frame=1, cellId, data = mat){
  IdInFrame <- which(mat$cellList[,,1]$cellId[[frame]][[1]]==cellId)
  mesh <- mat$cellList[[1]][[frame]][[1]][[IdInFrame]][[1]][,,1]$mesh
  return(as.data.frame(mesh))
}
