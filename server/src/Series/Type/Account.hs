{-# LANGUAGE DeriveGeneric #-}

module Series.Type.Account where

import Data.Text
import GHC.Generics

import Series.Type.Series (Series)

data Account =
  Account
    { id :: Word
    , identifier :: Text
    , name :: Text
    , serieses :: [Series]
    } deriving (Eq, Show, Generic)
