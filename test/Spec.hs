module Main (main) where

import qualified FilePrinterSpec
import Test.Hspec

main :: IO ()
main = hspec $ do
  FilePrinterSpec.spec
