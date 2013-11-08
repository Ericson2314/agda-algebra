{-# OPTIONS --universe-polymorphism #-}

module Prelude where

  postulate
    Level : Set
    zero : Level
    suc  : Level → Level

  {-# BUILTIN LEVEL     Level #-}
  {-# BUILTIN LEVELZERO zero  #-}
  {-# BUILTIN LEVELSUC  suc   #-}

  infix 4 _≡_

  data _≡_ {i} {A : Set i} (x : A) : A → Set i where
    refl : x ≡ x

  {-# BUILTIN EQUALITY _≡_  #-}
  {-# BUILTIN REFL     refl #-}

  data ⊥ : Set where
  record ⊤ : Set where

  data _×_ {i} (A B : Set i) : Set i where
    _,_ : A → B → A × B
