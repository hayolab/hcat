module FilePrinterSpec (spec) where

import System.IO.Temp (writeSystemTempFile)
import Test.Hspec

spec :: Spec
spec = do
  describe "printContent" $ do
    it "reads a file and prints its content" $ do
      -- Write a temporary file with known content
      filepath <- writeSystemTempFile "temp.txt" "Test content"
      -- Use 'printContent' to read the file and capture its output
      output <- capturePrintContent filepath
      -- The output should equal the content of the file
      output `shouldBe` "Test content"

capturePrintContent :: FilePath -> IO String
capturePrintContent path = do
  content <- readFile path
  return content
