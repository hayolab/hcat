{-# LANGUAGE TemplateHaskell #-}

module TH (readVersion) where

import Data.Maybe (fromMaybe)
import Language.Haskell.TH
import Language.Haskell.TH.Syntax()

readVersion :: String -> Q Exp
readVersion filepath = do
  contents <- runIO $ readFile filepath
  let version = fromMaybe "" $ lookup "version" $ parseCabalFile contents
  [|version|]

-- Simple function to parse version from .cabal file, not covering all cases
parseCabalFile :: String -> [(String, String)]
parseCabalFile = map parseLine . lines
  where
    parseLine line = let (k, v) = break (== ':') line in (trim k, trim (drop 1 v))
    trim = reverse . dropWhile (== ' ') . reverse . dropWhile (== ' ')
