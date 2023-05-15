module Main (main) where

import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "No files provided"
    _ -> mapM_ printContent args

printContent :: FilePath -> IO ()
printContent path = do
  content <- readFile path
  putStr content
