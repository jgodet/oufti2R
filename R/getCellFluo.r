# getCellFluo.r
# written by JuG
# May 04 2018


#' Return average fluorescence (signal 1) for a given cell
#' @author JuG
#' @description
#' @param ouftiCell an oufti cell
#' @details
#' @examples
#'
#'
#' @return
#' @export


getCellFluo<- function(ouftiCell){
  signalFluoTot <- getCellIntegratedFluo(ouftiCell)
  stats <- getCellStats(ouftiCell[,,1]$mesh)
  signalFluo <- signalFluoTot/stats$area
  return(signalFluo)
}
