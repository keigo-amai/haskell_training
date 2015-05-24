import TrafficLight
import Tree
-- import qualified Data.Map as Map

main = do print $ fmap (*2) tree
a = [8,6,5,1,3]

tree = foldr treeInsert EmptyTree a

-- instance Functor (Map.Map k) where
--     fmap f (Map.Map k) x = Map.Map k (fmap f x)

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

instance YesNo Bool where
    yesno = id

instance YesNo (Tree k) where
    yesno EmptyTree = False
    yesno _ = True

instance YesNo (Maybe m) where
    yesno Nothing = False
    yesno (Just _) = True

instance YesNo TrafficLight where
    yesno Red = False
    yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal
    then yesResult
    else noResult
