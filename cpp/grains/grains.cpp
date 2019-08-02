#include "grains.h"

namespace grains
{
  ull square(int x)
  {
    return 1ULL << (x - 1);
  }

  ull total()
  {
    return ~0ULL;
  }
}
