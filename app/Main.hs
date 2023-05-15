module Main (main) where

import FilePrinter (printContent)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "No files provided"
    _ -> mapM_ printContent args
