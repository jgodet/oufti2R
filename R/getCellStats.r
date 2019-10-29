# getCellStats.r
# written by JuG
# May 03 2018


#' Extract basic statistics from contour (area, perimeter, centroid)
#' @author JuG
#' @description
#' @param frame frame number
#' @param cellId cell number to plot
#' @param data mat data from  \code{readMat}
#' @details
#' @examples
#' meshContour <- getMeshContour(frame=1, cellId = 29, data = mat)
#' getCellStats(meshContour)
#' @return
#' @export


getCellStats<- function(meshContour){
  if(!require(spatstat)){install.packages('spatstat')}
  require('spatstat')
  w <- owin()
  if(length(meshContour>1)){
  try(w <- owin(poly=list(x=c(meshContour[,2],rev(meshContour[,4])),
                      y=c(meshContour[,1],rev(meshContour[,3])))),silent = TRUE)
  try(w <- owin(poly=list(x=c(rev(meshContour[,4]),meshContour[,2]),
                      y=c(rev(meshContour[,1]),meshContour[,3]))),silent = TRUE)
  }
  return(data.frame(area=area(w), perimeter =  perimeter(w), centroid = centroid.owin(w)))
}
