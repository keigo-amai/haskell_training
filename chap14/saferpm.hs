
import Control.Monad

solveRPN :: String -> Maybe Double
solveRPN st = do
    [result] <- foldM foldingFunction [] (words st)
    -- foldingFunctionの結果は[]で包まれているのでパターンマッチで取り出す
    return result

foldingFunction :: [Double] -> String -> Maybe [Double]
-- スタックから2つの数値を取り出し計算した結果をJustで包んでいる
foldingFunction (x:y:ys) "*" = return ((y * x):ys)
foldingFunction (x:y:ys) "+" = return ((y + x):ys)
foldingFunction (x:y:ys) "-" = return ((y - x):ys)
-- 読み取りに失敗した場合はここがNothingを返す
foldingFunction xs numberString = liftM (:xs) (readMaybe numberString)

readMaybe :: (Read a) => String -> Maybe a
readMaybe st = case reads st of [(x, "")] -> Just x
                                -- 読み取りに失敗または読み残し文字がある
                                _ -> Nothing
