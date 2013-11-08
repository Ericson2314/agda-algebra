open import Prelude
     import Algebra.Properties as P
open import Algebra.Monoid
open import Algebra.AbelianGroup

module Algebra.Ring where

  record ring {i} (carrier : Set i) : Set i where
    field
      addition             : abelian-group carrier
      multiplication       : monoid carrier

    open abelian-group addition renaming (_·_ to _+_)
    open monoid multiplication
    field
      left-distributivity  : P.distributivity _+_ _·_
      right-distributivity : P.distributivity _+_ λ a b → b · a
