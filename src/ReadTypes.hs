module ReadTypes where

import Control.Monad (forM)
import Data.List (isInfixOf, isSuffixOf)
import Distribution.Compat.Directory (listDirectory)
import System.Directory (doesDirectoryExist)

isTypeSignature :: String -> Bool
isTypeSignature x = isInfixOf "::" x && not ("=" `isInfixOf` x)

readTypesFile :: FilePath -> IO [String]
readTypesFile filename
  | ".hs" `isSuffixOf` filename = do
      content <- readFile filename
      let ls = lines content
      return (filter isTypeSignature ls)
  | otherwise = return []

qualifiedChildren :: FilePath -> IO [String]
qualifiedChildren path = do
  children <- listDirectory path
  return (map (\name -> path ++ "/" ++ name) children)

readTypesDir :: FilePath -> IO [String]
readTypesDir path = do
  childs <- qualifiedChildren path
  typess <- forM childs readTypes
  return (concat typess)

readTypes :: FilePath -> IO [String]
readTypes path = do
  isDir <- doesDirectoryExist path
  if isDir then readTypesDir path else readTypesFile path

main :: IO ()
main = do
  ts <- readTypes "."
  mapM_ putStrLn ts