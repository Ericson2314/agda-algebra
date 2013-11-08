open import Prelude
     import Algebra.Properties as P

module Algebra.Semigroup where

  record semigroup {i} (carrier : Set i) : Set i where
    field
      _·_           : P.bin-op carrier

      associativity : P.associativity _·_
