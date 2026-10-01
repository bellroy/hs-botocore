-- |
-- Module      : Data.Functor.Barbie.Extended
-- Copyright   : (c) 2023 Bellroy Pty Ltd
-- License     : BSD-3-Clause
-- Maintainer  : Bellroy Tech Team <haskell@bellroy.com>
-- Stability   : provisional
-- Portability : non-portable (GHC extensions)
module Data.Functor.Barbie.Extended (module Data.Functor.Barbie, bfor) where

import Data.Functor.Barbie hiding (bfor)

bfor ::
  (TraversableB b, Applicative e) =>
  b f ->
  (forall a. f a -> e (g a)) ->
  e (b g)
bfor b f = btraverse f b
