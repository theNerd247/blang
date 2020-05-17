module Main where

import Data.Decimal
import Data.Functor.Foldable.TH
import Data.Time.Calendar
import Relude

data Term
  = Lit Lit
  | Var Var
  | Lam Var Term
  | App Term Term
  | Container (Container Term)
 
data Lit 
  = Num Double
  | Bool Bool
  | Text LText
  | Account Account
  | Amount Amount   
  | Trans Transaction
  | Date Date
 
data Container a 
  = List [a]
  deriving (Functor, Foldable, Traversable)
 
-- data DateRange = DateRange
--   { startDate :: Date
--   , endDate   :: Date
--   } deriving (Show)
-- 
 
data Transaction = Transaction
  { date        :: Date
  , fromAccount :: Account
  , toAccount   :: Account
  , description :: Text
  , amount      :: Amount
  } deriving (Show, Eq, Ord)

type Date = Day

type Var = LText
 
type Amount = Decimal
 
type Account = Text 
 
makeBaseFunctor ''Term

main = putStrLn "blang"
