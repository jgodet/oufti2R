# getCell.r
# written by JuG
# May 02 2018


#' Get oufti data for a given cell
#' @author JuG
#' @description
#' @param data mat data from  \code{readMat}
#' @param frame frame number
#' @param cellId cell number to plot
#' @details
#' @examples
#'
#' getCell(data = mat, frame = 1 , cellNb = 21)
#' @return
#' @export


getCell<- function(data = mat, frame = 1 , cellNb = 21){
  ouftiCell <- data$cellList[[1]][[frame]][[1]][[cellNb]][[1]]
  return(ouftiCell)
}
