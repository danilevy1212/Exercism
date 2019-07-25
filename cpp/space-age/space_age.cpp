#include "space_age.h"

namespace space_age
{
  space_age::space_age(long s)
  {
    _seconds=s;
    _earth_years=s / 31557600.0;
  }

  double space_age::on_earth() const
  {
    return _earth_years;
  }

  double space_age::on_mercury() const
  {
    return _earth_years / 0.2408467;
  }

  double space_age::on_venus() const
  {
    return _earth_years / 0.61519726;
  }

  double space_age::on_mars() const
  {
    return _earth_years / 1.8808158;
  }

  double space_age::on_jupiter() const
  {
    return _earth_years / 11.862615;
  }

  double space_age::on_saturn() const
  {
    return _earth_years / 29.447498;
  }

  double space_age::on_uranus() const
  {
    return _earth_years / 84.016846;
  }

  double space_age::on_neptune() const
  {
    return _earth_years / 164.79132;
  }
}

