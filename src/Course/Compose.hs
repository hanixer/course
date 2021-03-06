{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Course.Compose where

import Course.Core
import Course.Functor
import Course.Applicative
import Course.Monad

-- Exactly one of these exercises will not be possible to achieve. Determine which.

newtype Compose f g a =
  Compose (f (g a))
  deriving (Show)

-- Implement a Functor instance for Compose
instance (Functor f, Functor g) =>
    Functor (Compose f g) where
  h <$> (Compose f) = Compose $ (\g -> h <$> g) <$> f
    

instance (Applicative f, Applicative g) =>
  Applicative (Compose f g) where
-- Implement the pure function for an Applicative instance for Compose
  pure a = Compose $ pure $ pure a
-- Implement the (<*>) function for an Applicative instance for Compose
  (Compose fgatob) <*> (Compose fga) = Compose $
    (<*>) <$> fgatob <*> fga

instance (Monad f, Monad g) =>
  Monad (Compose f g) where
-- Implement the (=<<) function for a Monad instance for Compose
  (=<<) = undefined
