#include "../lib/add_several.h"
#include <Rcpp.h>

// [[Rcpp::export]]
float add_one(float input) {
  return TestNamespace::add_one(input);
}

// [[Rcpp::export]]
float add_two(float input) {
  return TestNamespace::add_two(input);
}


// [[Rcpp::export]]
float add_three(float input) {
  return TestNamespace::add_three(input);
}

// [[Rcpp::export]]
float add_outside(float input);