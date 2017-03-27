import System.Environment
import Data.List
import System.IO

import qualified DBIO.SDBWrite as Sw    
 --sdbWrite

import qualified Manip.RawTransform as Rt   
 --singleWordList
 --incrementalWordList
 --sWImplyMap
 --iWImplyMap

import qualified BasicIO as BIO


{-
 -iplstrdb <Text file name> -o <Result Database name>
 - -}

sWIndexData :: String -> [String]
sWIndexData strInput = Rt.singleWordList strInput

iWIndexData :: String -> [String]
iWIndexData strInput = Rt.incrementalWordList strInput

writeRst :: FilePath -> [String] -> IO ()
writeRst fileName indexList = Sw.sdbWrite fileName indexList


writeMap fileName indexList mapOp = 
    case mapOp of 's' -> BIO.bWrite fileName (Rt.sWImplyMap $ indexList)
                  'i' -> BIO.bWrite fileName (Rt.iWImplyMap $ indexList)                              


main = do
    argv <- getArgs
     
    fileH <- openFile (argv !! 0) ReadMode
    contents <- hGetContents fileH
        
    writeRst ( argv !! 2 ) . sWIndexData $ contents
    writeMap ( argv !! 2 )  ( sWIndexData $ contents ) 's'
    
    writeRst ( argv !! 2 ) .iWIndexData $ contents
    writeMap ( argv !! 2 )  . iWIndexData $ contents  'i'











