#include "raindrops.h"
#include <vector>

namespace raindrops {
  using std::string;
  using std::pair;

  string convert(int num)
  {
    std::vector<pair <int, string>> tests = { {3, "Pling"},
                                              {5, "Plang"},
                                              {7, "Plong"} };
    string res{""};

    for(auto p : tests)
      if(num % p.first == 0)
        res+= p.second;

    return res.empty() ? std::to_string(num) : res;
  }
}
