module Acronym (abbreviate, separateByCase) where

import Data.Char
import Data.Bits

separateByCase :: String -> String
separateByCase []  = []
separateByCase [x] = [x]
separateByCase (x:y:xs)
  | xs    == [] = x : []
  | diffCase    = x : ' ' : separateByCase ((toLower y):xsTail)
  | otherwise   = x :       separateByCase (y:xs)
     where
       diffCase = noSpaces &&
         ((isUpper x `xor` isUpper y) || (isLower x `xor` isLower y))
       noSpaces = not (isSpace x || isSpace y)
       xsTail   = tail xs

abbreviate :: String -> String
abbreviate str = let wordList = words .
                                map (\x -> if isPunctuation x then ' ' else x) .
                                filter (/= '\'') $ str
                     unCameled = map (\x -> (head x) : (separateByCase .  tail $ x)) wordList
                 in map (\(x:_) -> toUpper x) . words . unwords $ unCameled