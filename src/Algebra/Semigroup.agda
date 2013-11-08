open import Prelude
import Algebra.Properties as P

module Algebra.Semigroup where

  record semigroup i : Set (suc i) where
    field
      carrier       : Set i
      _·_           : P.bin-op carrier

      associativity : P.associativity _·_
