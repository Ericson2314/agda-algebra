{-# OPTIONS --universe-polymorphism #-}

open import Base.Level

module Base.Types where

  -- cardinality 0

  data ⊥ {i} : Set i where

  ¬ : ∀ {i} (A : Set i) → Set i
  ¬ A = A → ⊥ {zero}


  -- cardinality 1

  record unit {i} : Set i where

  ⊤ : ∀ {i} → Set i
  ⊤ = unit

  record ∑ {α β} {A : Set α} (B : A → Set β) : Set (α ⊔ β) where
    constructor _,_
    field
      projl : A
      projr : B projl

  _×_ : ∀ {α β} → (A : Set α) → (B : Set β) → Set (α ⊔ β)
  A × B = ∑ λ (_ : A) → B


  -- cardinality 2

  data Bool {i} : Set i where
    true  : Bool
    false : Bool

  {-# BUILTIN BOOL  Bool  #-}
  {-# BUILTIN TRUE  true  #-}
  {-# BUILTIN FALSE false #-}

  data _+_ {α β} (A : Set α) (B : Set β) : Set (α ⊔ β) where
    projl : A → A + B
    projr : B → A + B

  decidable : ∀ {i} (A : Set i) → Set i
  decidable A = A + (¬ A)
