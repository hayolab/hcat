module FilePrinter
  ( printContent,
  )
where

printContent :: FilePath -> IO ()
printContent path = do
  content <- readFile path
  putStr content
