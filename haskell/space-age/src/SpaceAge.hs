module SpaceAge (Planet(..), ageOn) where

type Seconds = Float

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

secsInEarthYear :: Seconds
secsInEarthYear = 60 * 60 * 24 * 365.25

ageOn :: Planet -> Float -> Float
ageOn planet seconds   = earth_years / in_earth_years
  where earth_years    = (seconds / secsInEarthYear)
        in_earth_years = case planet of
                           Earth   -> 1
                           Mercury -> 0.2408467
                           Venus   -> 0.61519726
                           Mars    -> 1.8808158
                           Jupiter -> 11.862615
                           Saturn  -> 29.447498
                           Uranus  -> 84.016846
                           Neptune -> 164.79132
