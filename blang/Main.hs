{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE GADTs #-}


module Main where

import Data.Decimal
import Data.Time.Calendar
import qualified Data.Text as T

data Term
  = Lit Lit
  | Var Var
  | Lam Var Blang
  | App Blang Blang
  | Container (Container Term)
  deriving (Functor)

data Lit 
  = Num Double
  | Bool Boolean
  | Text T.Text
  | Account Account
  | Amount Amount   
  | Trans Transaction
  | DateRange DateRange
  | Date Date

type Transactions =  ???

type Query = ???

data Containers a 
  = List [a]

data DateRange = DateRange
  { startDate :: Date
  , endDate   :: Date
  } deriving (Show)

type Date = Day

data Transaction = Transaction
  { date        :: Date
  , fromAccount :: Account
  , toAccount   :: Account
  , description :: T.Text
  , amount      :: Amount
  } deriving (Show, Eq, Ord)

type Var = T.Text

type Amount = Decimal

type Account = T.Text 

-- DatePeriod ~ Fix $ ListF Date
--
-- implicit 
--  
--   (Date -> Bool) -> (Transaction -> Bool) --> Query
--
-- explicit
--
--   [Date] -> (Transaction -> Bool) --> Query
--
-- (+) :: Date -> Period -> DatePeriod
-- d + p = every p d `before` (d + 2*p)
--
-- (-) :: DatePeriod -> DatePeriod -> DatePeriod
-- p1 - p2 = sort $ p1 ++ p2
--
-- every p d0 :: Period -> Date -> DatePeriod
-- every p = unfold (\d -> (d, d + p))
--
-- before :: DatePeriod -> Date -> DatePeriod
-- before dp d0 = 

-- Builtins / Algrebra
-- ---------------------
--
-- liftAccumPred     :: (Transactions -> Bool) -> Query
-- liftPred          :: (Transaction -> Bool) -> Query
-- modifyTrans       :: (Transaction -> Transaction) -> Query -> Query
-- modifyQueryName   :: (Text -> Text) -> Query -> Query
-- and, or           :: Query -> Query -> Query
-- not               :: Query -> Query
--
-- like :: Text -> Regex -> Bool
-- (<, <=, =, >=, >) :: Num -> Num -> Bool 
--
-- betweenDate :: DateRange -> Date -> Bool
--
-- totalAmount :: Transactions -> Amount
--
-- from :: Account -> Account -> Bool
-- to   :: Account -> Account -> Bool
-- (~>) :: Account -> Account -> Transaction -> Bool
--
-- transDesc   :: Transaction -> Text
-- transAmount :: Transaction -> Amount
-- transDate   :: Transaction -> Date
-- transTo     :: Transaction -> Account
-- transFrom   :: Transaction -> Account
--
--
-- What are the properties of this algebra?
--
-- Evaluators / Misc
-- ------------
-- runQuery          :: Query -> Transactions -> QueryResult
-- report            :: QueryResult -> IO ()
-- mkTrans           :: Desc -> Account -> Account -> Amount -> Transaction
-- simulateRegex     :: Regex -> String
-- simulateTrans     :: Date -> Query -> Maybe Transaction
-- loadCSV           :: FilePath -> Transactions
-- simulate          :: DateRange -> Query -> Transactions
 
-- Text      :: Text
-- Bool      :: Bool
-- Regex     :: Regex
-- Account   :: NonEmpty Text
-- Amount    :: Double
-- Account   :: Text 
-- Date      :: Day
-- DateRange :: [Day]
-- Query     :: State Transactions Transactions
 
-- It might be useful to make Queries 1st class citizens...

makeFree ''BlangF

main = undefined
