#ifndef TRIANGLE_H
#define TRIANGLE_H

namespace triangle
{
  enum class flavor
  {
     equilateral,
     isosceles,
     scalene
  };

  flavor kind(double,double,double);
}

#endif
