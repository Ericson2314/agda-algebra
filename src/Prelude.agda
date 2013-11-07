{-# OPTIONS --universe-polymorphism #-}

module Prelude where

  postulate
    Level : Set
    zero : Level
    suc  : Level → Level

  {-# BUILTIN LEVEL     Level #-}
  {-# BUILTIN LEVELZERO zero  #-}
  {-# BUILTIN LEVELSUC  suc   #-}

  data _≡_ {n} {A : Set n} (x : A) : A → Set n where
    refl : x ≡ x

  {-# BUILTIN EQUALITY _≡_  #-}
  {-# BUILTIN REFL     refl #-}

  data ⊥ : Set where
  record ⊤ : Set where

  data _×_ (A B : Set) : Set where
    _,_ : A → B → A × B
