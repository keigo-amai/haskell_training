
-- -- liftM の実装
-- liftM :: (Monad m) => (a -> b) -> m a -> m b
-- liftM f m = m >>= (\x -> return (f x))

-- do 使うバージョン
liftM :: (Monad m) => (a -> b) -> m a -> m b
liftM f m = do
    x <- m -- 文脈から値を取り出し
    return (f x) -- 関数f適用してデフォルトの文脈へ入れる
