{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses, FlexibleInstances, DeriveGeneric #-}

module Series.Type.Relation.Account where

import DataSource (defineTable)

$(defineTable "account")
