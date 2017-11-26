{-# LANGUAGE DeriveGeneric #-}

module Series.Type.Article where

import Data.Text
import GHC.Generics
import Network.URI

data Article =
  Article
    { id :: Word
    , title :: Text
    , read :: Bool
    , uri :: URI
    , volume :: Word
    } deriving (Eq, Show, Generic)
