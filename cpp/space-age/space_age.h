#ifndef _SPACE_AGE_H
#define _SPACE_AGE_H

namespace space_age
{
  class space_age
  {
  private:
    long _seconds;
    double _earth_years;
  public:
    // Constructor
    space_age(long);

    // Methods
    long seconds() const { return _seconds; }
    double on_earth() const;
    double on_mercury() const;
    double on_venus() const;
    double on_mars() const;
    double on_jupiter() const;
    double on_saturn() const;
    double on_uranus() const;
    double on_neptune() const;
  };
}
#endif
