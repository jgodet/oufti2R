# readImage.r
# written by JuG
# May 02 2018


#' #' Read image (or stack of image) using EBImage
#' @author JuG
#' @description
#' @param pathImage path to image
#' @details
#' @examples
#'pathImage <-"/Users/jgodet/Documents/FLIPdiffusion/180323/image_6_MMStack_Pos0.ome.tif"
#'
#' @return
#' @export


readImage<- function(pathImage){
  if(!require("EBImage")){
    source("https://bioconductor.org/biocLite.R")
    biocLite("EBImage")
  }
  require("EBImage")
  image <- EBImage::readImage(pathImage)
  return(image)
}
