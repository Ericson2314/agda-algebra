open import Prelude
     import Algebra.Properties as P

module Algebra.AbelianGroup where

  record abelian-group {i} (carrier : Set i) : Set i where
    field
      _·_           : P.bin-op carrier
      e             : carrier

      associativity : P.associativity _·_
      commutativity : P.commutativity _·_
      identity      : P.identity      _·_ e
      inverse       : P.inverse       _·_ e
