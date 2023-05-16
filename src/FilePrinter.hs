module FilePrinter
  ( printContent,
  )
where

printContent :: Bool -> FilePath -> IO ()
printContent showLineNumber filePath = do
  content <- readFile filePath
  let numberedContent = if showLineNumber then addLineNumbers content else content
  putStr numberedContent

addLineNumbers :: String -> String
addLineNumbers = unlines . zipWith formatLine ([1 ..] :: [Int]) . lines
  where
    formatLine lineNumber line = show lineNumber ++ "\t" ++ line
