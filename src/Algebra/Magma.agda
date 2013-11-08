open import Prelude
import Algebra.Properties as P

module Algebra.Magma where

  record magma i : Set (suc i) where
    field
      carrier : Set i
      _·_     : P.bin-op carrier
