open import Prelude
open import Algebra.Magma

module Algebra.Semigroup where

  associativity : {t : Set} → bin-op t → Set
  associativity {t} _·_ = (a : t) → (b : t) → (c : t) →
                          ((a · b) · c) ≡ (a · (b · c))
