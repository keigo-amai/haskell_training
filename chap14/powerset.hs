import Control.Monad

powerset :: [a] -> [[a]]
powerset xs = filterM (\x -> [True, False]) xs

invPowerset :: [a] -> [[a]]
invPowerset xs = filterM (\x -> [False, True]) xs

-- *Main Control.Monad> powerset [1,2,3]
-- [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
-- *Main Control.Monad> invPowerset [1,2,3]
-- [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
-- *Main Control.Monad> 
