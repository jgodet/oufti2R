# getOuftiBatchFile.r
# written by JuG
# May 08 2018


#' Create a *.btc file to command for Oufti Batch Processing
#' @author JuG
#' @description
#' @param filename name of the *.btc file
#' @param pathPhase  vector of paths to the Phase stack
#' @param pathFluo  vector of paths to the Fluorescence stack
#' @param pathSet  vector of paths to the oufti set parameters (*.set files)
#' @param pathMat vector of paths to the oufti .mat output (*.set files)
#' @details
#' @examples
#'  filename <- c("aaatest")
#'  pathPhase  = c("D:/Data/JuG/stacks/1_Phase.tif","bb")
#'  pathFluo = c("D:/Data/JuG/stacks/1_Fluo.tif","bbb")
#'  pathSet <- c("D:/Data/JuG/PseudoOufti.set","bbb")
#'  pathMat <- c( getwd(),"bbb")
#'  getOuftiBatchFile(filename =filename ,pathPhase = pathPhase,pathFluo = pathFluo,pathSet = pathSet,pathMat = pathMat)
#' @return void -- create a *.btc file
#' @export


getOuftiBatchFile<- function(filename, path=getwd(),pathPhase, pathFluo, pathSet, pathMat){
  fileName = paste(path,'/',filename,".btc", sep="")
  write(NULL, file = fileName)
  nb <- length(pathPhase)

  for (i in 1:nb){
  string = paste("job = ",i,"\nbloadsgn1chk = 1\nbloadsgn1 = ",pathPhase[i],"\nbloadsgn3chk = 1")
  write(string, file = fileName, append=TRUE)
  string2 <- paste("bloadsgn3 = ",pathFluo[i],"")
  write(string2, file = fileName,append = TRUE)
  string3 <- paste("bloadsgn4chk = 0\nbloadparam = ", pathSet[i])
  write(string3, file = fileName,append = TRUE)
  string4 <- paste("bsubtr3 = 0\nbsubtr4 = 0\nmode = 1\nbadd1 = 1\nbadd3 = 1\nbadd4 = 0\nbaddprev = 1\nbsavemesh =", pathMat[i])
  write(string4, file = fileName,append = TRUE)
  write(paste(" "), file = fileName,append = TRUE)
  }

return(paste("File",toupper(filename),"created in", path))
}
