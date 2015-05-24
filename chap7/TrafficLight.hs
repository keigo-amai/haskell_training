module TrafficLight (
    TrafficLight(..)
) where

-- data TrafficLight = Red | Yellow | Green deriving (Eq, Show)

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red = True
    Yellow == Yellow = True
    Green == Green = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "red light"
    show Yellow = "yellow light"
    show Green = "green light"

-- class (Eq a) => Num a where
