{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses, FlexibleInstances #-}

module Series.Type.Relation.Account where

import DataSource (defineTable)

$(defineTable "account")
