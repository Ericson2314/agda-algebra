open import Prelude
     import Algebra.Properties as P

module Algebra.Magma where

  record magma {i} (carrier : Set i) : Set i where
    field
      _·_     : P.bin-op carrier
