open import Prelude
open import Algebra.Magma
open import Algebra.Semigroup

module Algebra.Monoid where

  identity : {t : Set} → bin-op t → t → Set
  identity {t} _·_ e = (a : t) → ((e · a) ≡ a) × ((a · e) ≡ a)
