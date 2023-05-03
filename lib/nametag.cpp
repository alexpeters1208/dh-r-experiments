#include "nametag.h"
#include <iostream>

namespace NametagNamespace {

Nametag::Nametag(std::string name, int age) {
  this->name = name;
  this->age = age;
  this->age_in_months = compute_age_in_months(age);
}

void Nametag::say_hello() {
  std::cout << "Hello! My name is " << name << " and I'm " << age << " years old. \n"
  "I guess that makes me " << age_in_months << " months old. Now I feel old."; 
}

int Nametag::compute_age_in_months(int age) {
  return age * 12;
}

int Nametag::get_age_in_months() {
  return age_in_months;
}

}