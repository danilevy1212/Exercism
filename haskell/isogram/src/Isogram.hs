module Isogram (isIsogram) where
import Data.List
import Data.Char

isIsogram :: String -> Bool
isIsogram string =
  lowered == nub lowered
  where lowered = filter isAlpha $ map toLower string
