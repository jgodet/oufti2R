# getCellIntegratedPhase.r
# written by JuG
# May 03 2018

# getCellIntegratedFluo.r
# written by JuG
# May 02 2018


#' Extract cell integrated phase signal
#' @author JuG
#' @description
#' @param data mat data from  \code{readMat}
#' @param frame frame number
#' @param cellNb cell number to plot
#' @details
#' @examples
#'
#'getCellIntegratedPhase(getCell(data = mat, frame = 1 , cellNb = 25))
#' @return
#' @export


getCellIntegratedPhase <- function(ouftiCell){
  cellFluo = ouftiCell[,,1]$signal0
  intFluo = sum(cellFluo)
  return(intFluo)
}

