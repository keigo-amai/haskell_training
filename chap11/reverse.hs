

-- main = do line <- fmap reverse getLine
--           putStrLn $ "You said " ++ line ++ " backwords!!"
--           putStrLn $ "Yes, you really said " ++ line ++ " backwords!!"

-- main = do line <- fmap (++ "!") getLine
--           putStrLn $ "You said " ++ line ++ " backwords!!"
--           putStrLn $ "Yes, you really said " ++ line ++ " backwords!!"

import Data.Char
import Data.List

main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line
