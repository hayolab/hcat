{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}

module Options
  ( Options (..),
    options,
  )
where

import Options.Applicative

data Options = Options
  { optShowLineNumber :: Bool,
    optInputFiles :: [String]
  }
  deriving (Show, Eq)

options :: Parser Options
options =
  Options
    <$> switch
      ( long "number"
          <> short 'n'
          <> help "Show line numbers"
      )
    <*> many (argument str (metavar "FILES..."))
