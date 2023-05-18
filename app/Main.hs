{-# LANGUAGE TemplateHaskell #-}

module Main (main) where

import FilePrinter
import Options
import Options.Applicative
import TH

version :: String
version = $(TH.readVersion "hcat.cabal")

main :: IO ()
main = do
  opts <- execParser $ info (options <**> helper) fullDesc
  if optVersion opts
    then putStrLn ("hcat version " ++ version)
    else mapM_ (printContent (optShowLineNumber opts)) (optInputFiles opts)
