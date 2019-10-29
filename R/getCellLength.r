# getCellLength.r
# written by JuG
# May 02 2018


#' Extract cell length from mesh contour
#' @author JuG
#' @description
#' @param ouftiCell
#' @param pixSize pixel size (107 nm by default)
#' @details to get size in pixels, set pixSize = 1
#' @examples
#'
#'getCellLength(getCell(data = mat, frame = 1 , cellNb = 25), pixSize = .107)
#' @return
#' @export

getCellLength <- function(ouftiCell, pixSize = .107){
  cellMesh = ouftiCell[,,1]$mesh
  cellMeshSize = dim(cellMesh)[1]
  if(cellMeshSize==1){return(0)}else{
    centerLine = cbind((cellMesh[,1]+cellMesh[,3])/2,(cellMesh[,2]+cellMesh[,4])/2)
    dxy = centerLine[-1,] - centerLine[1:(cellMeshSize-1),]
    dxy = apply(dxy**2, 1, sum )
    cl = sum(sqrt(dxy))* pixSize
    return(cl)
  }

}

