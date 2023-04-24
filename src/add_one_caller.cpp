#include "../lib/add_one.h"
// [[Rcpp::depends(add_one)]]
#include <Rcpp.h>

// [[Rcpp::export]]
float add_one(float input);