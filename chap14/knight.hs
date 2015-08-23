
import Data.List
import Control.Monad

inMany :: Int -> KnightPos -> [KnightPos]
inMany x start  = return start >>= foldr (<=<) return (replicate x moveKnight)

-- *Main Control.Monad> inMany 2 (3,3)
-- [(7,1),(7,3),(3,1),(3,3),(4,4),(6,4),(7,3),(7,5),(3,3),(3,5),(4,6),(6,6),(4,2),(6,2),(3,1),(3,3),(2,4),(3,3),(3,5),(2,6),(2,2),(4,4),(4,6),(1,7),(3,7),(1,3),(3,3),(6,4),(6,6),(2,4),(2,6),(3,7),(5,7),(3,3),(5,3),(4,2),(1,3),(3,3),(6,2),(2,2),(3,3),(5,3)]

canReachIn :: Int -> KnightPos -> KnightPos -> Bool
canReachIn x start end = end `elem` inMany x start

-- *Main Control.Monad> canReachIn 4 (1,1) (2,8)
-- True

type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = do
    (c',r') <- [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1),(c-1,r+2),(c+1,r+2),(c-1,r-2),(c+1,r-2)]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c',r')

-- Main Control.Monad> let f = foldr (<=<) return [(\x -> return (x + 8)),(\x -> return (x * 100)),(\x -> return (x + 1))]
-- Main Control.Monad> Just 1 >>= f
-- Just 208
