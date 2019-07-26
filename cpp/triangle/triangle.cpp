#include "triangle.h"
#include <stdexcept>

namespace triangle
{
  flavor kind(double a, double b, double c)
  {
    if(a + b <= c || b + c <= a || a + c <= b)
      throw std::domain_error("Impossible triangle");
    if(a == b && a == c)
      return flavor::equilateral;
    if(a == b || a == c || b == c)
      return flavor::isosceles;

    return flavor::scalene;
  }
}
