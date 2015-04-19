module TraficLights (
    TraficLights(..)
) where

data TraficLights = Red | Yellow | Green

instance Eq TraficLights where
    Red == Red = True
    Yellow == Yellow = True
    Green == Green = True
    _ == _ = False

instance Show TraficLights where
    show Red = "red light"
    show Yellow = "yellow light"
    show Green = "green light"

-- class (Eq a) => Num a where
