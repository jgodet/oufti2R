# showGrowthCurve.r
# written by JuG
# May 05 2018


#' Plot individual cell growth curves of a getCellData object
#' @author JuG
#' @description
#' @param statsCells a dataframe object - output of \code{getCellData}
#' @param timePerFrame time between two frames
#' @details
#' @examples
#' coul <- matlab.like(50)
#'showGrowthCurve(statsCells = statsCells,timePerFrame = 2,ylim=c(1,4))
#' @return
#' @export


showGrowthCurve<- function(statsCells,timePerFrame = 1,ylim=c(1,4),coul,...){
  xlimits <- range(statsCells$frame)*timePerFrame
  ylimits <- ylim
  for (i in unique(statsCells$cellId)){
    if(i == unique(statsCells$cellId)[1]){
      with( statsCells[statsCells$cellId == i,],plot(frame*timePerFrame,taille,type='l',xlab="time",ylab="Cell Size, µm",xlim=xlimits,ylim=ylimits,
                                                    col=coul[min(statsCells[statsCells$cellId == i,"frame"])]))
    }else{
      with( statsCells[statsCells$cellId == i,],lines(frame*timePerFrame,taille,col=coul[min(statsCells[statsCells$cellId == i,"frame"])]))#col=rgb(.7,.7,.7,.5),...))
    }
  }
}
