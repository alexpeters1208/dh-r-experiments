#include "add_several.h"
#include <iostream>

namespace TestNamespace {

float add_three(float input) {
  std::cout << "Adding 3 to " << input << "...\n";
  return input + 3;
}
}