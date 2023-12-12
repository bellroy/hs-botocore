{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

-- |
-- Module      : Botocore.Service
-- Copyright   : (c) 2023 Bellroy Pty Ltd
-- License     : BSD-3-Clause
-- Maintainer  : Bellroy Tech Team <haskell@bellroy.com>
-- Stability   : provisional
-- Portability : non-portable (GHC extensions)
module Botocore.Service where

import Barbies (Barbie (..))
import Barbies.TH (passthroughBareB)
import Botocore.Service.Metadata (Metadata)
import Botocore.Service.Metadata qualified as Metadata
import Botocore.Service.Operation (Operation)
import Botocore.Service.Operation qualified as Operation
import Data.Aeson.Decoding.Tokens (Tokens (..))
import Data.Aeson.Decoding.Tokens.Direct
  ( Parser,
    field,
    map,
    record,
    text,
  )
import Data.Map (Map)
import Data.Text (Text)
import GHC.Generics (Generic)
import Prelude hiding (map)

data Shape = MkShape deriving (Eq, Show, Generic)

$( passthroughBareB
     [d|
       data Service = Service
         { version :: Text,
           metadata :: Metadata,
           operations :: Map Text Operation,
           shapes :: Map Text Shape,
           documentation :: Text
         }
         deriving stock (Eq, Show, Generic)
       |]
 )

parse :: Parser Tokens k e Service
parse =
  record
    Service
      { version = field "version" text,
        metadata = field "metadata" Metadata.parse,
        operations = field "operations" $ map Operation.parse,
        documentation = field "documentation" text
      }
