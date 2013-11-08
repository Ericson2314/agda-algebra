{-# OPTIONS --universe-polymorphism #-}

open import Base.Level

module Base.Types where

  -- cardinality 0

  data ⊥ {i} : Set i where

  ¬ : ∀ {i} (A : Set i) → Set i
  ¬ A = A → ⊥ {zero}


  -- cardinality 1

  record unit {i} : Set i where

  ⊤ : {i : Level} → Set i
  ⊤ = unit

  data _×_ {i} (A B : Set i) : Set i where
    _,_ : A → B → A × B


  -- cardinality 2

  data Bool {i} : Set i where
    true  : Bool
    false : Bool

  {-# BUILTIN BOOL  Bool  #-}
  {-# BUILTIN TRUE  true  #-}
  {-# BUILTIN FALSE false #-}
