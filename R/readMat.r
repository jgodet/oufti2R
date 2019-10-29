# readMat.r
# written by JuG
# May 02 2018


#' Read oufti output as a .mat file
#' @author JuG
#' @description
#' @param path path to .mat file
#' @details
#' @examples
#' path <- "/Users/jgodet/Desktop/image_6_MMStack_Pos0.ome.mat"
#' path <- "/Users/jgodet/Seafile/Ma bibliothèque/Code/oufti2R/4088mc.mat"
#' mat <- readMat(path)
#'
#' @return mat
#' @export


readMat<- function(path){
  if(!require('R.matlab')){install.packages('R.matlab')}
  require('R.matlab')
  if(file.exists(path)){
    mat <- R.matlab::readMat(con=path)
  }else{
    cat("Path does not exist")
    return()
  }

  Ncell <- mat$cellListN
  cat (sum(Ncell), " cellules in ", dim(mat$cellListN)[2], "frames.\n")
  # string <- paste(attributes(mat$cellList[[1]][[1]][[1]][[1]][[1]])$dimnames[[1]],collapse=',')
  # cat (Ncell, " cellules avec les caractérstiques",string)
  #   #mat$cellList[[1]][[1]][[1]][[1]][[1]][14,,]
    #  mat$cellList[[1]] #meshData length
    #              [[1]] #frame
    #              [[1]] #cell
    #              [[1]] #cell
    #              [[1]] #always 1
    #              [11,,] # 1:algorithme; 2: birthframe; 3: model; 4: mesh;
    #             5: polarity, 6:ancestors, 7:descendants, 8:stage,
    #             9: timelapse, 10:divisions, ...11:box;
    #12: signal0;13: signal1
  return(mat)
}
