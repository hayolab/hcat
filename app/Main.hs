{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import FilePrinter
import Options
import Options.Applicative

main :: IO ()
main = do
  opts <- execParser $ info (options <**> helper) fullDesc
  mapM_ (printContent (optShowLineNumber opts)) (optInputFiles opts)
