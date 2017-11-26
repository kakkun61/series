{-# LANGUAGE DeriveGeneric #-}

module Series.Type.Series where

import Data.Text
import GHC.Generics
import Network.URI

import Series.Type.Article (Article)

data Series
  = Series
    { id :: Word
    , title :: Text
    , articles :: [Article]
    , uri :: Maybe URI
    }
  | AnalyzingSeries
    { id :: Word }
  deriving (Eq, Show, Generic)
