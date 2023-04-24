#include "add_several.h"
#include <iostream>

namespace TestNamespace {

float add_one(float input) {
  std::cout << "Adding 1 to " << input << "...\n";
  return input + 1;
}
}