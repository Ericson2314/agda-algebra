open import Prelude
import Algebra.Properties as P

module Algebra.Group where

  record group i : Set (suc i) where
    field
      carrier       : Set i
      _·_           : P.bin-op carrier
      e             : carrier

      associativity : P.associativity _·_
      identity      : P.identity      _·_ e
      inverse       : P.inverse       _·_ e
