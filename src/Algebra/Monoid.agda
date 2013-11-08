open import Prelude
import Algebra.Properties as P

module Algebra.Monoid where

  record monoid i : Set (suc i) where
    field
      carrier       : Set i
      _·_           : P.bin-op carrier
      e             : carrier

      associativity : P.associativity _·_
      identity      : P.identity      _·_ e
