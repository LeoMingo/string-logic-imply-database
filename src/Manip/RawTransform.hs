module Manip.RawTransform
(singleWordList
,incrementalWordList
,sWImplyMap
,iWImplyMap
) where


import Data.List


singleWordList :: String -> [String]
singleWordList strText = words strText

sWImplyMap :: [String] -> [String]
sWImplyMap [x] = [x]
sWImplyMap (x:xs) = x : "-->" : sWImplyMap xs



addSpace :: [String] -> [String]
addSpace [] = []
addSpace [x] = [x]
addSpace (x:xs) = x : " " : addSpace xs

--The first string after inits will be "", so trim it 
trimFirst :: [String] -> [String]
trimFirst [] = []
trimFirst [x] = []
trimFirst (x:xs) = xs

incrementalWordList :: String -> [String]
incrementalWordList strText = trimFirst 
            . map concat 
            . map addSpace . inits . words 
            $ strText 

iWImplyMap :: [String] -> [String]
iWImplyMap [x] = [x]
iWImplyMap (x:xs) = x : "-->" : iWImplyMap xs




