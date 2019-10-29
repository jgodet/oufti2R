# getCellBox.r
# written by JuG
# May 02 2018


#' Extract cell box
#' @author JuG
#' @description
#' @param data mat data from  \code{readMat}
#' @param cellId cell number to plot
#' @param data mat data from  \code{readMat}
#' @details
#' @examples
#' getCellBox(frame=2, cellId=16, data = mat)
#'
#' @return
#' @export


getCellBox <- function(frame=1, cellId, data = mat){
  return( as.data.frame(mat$cellList[[1]][[frame]][[1]][[cellId]][[1]][,,1]$box))
}
