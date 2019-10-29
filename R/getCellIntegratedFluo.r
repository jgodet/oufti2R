# getCellIntegratedFluo.r
# written by JuG
# May 02 2018


#' Extract cell integrated fluorescence
#' @author JuG
#' @description
#' @param data mat data from  \code{readMat}
#' @param frame frame number
#' @param cellNb cell number to plot
#' @details
#' @examples
#'
#'getCellIntegratedFluo(getCell(data = mat, frame = 1 , cellNb = 25))
#' @return
#' @export


getCellIntegratedFluo <- function(ouftiCell){
  cellFluo = ouftiCell[,,1]$signal1
  intFluo = sum(cellFluo)
  return(intFluo)
}

