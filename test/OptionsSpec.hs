module OptionsSpec (spec) where

import Options
import Options.Applicative
import Test.Hspec

spec :: Spec
spec = do
  describe "options" $ do
    it "parses -n as optShowLineNumber" $ do
      let result = execParserPure defaultPrefs (info (options <**> helper) idm) ["-n"]
      case result of
        Success opts -> optShowLineNumber opts `shouldBe` True
        _ -> expectationFailure "Failed to parse options"

    it "parses --number as optShowLineNumber" $ do
      let result = execParserPure defaultPrefs (info (options <**> helper) idm) ["--number"]
      case result of
        Success opts -> optShowLineNumber opts `shouldBe` True
        _ -> expectationFailure "Failed to parse options"
