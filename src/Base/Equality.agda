open import Base.Level

module Base.Equality where

  infix 4 _≡_

  data _≡_ {i} {A : Set i} (x : A) : A → Set i where
    refl : x ≡ x

  {-# BUILTIN EQUALITY _≡_  #-}
  {-# BUILTIN REFL     refl #-}
