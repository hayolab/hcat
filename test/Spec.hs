module Main (main) where

import qualified FilePrinterSpec
import qualified OptionsSpec
import Test.Hspec

main :: IO ()
main = hspec $ do
  FilePrinterSpec.spec
  OptionsSpec.spec
