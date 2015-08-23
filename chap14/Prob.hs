
import Data.Ratio
import Control.Monad

newtype Prob a = Prob { getProb :: [(a, Rational)] } deriving Show

instance Functor Prob where
    fmap f (Prob xs) = Prob $ map (\(x, p) -> (f x, p)) xs

instance Applicative Prob where
    -- pure x = Prob [(x, 1 % 1)]
    pure = return
    (<*>) = ap

instance Monad Prob where
    return x = Prob [(x, 1 % 1)]
    m >>= f = flatten (fmap f m)
    fail _ = Prob []

flatten :: Prob (Prob a) -> Prob a
flatten (Prob xs) = Prob $ concat $ map multAll xs
    where multAll (Prob innerxs, p) = map (\(x, r) -> (x, p * r)) innerxs
