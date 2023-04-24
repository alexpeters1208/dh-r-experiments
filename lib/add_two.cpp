#include "add_several.h"
#include <iostream>

namespace TestNamespace {

float add_two(float input) {
  std::cout << "Adding 2 to " << input << "...\n";
  return input + 2;
}
}