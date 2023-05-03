#ifndef NAMETAG_H
#define NAMETAG_H

#include <iostream>

namespace NametagNamespace {

class Nametag {
public:
  Nametag(std::string n, int a);
  void say_hello();
  int get_age_in_months();
private:
  std::string name;
  int age;
  int age_in_months;
  int compute_age_in_months(int a);
};
}

#endif