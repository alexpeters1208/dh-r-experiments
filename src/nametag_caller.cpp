#include "../lib/nametag.h"
#include <Rcpp.h>

namespace Rcpp {

RCPP_MODULE(Nametag) {
  class_<NametagNamespace::Nametag>("Nametag")
  .constructor<std::string, int>()
  .method("say_hello", &NametagNamespace::Nametag::say_hello);
}

}