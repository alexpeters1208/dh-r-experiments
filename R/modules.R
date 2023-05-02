# modules.R

#' Imports
#' @useDynLib Nametag, .registration = TRUE
#' @export Nametag
#' @import Rcpp
"_PACKAGE"

Rcpp::loadModule(module = "Nametag", TRUE)