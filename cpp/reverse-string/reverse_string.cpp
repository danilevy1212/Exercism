#include "reverse_string.h"
#include <algorithm>

namespace reverse_string
{
  using std::string;
  using std::reverse;

  string reverse_string(string str)
  {
    reverse(str.begin(), str.end());
    return str;
  }
}
