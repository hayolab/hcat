{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import FilePrinter
import Options
import Options.Applicative

main :: IO ()
main = do
  opts <- execParser $ info (options <**> helper) fullDesc
  if optVersion opts
    then putStrLn "hcat version 1.0.0"
    else mapM_ (printContent (optShowLineNumber opts)) (optInputFiles opts)
