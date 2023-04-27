#ifndef ADD_SEVERAL_H
#define ADD_SEVERAL_H

namespace TestNamespace {

float add_one(float input);

float add_two(float input);

float add_three(float input);

inline constexpr double my_special_variable { 24 };
  
}

float add_outside(float input);

#endif