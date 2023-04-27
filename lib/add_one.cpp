#include "add_several.h"
#include <iostream>

namespace TestNamespace {

float add_one(float input) {
  std::cout << TestNamespace::my_special_variable;
  std::cout << "Adding 1 to " << input << "...\n";
  return input + 1;
}
}