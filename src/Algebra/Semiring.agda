open import Prelude
     import Algebra.Properties as P
open import Algebra.Monoid

module Algebra.Semiring where

  record semiring {i} (carrier : Set i) : Set (suc i) where
    field
      addition             : monoid carrier
      multiplication       : monoid carrier

    open monoid addition renaming (_·_ to _+_)
    open monoid multiplication hiding (e)
    field
      commutativity        : P.commutativity _+_
      left-distributivity  : P.distributivity _+_ _·_
      right-distributivity : P.distributivity _+_ λ a b → b · a
      annihilation         : ∀ a → (a · e ≡ e) × (e · a ≡ e)
