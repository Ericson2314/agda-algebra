open import Prelude
     import Algebra.Properties as P

module Algebra.Monoid where

  record monoid {i} (carrier : Set i) : Set (suc i) where
    field
      _·_           : P.bin-op carrier
      e             : carrier

      associativity : P.associativity _·_
      identity      : P.identity      _·_ e
