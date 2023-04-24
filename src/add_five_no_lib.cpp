#include <iostream>
#include <Rcpp.h>

// [[Rcpp::export]]
float add_five_no_lib(float input) {
  std::cout << "Adding 5 to " << input << "...\n";
  return input + 5;
}
