import Control.Monad

binSmalls :: Int -> Int -> Maybe Int
binSmalls acc x
    | x > 9 = Nothing
    | otherwise = Just (acc + x)

-- *Main Control.Monad> foldM binSmalls 0 [2,6,9,4]
-- Just 21
-- *Main Control.Monad> foldM binSmalls 0 [2,6,31,4]
-- Nothing
